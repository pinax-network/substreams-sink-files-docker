# syntax=docker/dockerfile:1

###
# 1) Build Stage
###
FROM golang:1.20-alpine AS builder

# Install git so we can clone the repository
RUN apk add --no-cache git

WORKDIR /app

# Clone the specific branch 'feature/parquet' from the repository
RUN git clone -b feature/parquet https://github.com/pinax-network/substreams-sink-files.git .

# Build the substreams-sink-files binary
RUN go install ./cmd/substreams-sink-files

###
# 2) Minimal Runtime Image
###
FROM alpine:3.18

# Copy the compiled binary from the build stage
COPY --from=builder /go/bin/substreams-sink-files /usr/local/bin/substreams-sink-files

# Default command
ENTRYPOINT ["substreams-sink-files"]
