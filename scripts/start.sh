#!/bin/sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
IMAGE_NAME=${IMAGE_NAME:-term-dig-game}
CONTAINER_NAME=${CONTAINER_NAME:-term-dig-game}
PORT=${PORT:-8080}

if ! command -v docker >/dev/null 2>&1; then
  echo "Docker is required. Install Docker Desktop or Docker Engine first." >&2
  exit 1
fi

if docker container inspect "$CONTAINER_NAME" >/dev/null 2>&1; then
  RUNNING=$(docker inspect -f '{{.State.Running}}' "$CONTAINER_NAME")
  if [ "$RUNNING" = "true" ]; then
    echo "Game is already running at http://localhost:${PORT}"
    exit 0
  fi
  docker rm "$CONTAINER_NAME" >/dev/null
fi

docker build -t "$IMAGE_NAME" "$ROOT_DIR"
docker run -d --name "$CONTAINER_NAME" -p "${PORT}:80" "$IMAGE_NAME" >/dev/null
echo "Game started at http://localhost:${PORT}"
echo "Stop it with: ./scripts/stop.sh"
