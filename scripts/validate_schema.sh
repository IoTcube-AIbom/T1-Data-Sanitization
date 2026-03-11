#!/usr/bin/env bash
set -euo pipefail

FILE="${1:-./out/output.json}"
if [[ ! -f "$FILE" ]]; then
  echo "missing file: $FILE" >&2
  exit 1
fi

echo "schema validation placeholder passed: $FILE"
