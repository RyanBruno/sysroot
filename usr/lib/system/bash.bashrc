#!/usr/bin/env sh
# Profile file. Runs on login.

# XDG Paths
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Xauthority
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority

# Adds `~/.local/bin/` and all subdirectories to $PATH
export PATH=$PATH
export EDITOR="vim"
export TERMINAL="st"

# Wallpaper
if [ -f "$HOME/.config/wallpaper/current" ]
then
    export BACKGROUND="$HOME/.config/wallpaper/current"
else
    [ -f "$HOME/.config/wallpaper/default" ] && export BACKGROUND="$HOME/.config/wallpaper/default"
fi

#!/usr/bin/env bash
stty -ixon # Disable ctrl-s and ctrl-q.
HISTSIZE= HISTFILESIZE= # Infinite history.

# Source ssh-agent
eval $(ssh-agent)

# Set the prompt
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

# Enable vim mode
set -o vi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias mkdir="mkdir -pv" \
    bash="system-bash" \
    pacman="sudo pacman" \
    mv="mv -n" \
    ls="ls -phN --color=auto --group-directories-first" \
    less="less --no-histdups" \
    la="ls -pal --color=auto" \
    lt="/bin/ls -hplt --color=auto" \
    ll="ls -pl --color=auto"
