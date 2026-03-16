#!/bin/bash

# Check if the user provided an argument for the rvim directory
if [ -z "$1" ]; then
  script_name=$(basename "$0")
  echo "Usage: $script_name <distro name>"
  exit 1
fi

# Define the Neovim directories to backup
DISTRO_NAME="$1"
export XDG_CONFIG_HOME="$HOME/.config/${DISTRO_NAME}"
export XDG_DATA_HOME="$HOME/.local/share/${DISTRO_NAME}"
export XDG_CACHE_HOME="$HOME/.cache/${DISTRO_NAME}"
export XDG_STATE_HOME="$HOME/.local/state/${DISTRO_NAME}"

echo Using new folders $XDG_CONFIG_HOME - $XDG_DATA_HOME - $XDG_STATE_HOME - $XDG_CACHE_HOME

# Create the necessary directories if they don't exist
mkdir -p "$XDG_CONFIG_HOME" "$XDG_DATA_HOME" "$XDG_STATE_HOME" "$XDG_CACHE_HOME"

# Start Neovim
nvim "${@:2}"
