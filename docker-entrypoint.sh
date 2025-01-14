#!/usr/bin/env sh
set -e

# Default values if env vars are not set
: "${ENCODER:=parquet}"
: "${PARQUET_DEFAULT_COLUMN_COMPRESSION:=snappy}"
: "${FILE_BLOCK_COUNT:=10000}"
: "${S3_REGION:=us-east-1}"
: "${STATE_STORE:=state.yaml}"
: "${PRODUCTION_MODE:=false}"

OUTPUT_STORE="s3://pinax/${NETWORK}/${S3_BUCKET}?region=${S3_REGION}"
NETWORK_URL="${NETWORK}.substreams.pinax.network:443"

# Conditionally add --development-mode
if [ "${PRODUCTION_MODE}" = "true" ]; then
  DEV_FLAG=""
else
  DEV_FLAG="--development-mode"
fi

substreams-sink-files run \
  "${NETWORK_URL}" \
  "${MANIFEST}" \
  "${MODULE}" \
  "${OUTPUT_STORE}" \
  "${START_BLOCK}:${STOP_BLOCK}" \
  --encoder "${ENCODER}" \
  --parquet-default-column-compression "${PARQUET_DEFAULT_COLUMN_COMPRESSION}" \
  --file-block-count "${FILE_BLOCK_COUNT}" \
  --state-store "${STATE_STORE}" \
  ${DEV_FLAG}
