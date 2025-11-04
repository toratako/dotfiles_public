#!/usr/bin/env bash

set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Usage: $0 <path_to_package_json>"
  exit 1
fi

JSON_FILE="$1"

if [ ! -f "$JSON_FILE" ]; then
  echo "File not found: $JSON_FILE"
  exit 1
fi

if ! command -v jq >/dev/null 2>&1; then
  echo "Error: jq is required but not installed."
  exit 1
fi

jq -r '.dependencies | to_entries[] | "\(.key)@\(.value.version)"' "$JSON_FILE" |
while read -r pkg; do
  echo "Installing $pkg ..."
  npm install -g "$pkg"
done
