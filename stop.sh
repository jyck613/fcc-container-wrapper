#!/usr/bin/env bash
set -euo pipefail

CONTAINER_NAME="free-claude-code-isolated"

docker rm -f "$CONTAINER_NAME" >/dev/null 2>&1 || true
echo "Container removed: $CONTAINER_NAME"
