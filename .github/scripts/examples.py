#!/usr/bin/env python3
"""Builds the GitHub Actions matrix of examples to run against Locally.

Examples are found by the file that marks each kind (e.g. `template.json` for
an ARM Template), and the Locally Plugins each one needs are read from the
"Locally Plugin for `...`" lines in its README.

With `--all` every example is included; with `--base <ref>` only the examples
with a file changed since that ref are, unless the CI itself changed, in which
case every example is. Examples are grouped into batches of a single kind, so
that each job sets up one toolchain and starts Locally once.
"""

import argparse
import json
import os
import re
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
BATCH_SIZE = 10
PLUGIN_PATTERN = re.compile(r"Locally Plugin for `([^`]+)`")

# Changes to any of these paths run every example.
RUN_ALL_PATHS = (
    ".github/workflows/examples.yml",
    ".github/scripts/",
)

KINDS = {
    "arm": "arm-templates/*/template.json",
    "bicep": "bicep/*/template.bicep",
    "terraform": "hashicorp-terraform/*/main.tf",
    "opentofu": "opentofu/*/main.tf",
    "go": "azure-sdk-for-go/*/go.mod",
    "dotnet": "azure-sdk-for-dotnet/*/*.csproj",
    "pulumi": "pulumi/*/*/Pulumi.yaml",
}


def discover():
    examples = []
    for kind, pattern in KINDS.items():
        for marker in sorted(ROOT.glob(pattern)):
            directory = marker.parent
            readme = directory / "README.md"
            plugins = PLUGIN_PATTERN.findall(readme.read_text()) if readme.exists() else []
            examples.append({
                "kind": kind,
                "path": directory.relative_to(ROOT).as_posix(),
                "plugins": sorted(set(plugins)),
            })
    return examples


def changed_files(base):
    output = subprocess.run(
        ["git", "diff", "--name-only", f"{base}...HEAD"],
        cwd=ROOT, check=True, capture_output=True, text=True,
    ).stdout
    return [line for line in output.splitlines() if line]


def select(examples, files):
    if any(f.startswith(RUN_ALL_PATHS) for f in files):
        return examples
    return [e for e in examples if any(f.startswith(f"{e['path']}/") for f in files)]


def batch(examples):
    batches = []
    for kind in KINDS:
        of_kind = [e for e in examples if e["kind"] == kind]
        chunks = [of_kind[i:i + BATCH_SIZE] for i in range(0, len(of_kind), BATCH_SIZE)]
        for number, chunk in enumerate(chunks, start=1):
            plugins = sorted({p for e in chunk for p in e["plugins"]})
            batches.append({
                "name": f"{kind} ({number}/{len(chunks)})",
                "kind": kind,
                "paths": " ".join(e["path"] for e in chunk),
                "plugins": ",".join(plugins),
            })
    return batches


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument("--all", action="store_true", help="run every example")
    group.add_argument("--base", help="run the examples changed since this git ref")
    args = parser.parse_args()

    examples = discover()
    if args.base:
        examples = select(examples, changed_files(args.base))
    batches = batch(examples)

    print(f"Running {len(examples)} example(s) in {len(batches)} batch(es):")
    for e in examples:
        print(f"  {e['path']}")

    outputs = {
        "matrix": json.dumps({"include": batches}),
        "any": "true" if batches else "false",
    }
    if "GITHUB_OUTPUT" in os.environ:
        with open(os.environ["GITHUB_OUTPUT"], "a") as f:
            for key, value in outputs.items():
                f.write(f"{key}={value}\n")
    else:
        print(outputs["matrix"])


if __name__ == "__main__":
    main()
