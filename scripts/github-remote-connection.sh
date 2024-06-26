#!/usr/bin/env bash

# Prompt the user for repo name
read -p "Enter the name of the repository you wish to add remote connection to: " repo_name

# Prompt the user for the name of the connection
read -p "Enter the name of the connection: " connection_name

# Prompt the user for the type of connection
read -p "Would you like to use SSH (y/n)? " use_ssh

# Get Github Token from the environment
github_token=$GITHUB_REPO_TOKEN

# Generate the repository URL
if [[ $use_ssh == "y" ]]; then
  repo_url="git@github.com:Azpect3120/$repo_name.git"
else
  repo_url="https://Azpect3120:$github_token@github.com/Azpect3120/$repo_name.git"
fi

# Get list of current remote connections
connections=`git remote`

# Check if the connection already exists
# If it does, set new url
# If it doesn't, create the connection
if [[ $connections == *$connection_name* ]]; then
  echo "Connection '$connection_name' already exists. Setting new URL..."
  git init
  git remote set-url $connection_name $repo_url
else
  echo "Connection '$connection_name' does not exist. Creating new connection..."
  git init
  git remote add $connection_name $repo_url
fi
