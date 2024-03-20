#!/usr/bin/env bash

# Get the target directory using fuzzy finder
# If a directory is provided, use that one
if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(find ~/Documents ~/Documents/Projects ~/ ~/.dotfiles ~/.dotfiles/config -mindepth 1 -maxdepth 1 -type d | 
    fzf --border --border-label='Directory Sessionizer' --margin='1%' --preview='tree -L 3 --gitignore {}' --preview-label='Project Tree')
fi

# Exit if the variable is unset
if [[ -z $selected ]]; then
  exit 0
fi

result=$(cd $selected)
echo $result
