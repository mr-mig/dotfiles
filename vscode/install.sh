#!/usr/bin/env bash
set -e

if ! command -v code >/dev/null
then
  echo "Install VS Code first!" >&2
  exit 1
fi

EXTENSIONS="$(code --list-extensions)"

for EXTENSION in $(cat $(dirname $0)/vscode-extensions)
do
  if ! echo "$EXTENSIONS" | grep -q "$EXTENSION"
  then
    code --install-extension "$EXTENSION"
  fi
done