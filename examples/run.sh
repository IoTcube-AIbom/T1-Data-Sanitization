#!/usr/bin/env bash
set -euo pipefail

INPUT_DIR="${1:-./examples/input}"
OUTPUT="${2:-./out/output.json}"

./scripts/run_local.sh --input-dir "$INPUT_DIR" --output "$OUTPUT"
echo "wrote: $OUTPUT"
