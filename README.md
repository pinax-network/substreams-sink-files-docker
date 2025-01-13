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
NETWORK=eos.substreams.pinax.network:443
SUBSTREAMS_API_KEY=...
PRODUCTION_MODE=false

# Substreams Package
START_BLOCK=415074379
STOP_BLOCK=
MODULE=map_events
MANIFEST=https://github.com/pinax-network/substreams-raw-blocks/releases/download/v1.0.0/raw-blocks-antelope-v1.0.0.spkg

# AWS S3 configs
OUTPUT_STORE=s3://pinax/eos/v1.0.0?region=us-east-1
AWS_ACCESS_KEY_ID=...
AWS_SECRET_ACCESS_KEY=...

# Parquet configs
FILE_BLOCK_COUNT=1
```
