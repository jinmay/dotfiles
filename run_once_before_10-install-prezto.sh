#!/bin/sh
# This script is executed only once by chezmoi on a new machine.
# It clones the Prezto repository if it doesn't exist.

# Exit immediately if a command exits with a non-zero status.
set -e

ZPREZTO_DIR="${ZDOTDIR:-$HOME/.config/zsh}/.zprezto"

if [ ! -d "$ZPREZTO_DIR" ]; then
  echo "Cloning Prezto..."
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "$ZPREZTO_DIR"
else
  echo "Prezto directory already exists."
fi
