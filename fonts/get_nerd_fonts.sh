#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <font_name>"
  exit 1
fi

FONT_NAME="$1"
BASE_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0"
FONT_URL="${BASE_URL}/${FONT_NAME}.zip"
FONT_DIR="./${FONT_NAME}"

mkdir -p "$FONT_DIR"

echo "Downloading ${FONT_NAME}..."
if curl -L -o "${FONT_DIR}/${FONT_NAME}.zip" "$FONT_URL"; then
  echo "Download successful."
else
  echo "Error: Failed to download ${FONT_NAME}."
  exit 1
fi

echo "Unzipping ${FONT_NAME}..."
unzip -o "${FONT_DIR}/${FONT_NAME}.zip" -d "$FONT_DIR"

echo "Cleaning up ${FONT_NAME}..."
rm "${FONT_DIR}/${FONT_NAME}.zip"

echo "Font ${FONT_NAME} downloaded in ${FONT_DIR}."
