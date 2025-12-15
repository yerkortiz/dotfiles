#!/bin/bash

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CONFIG_DIR=~/.config

CONFIG_DIRS=(
    "nvim"
    "alacritty"
    "zathura"
    "tmux"
)

create_symlink() {
    SRC=$1
    DEST=$2

    echo "Linking $DEST"
    rm -rf "$DEST"
    ln -s "$SRC" "$DEST"
}

echo -e "${BLUE}Setting up dotfiles from $DOTFILES_DIR...${NC}"

mkdir -p $CONFIG_DIR

for DIR in "${CONFIG_DIRS[@]}"; do
    create_symlink "$DOTFILES_DIR/$DIR" "$CONFIG_DIR/$DIR"
done

echo -e "${GREEN}Done!${NC}"
