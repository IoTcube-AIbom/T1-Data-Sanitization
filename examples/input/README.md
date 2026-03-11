# Input Directory Structure

이 디렉토리는 도구 실행에 필요한 입력 리소스를 담습니다.

## Minimum required

- `metadata.json`: 필수 메타데이터 파일

## Optional

- `artifacts/`: 모델 파일, 추가 설정 파일, 참조 데이터 등 도구별 입력 리소스

## Example layout

```text
examples/input/
  metadata.json
  artifacts/
    <OPTIONAL_FILES>
```

## How it is used

- Local: `./scripts/run_local.sh --input-dir ./examples/input --output ./out/output.json`
- Docker: `INPUT_PATH=/app/examples/input docker compose -f docker/docker-compose.yml up --build`
