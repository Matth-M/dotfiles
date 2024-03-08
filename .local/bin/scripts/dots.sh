#!/bin/bash
FILE_PATH="$(/usr/bin/git --git-dir=/home/matth/.dotfiles/ --work-tree=/home/matth ls-tree --full-tree --name-only -r HEAD | fzf)"
DIR="$(dirname "${FILE_PATH}")"
FILE="$(basename "${FILE_PATH}")"
cd "$HOME"/"$DIR"
nvim "$FILE"
