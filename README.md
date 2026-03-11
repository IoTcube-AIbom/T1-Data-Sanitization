# Data Sanitization

Training Data Poisoning Inspection & Sanitization Report

---

## Run Immediately

### Docker (Recommended)
```bash
docker compose -f docker/docker-compose.yml up --build
# Default input: ./examples/input
# Output: ./out/output.json
```

### Local
```bash
./scripts/run_local.sh --input-dir ./examples/input --output ./out/output.json
```

## What This Repo Contains

- `src/`: implementation code
- `tests/`: tests
- `docs/`: documentation
- `examples/`: example input directories/output samples
- `docker/`: Docker runtime configuration
- `scripts/`: local run/validation/smoke tests

## Input / Output Spec

- Spec document: `docs/input-output-spec.md`
- Example input dir: `examples/input/`
- Input structure guide: `examples/input/README.md`
- Example output: `examples/expected_output.json`

### Input Directory Example

```text
examples/input/
  metadata.json
  artifacts/                 # optional
```

### `metadata.json` Example

```json
{
  "model_source": {
    "type": "<MODEL_SOURCE_TYPE>",
    "repo_id": "<MODEL_REPO_ID>"
  },
  "options": {
    "include_layers": true,
    "include_dependencies": true
  }
}
```

## Quick Start (Docker)

```bash
docker compose -f docker/docker-compose.yml up --build
```

Custom input directory:

```bash
INPUT_PATH=/app/examples/<CUSTOM_INPUT_DIR> OUTPUT_PATH=/app/out/<CUSTOM_OUTPUT>.json \
docker compose -f docker/docker-compose.yml up --build
```

Option: Compose example for directly mounting host directories

```bash
HOST_INPUT_DIR="<INPUT_DIRECTORY_PATH>" HOST_OUTPUT_DIR="<OUTPUT_DIRECTORY_PATH>" \
docker compose -f docker/docker-compose.host-path.yml up --build
```

Direct `docker run` example (host path mount):

```bash
docker run --rm \
  -v "$INPUT_DIR:/data/in" \
  -v "$OUTPUT_DIR:/data/out" \
  <IMAGE_NAME>:latest /bin/bash /<ENTRYPOINT_SCRIPT>.sh <TARGET_NAME>
```

Example:

```bash
INPUT_DIR="<INPUT_DIRECTORY_PATH>"
OUTPUT_DIR="<OUTPUT_DIRECTORY_PATH>"

docker run --rm \
  -v "$INPUT_DIR:/data/in" \
  -v "$OUTPUT_DIR:/data/out" \
  ddinfer:latest /bin/bash /ddinfer.sh bluez-5.55
```

## Local Development

### Run

```bash
./scripts/run_local.sh --input-dir ./examples/input --output ./out/output.json
```

### Test

```bash
./scripts/smoke_test.sh
```

### Validate Schema

```bash
./scripts/validate_schema.sh ./out/output.json
```

## Docs

- Getting started: `docs/getting-started.md`
- I/O spec: `docs/input-output-spec.md`
- Tool inputs: `docs/tool-inputs.md`
- Examples: `docs/examples.md`
- Troubleshooting: `docs/troubleshooting.md` (optional)
- FAQ: `docs/faq.md` (optional)
