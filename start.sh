#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

IMAGE_NAME="free-claude-code-isolated:latest"
CONTAINER_NAME="free-claude-code-isolated"
UPSTREAM_REPO="${UPSTREAM_REPO:-https://github.com/Alishahryar1/free-claude-code.git}"
UPSTREAM_REF="${UPSTREAM_REF:-a0f62c598ca087107cabb14c65adf980ed71143d}"

if [[ ! -f .env.container ]]; then
  echo "Missing .env.container. Create it from .env.container.example first."
  echo "  cp .env.container.example .env.container"
  exit 1
fi

docker build \
  --build-arg "UPSTREAM_REPO=$UPSTREAM_REPO" \
  --build-arg "UPSTREAM_REF=$UPSTREAM_REF" \
  -t "$IMAGE_NAME" \
  .
docker rm -f "$CONTAINER_NAME" >/dev/null 2>&1 || true
docker run -d \
  --name "$CONTAINER_NAME" \
  --env-file .env.container \
  --add-host host.docker.internal:host-gateway \
  -p 18082:8082 \
  "$IMAGE_NAME"

echo "Container started: $CONTAINER_NAME"
echo "Host endpoint: http://127.0.0.1:18082 (root requires API key)"
echo "Check logs: docker logs -f $CONTAINER_NAME"
echo "Verify health: ./verify.sh"
