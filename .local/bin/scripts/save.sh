#!/usr/bin/env bash
# Git repo for my dotfiles
cfg="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

$cfg add "$HOME/.config/nvim/"
$cfg add "$HOME/.local/bin/scripts/"
$cfg commit -a -m "update"
$cfg push
