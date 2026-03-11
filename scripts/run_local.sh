#!/usr/bin/env bash
set -euo pipefail

INPUT_DIR=""
OUTPUT=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --input-dir) INPUT_DIR="$2"; shift 2 ;;
    --input) INPUT_DIR="$2"; shift 2 ;; # backward-compatible alias
    --output) OUTPUT="$2"; shift 2 ;;
    *) shift ;;
  esac
done

IN_DIR="${INPUT_DIR:-${INPUT_PATH:-./examples/input}}"
OUT_PATH="${OUTPUT:-${OUTPUT_PATH:-./out/output.json}}"
mkdir -p "$(dirname "$OUT_PATH")"

if [[ ! -d "$IN_DIR" ]]; then
  echo "missing input dir: $IN_DIR" >&2
  exit 1
fi

# TODO: replace this placeholder with your real tool entrypoint.
# Expected minimum input: $IN_DIR/metadata.json
if [[ ! -f "$IN_DIR/metadata.json" ]]; then
  echo "missing file: $IN_DIR/metadata.json" >&2
  exit 1
fi

cp "$IN_DIR/metadata.json" "$OUT_PATH"
echo "wrote: $OUT_PATH"
