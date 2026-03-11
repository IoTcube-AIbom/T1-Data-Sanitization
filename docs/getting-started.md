# Getting Started

## Run with Docker

```bash
docker compose -f docker/docker-compose.yml up --build
```

기본 입력 디렉토리: `./examples/input`

커스텀 입력 디렉토리:

```bash
INPUT_PATH=/app/examples/<CUSTOM_INPUT_DIR> OUTPUT_PATH=/app/out/<CUSTOM_OUTPUT>.json \
docker compose -f docker/docker-compose.yml up --build
```

호스트 디렉토리 직접 마운트(옵션):

```bash
HOST_INPUT_DIR="<INPUT_DIRECTORY_PATH>" HOST_OUTPUT_DIR="<OUTPUT_DIRECTORY_PATH>" \
docker compose -f docker/docker-compose.host-path.yml up --build
```

## Run with `docker run` (volume mounts)

```bash
docker run --rm \
  -v "$INPUT_DIR:/data/in" \
  -v "$OUTPUT_DIR:/data/out" \
  <IMAGE_NAME>:latest /bin/bash /<ENTRYPOINT_SCRIPT>.sh <TARGET_NAME>
```

example:

```bash
INPUT_DIR="<INPUT_DIRECTORY_PATH>"
OUTPUT_DIR="<OUTPUT_DIRECTORY_PATH>"

docker run --rm \
  -v "$INPUT_DIR:/data/in" \
  -v "$OUTPUT_DIR:/data/out" \
  ddinfer:latest /bin/bash /ddinfer.sh bluez-5.55
```

## Run locally

```bash
./scripts/run_local.sh --input-dir ./examples/input --output ./out/output.json
```

## Validate output

- Check `./out/output.json`
- Compare with `./examples/expected_output.json`
