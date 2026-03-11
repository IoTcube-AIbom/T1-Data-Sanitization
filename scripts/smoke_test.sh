#!/usr/bin/env bash
set -euo pipefail

./scripts/run_local.sh --input-dir ./examples/input --output ./out/output.json
./scripts/validate_schema.sh ./out/output.json
echo "smoke test passed"
