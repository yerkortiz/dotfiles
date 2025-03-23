#!/bin/bash

THEMES_DIR="./themes"

# using the following repo: https://github.com/alacritty/alacritty-theme
BASE_URL="https://raw.githubusercontent.com/alacritty/alacritty-theme/master/themes"

if [ -z "$1" ]; then
  echo "Error: No theme name provided."
  echo "Usage: $0 <theme_name>"
  exit 1
fi

THEME_NAME="$1"
THEME_FILE="${THEME_NAME}.toml"

THEME_URL="${BASE_URL}/${THEME_FILE}"

echo "Trying to download theme: ${THEME_NAME}"

mkdir -p "$THEMES_DIR"

if curl --fail --silent --show-error --output "${THEMES_DIR}/${THEME_FILE}" "$THEME_URL"; then
  echo "Theme '${THEME_NAME}' downloaded correctly at '${THEMES_DIR}/${THEME_FILE}'."
else
  echo "Error: Theme '${THEME_NAME}' not found."
  exit 1
fi
