#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

readonly SUPPORTED_OS=("Darwin" "Linux")
readonly SUPPORTED_PKGM=("brew" "apt")
readonly REQUIRED_ENVS=("DOTFILES_PKG_MANAGER" "DOTFILES_INSTALL_PATH")

readonly DOTFILES_DEPS=("nvim" "zsh")
readonly DOTFILES_LINKS=(
    "nvim:${HOME}/.config/nvim"
    "zsh/.zshrc:${HOME}/.zshrc"
)

readonly ERR_OS_UNSUPPORTED="[ERROR] Operating System not supported:"
readonly ERR_ENV_MISSING="[ERROR] Configuration file (.env) not found at:"
readonly ERR_VAR_REQUIRED="[ERROR] Required environment variable is missing:"
readonly ERR_PKGM_UNSUPPORTED="[ERROR] Package manager not supported:"
readonly ERR_PKGM_NOT_INSTALLED="[ERROR] Package manager binary not found in PATH:"
readonly ERR_DEP_MISSING="[ERROR] Dependency not found:"
readonly WRN_SRC_MISSING="[WARN] Source not found in repo:"

check_os() {
    local detected_os
    detected_os=$(uname -s)
    for os in "${SUPPORTED_OS[@]}"; do
        [[ "$detected_os" == "$os" ]] && return 0
    done
    echo "$ERR_OS_UNSUPPORTED '$detected_os'"
    exit 1
}

load_env() {
    local env_file="${DOTFILES_DIR}/.env"
    [[ -f "$env_file" ]] || { echo "$ERR_ENV_MISSING $env_file"; exit 1; }
    
    source "$env_file"
    
    for var in "${REQUIRED_ENVS[@]}"; do
        [[ -n "${!var:-}" ]] || { echo "$ERR_VAR_REQUIRED '$var'"; exit 1; }
    done
}

check_pkg_manager() {
    local valid=false
    for s in "${SUPPORTED_PKGM[@]}"; do
        [[ "$DOTFILES_PKG_MANAGER" == "$s" ]] && valid=true && break
    done

    if [[ "$valid" == "false" ]]; then
        echo "$ERR_PKGM_UNSUPPORTED '$DOTFILES_PKG_MANAGER'"
        exit 1
    fi

    which "$DOTFILES_PKG_MANAGER" &> /dev/null || { 
        echo "$ERR_PKGM_NOT_INSTALLED '$DOTFILES_PKG_MANAGER'"
        exit 1 
    }
}

check_dependencies() {
    for bin in "${DOTFILES_DEPS[@]}"; do
        which "$bin" &> /dev/null || {
            echo "$ERR_DEP_MISSING '$bin'"
            exit 1
        }
    done
}

setup_symlinks() {
    for entry in "${DOTFILES_LINKS[@]}"; do
        local source_path="${DOTFILES_DIR}/${entry%%:*}"
        local target_path="${entry#*:}"

        [[ -e "$source_path" ]] || {
            echo "$WRN_SRC_MISSING $source_path"
            continue
        }

        mkdir -p "$(dirname "$target_path")"
        ln -sfn "$source_path" "$target_path"
        echo "Linked: $source_path -> $target_path"
    done
}

main() {
    check_os
    load_env
    check_pkg_manager
    check_dependencies
    setup_symlinks
    echo "Status: Environment ready."
}

main "$@"
