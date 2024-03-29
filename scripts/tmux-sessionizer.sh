#!/usr/bin/env bash

# Get the target directory using fuzzy finder
# If a directory is provided, use that one
if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(find ~/Documents ~/Documents/Projects ~/ ~/.dotfiles ~/.dotfiles/config -mindepth 1 -maxdepth 1 -type d | 
    fzf --border --border-label='TMUX Sessionizer' --margin='1%' --preview='tree -L 3 --gitignore {}' --preview-label='Project Tree')
fi

# Exit if the variable is unset
if [[ -z $selected ]]; then
  exit 0
fi

# Get the base name of the target directory
name=$(basename "$selected" | tr . _)

# Check if TMUX is running
running=$(pgrep tmux)

# Create session if not exists
if ! tmux has-session -t=$name 2> /dev/null; then
  tmux new-session -ds $name -c $selected
  tmux a -t $name
  exit 0
fi

# Connect to existing session
tmux a -t $name
