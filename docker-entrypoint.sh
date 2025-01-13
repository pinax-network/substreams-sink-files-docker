#!/usr/bin/env sh
set -e

# Default values if env vars are not set
: "${ENCODER:=parquet}"
: "${PARQUET_DEFAULT_COLUMN_COMPRESSION:=snappy}"
: "${FILE_BLOCK_COUNT:=10000}"
: "${S3_REGION:=us-east-1}"
: "${STATE_STORE:=state.yaml}"
: "${PRODUCTION_MODE:=false}"

# Conditionally add --development-mode
if [ "${PRODUCTION_MODE}" = "true" ]; then
  DEV_FLAG=""
else
  DEV_FLAG="--development-mode"
fi

exec substreams-sink-files run \
  "${NETWORK}" \
  "${MANIFEST}" \
  "${MODULE}" \
  "${OUTPUT_STORE}" \
  "${START_BLOCK}:${STOP_BLOCK}" \
  --encoder "${ENCODER}" \
  --parquet-default-column-compression "${PARQUET_DEFAULT_COLUMN_COMPRESSION}" \
  --file-block-count "${FILE_BLOCK_COUNT}" \
  --state-store "${STATE_STORE}" \
  ${DEV_FLAG}
