#!/usr/bin/env bash
set -euo pipefail

if ! command -v docker >/dev/null 2>&1; then
  echo "Docker CLI is not installed or not on PATH." >&2
  exit 1
fi

if ! docker info >/dev/null 2>&1; then
  echo "Docker daemon is not reachable. Start Docker Desktop or the Docker service first." >&2
  exit 1
fi

username="${DOCKER_USERNAME:-}"
password="${DOCKER_PASSWORD:-${DOCKER_TOKEN:-}}"

if [[ -z "$username" ]]; then
  read -r -p "Docker Hub username: " username
fi

if [[ -z "$password" ]]; then
  read -r -s -p "Docker Hub password or access token: " password
  echo
fi

if [[ -z "$username" || -z "$password" ]]; then
  echo "Username and password/token are required." >&2
  exit 1
fi

printf '%s' "$password" | docker login --username "$username" --password-stdin
echo "Docker Hub login successful for $username."
