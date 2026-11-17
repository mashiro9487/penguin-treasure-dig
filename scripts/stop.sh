#!/bin/sh
set -eu
CONTAINER_NAME=${CONTAINER_NAME:-term-dig-game}

if ! command -v docker >/dev/null 2>&1; then
  echo "Docker is required. Install Docker Desktop or Docker Engine first." >&2
  exit 1
fi

if docker container inspect "$CONTAINER_NAME" >/dev/null 2>&1; then
  docker stop "$CONTAINER_NAME" >/dev/null
  docker rm "$CONTAINER_NAME" >/dev/null
  echo "Game stopped."
else
  echo "Game container is not running."
fi
