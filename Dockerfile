# syntax=docker/dockerfile:1

###
# 1) Build Stage
###
FROM golang:alpine AS builder

# Install git so we can clone the repository
RUN apk add --no-cache git

WORKDIR /app

# Clone the specific branch 'feature/parquet' from the repository
RUN git clone -b feature/parquet https://github.com/streamingfast/substreams-sink-files.git .

# Build the substreams-sink-files binary
RUN go install ./cmd/substreams-sink-files

###
# 2) Minimal Runtime Image
###
FROM alpine

# Copy a custom entrypoint script
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Copy the compiled binary from the build stage
COPY --from=builder /go/bin/substreams-sink-files /usr/local/bin/substreams-sink-files

# Default command
ENTRYPOINT ["docker-entrypoint.sh"]
