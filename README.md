# Substreams Sink Files (Docker)

> Dockerfile for the [Substreams Sink Files](https://github.com/streamingfast/substreams-sink-files).

## Quicksart

```bash
docker build -t substreams-sink-files .
```

```bash
docker run --rm -it --env-file .env substreams-sink-files
```

## Environment Variables

```env
# Substreams Network
NETWORK=eos
SUBSTREAMS_API_KEY=...
PRODUCTION_MODE=true

# Substreams Package
START_BLOCK=412880782
STOP_BLOCK=
MODULE=map_events
MANIFEST=https://github.com/pinax-network/substreams-raw-blocks/releases/download/v1.0.0/raw-blocks-antelope-v1.0.0.spkg

# AWS S3 configs
S3_BUCKET=8490866fe98ab7d3f811ccf0f18da3cb46a378f9
S3_REGION=us-east-1
AWS_ACCESS_KEY_ID=...
AWS_SECRET_ACCESS_KEY=...

# Parquet configs
FILE_BLOCK_COUNT=1
```
