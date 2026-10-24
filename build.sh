#!/usr/bin/env bash
# skills/ の各フォルダを、claude.ai にアップロードできる zip にする
set -euo pipefail
cd "$(dirname "$0")"
rm -rf dist
mkdir -p dist
for dir in skills/*/; do
  name=$(basename "$dir")
  (cd skills && zip -qr "../dist/$name.zip" "$name")
  echo "dist/$name.zip"
done
