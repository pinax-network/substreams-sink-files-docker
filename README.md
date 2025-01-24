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
SUBSTREAMS_ENDPOINT=eos.substreams.pinax.network:443
SUBSTREAMS_API_KEY=...
PRODUCTION_MODE=true

# Substreams Package
START_BLOCK=412880782
STOP_BLOCK=
MODULE=map_events
MANIFEST=https://github.com/pinax-network/substreams-raw-blocks/releases/download/v1.0.0/raw-blocks-antelope-v1.0.0.spkg

# AWS S3 configs
OUTPUT_STORE_PATH=s3://...
AWS_ACCESS_KEY_ID=...
AWS_SECRET_ACCESS_KEY=...

# Parquet configs
FILE_BLOCK_COUNT=1
ENCODER=parquet
PARQUET_DEFAULT_COLUMN_COMPRESSION=snappy
STATE_STORE=state.yaml
```
