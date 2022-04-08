#!/usr/bin/env bash
set -e

if ! command -v scala-cli; then
  export PATH="$HOME/bin:$PATH"
fi

scala-cli package ComputeCrc32.sc --server=false --native-image -o compute-crc32 -f -- --no-fallback "$@"
