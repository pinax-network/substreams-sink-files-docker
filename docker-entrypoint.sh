#!/usr/bin/env sh
set -e

# Default values if env vars are not set
: "${ENCODER:=parquet}"
: "${PARQUET_DEFAULT_COLUMN_COMPRESSION:=snappy}"
: "${FILE_BLOCK_COUNT:=10000}"
: "${STATE_STORE:=state.yaml}"
: "${PRODUCTION_MODE:=false}"
: "${METRICS_LISTEN_PORT:=9102}"

METRICS_LISTEN_ADDR="0.0.0.0:${METRICS_LISTEN_PORT}"

if [[ -z "${SUBSTREAMS_ENDPOINT}" ]]; then
  echo "Error: missing substreams endpoint (SUBSTREAMS_ENDPOINT)"
fi

if [[ -z "${OUTPUT_STORE_PATH}" ]]; then
  echo "Error: missing s3 output store path (OUTPUT_STORE_PATH)"
fi

# Conditionally add --development-mode
if [ "${PRODUCTION_MODE}" = "true" ]; then
  DEV_FLAG=""
else
  DEV_FLAG="--development-mode"
fi

substreams-sink-files run \
  "${SUBSTREAMS_ENDPOINT}" \
  "${MANIFEST}" \
  "${MODULE}" \
  "${OUTPUT_STORE_PATH}" \
  "${START_BLOCK}:${STOP_BLOCK}" \
  --encoder "${ENCODER}" \
  --parquet-default-column-compression "${PARQUET_DEFAULT_COLUMN_COMPRESSION}" \
  --file-block-count "${FILE_BLOCK_COUNT}" \
  --state-store "${STATE_STORE}" \
  --metrics-listen-addr "${METRICS_LISTEN_ADDR}" \
  ${DEV_FLAG}
