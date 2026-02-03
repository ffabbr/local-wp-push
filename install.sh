#!/usr/bin/env bash
set -euo pipefail

APP_NAME="wp-local-push"

SRC_DIR="$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
SRC_BIN="$SRC_DIR/bin/wp-local-push"

DEST_DIR="$HOME/.local/bin"
DEST_BIN="$DEST_DIR/wp-local-push"

mkdir -p "$DEST_DIR"

if [[ ! -f "$SRC_BIN" ]]; then
  echo "$APP_NAME: could not find $SRC_BIN" >&2
  exit 1
fi

cp "$SRC_BIN" "$DEST_BIN"
chmod +x "$DEST_BIN"

echo "$APP_NAME: installed to $DEST_BIN"

echo
if command -v wp-local-push >/dev/null 2>&1; then
  echo "$APP_NAME: command is already on your PATH"
else
  echo "$APP_NAME: add this to your shell config (e.g. ~/.zshrc):"
  echo "  export PATH=\"$HOME/.local/bin:\$PATH\""
fi

echo
echo "$APP_NAME: next: run 'wp-local-push setup'"
