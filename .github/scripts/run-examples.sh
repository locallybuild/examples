#!/usr/bin/env bash
# Runs each of the given examples against the running Locally instance, the
# same way its README does, and reports every failure rather than stopping at
# the first.
#
# Usage: run-examples.sh <kind> <path>...

set -uo pipefail

kind="$1"
shift

run_example() {
  local name
  name="$(basename "$PWD")"

  case "$kind" in
    arm)
      locally deploy --resource-group "ci-${name}" template.json
      ;;
    bicep)
      locally deploy --resource-group "ci-${name}" template.bicep
      ;;
    terraform | opentofu)
      local tool=terraform
      [[ "$kind" == "opentofu" ]] && tool=tofu
      "$tool" init -input=false &&
        locally run "$tool" apply -auto-approve -input=false &&
        locally run "$tool" destroy -auto-approve -input=false
      ;;
    go)
      go build -o example . &&
        locally run ./example
      ;;
    dotnet)
      dotnet build &&
        locally run dotnet run --no-build
      ;;
    pulumi)
      pulumi stack init ci --non-interactive &&
        locally run pulumi up --yes --skip-preview --non-interactive &&
        locally run pulumi destroy --yes --skip-preview --non-interactive &&
        pulumi stack rm ci --yes --non-interactive
      ;;
    *)
      echo "unknown kind: ${kind}" >&2
      return 1
      ;;
  esac
}

if [[ "$kind" == "pulumi" ]]; then
  pulumi login --local
fi

failed=()
for path in "$@"; do
  echo "::group::${path}"
  if (cd "$path" && run_example); then
    echo "::endgroup::"
  else
    echo "::endgroup::"
    echo "::error title=Example failed::${path}"
    failed+=("$path")
  fi
done

if (( ${#failed[@]} > 0 )); then
  echo "${#failed[@]} of $# example(s) failed:"
  printf '  %s\n' "${failed[@]}"
  exit 1
fi

echo "All $# example(s) passed."
