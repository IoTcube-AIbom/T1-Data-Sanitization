# Input / Output Spec

이 문서는 도구의 최소 I/O 계약을 정의합니다.

## Input

입력은 단일 JSON 파일이 아니라 디렉토리입니다.

### Directory layout

```text
<INPUT_DIR>/
  metadata.json              # required
  artifacts/                 # optional
```

### `metadata.json` example

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

### Common vs tool-specific fields

- 공통 필드(Common): 여러 도구가 공유하는 최소 키
- 개별 필드(Tool-specific): 도구별 확장 키 (`options.*` 또는 별도 네임스페이스)

### Required fields

- `metadata.json` file exists
- `model_source.type`
- `model_source.repo_id`

## Output

```json
{
  "tool": { "name": "<TOOL_NAME>", "version": "0.1.0" },
  "model": {
    "repo_id": "<MODEL_REPO_ID>",
    "architecture": "<MODEL_ARCHITECTURE>",
    "params_estimate": 12345678
  },
  "components": [],
  "environment": {
    "runtime": "<runtime>",
    "deps": []
  }
}
```

### Required fields

- `tool.name`
- `tool.version`
- `model.repo_id`
- `environment.runtime`
