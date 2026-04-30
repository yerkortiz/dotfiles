#------------------------------
# oh-my-zsh

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="norm"

plugins=(
    git 
    z
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

#------------------------------
# PATH

export PATH=/usr/local/bin:$PATH

#------------------------------
# vi mode

bindkey -v
export KEYTIMEOUT=1

#------------------------------


. "$HOME/.local/bin/env"

