FROM <BASE_RUNTIME_IMAGE>

WORKDIR /app
COPY examples /app/examples
COPY scripts /app/scripts

RUN chmod +x /app/scripts/*.sh

CMD ["bash", "-lc", "mkdir -p /app/out && /app/scripts/run_local.sh --input-dir \"${INPUT_PATH:-/app/examples/input}\" --output \"${OUTPUT_PATH:-/app/out/output.json}\" && cat \"${OUTPUT_PATH:-/app/out/output.json}\""]
