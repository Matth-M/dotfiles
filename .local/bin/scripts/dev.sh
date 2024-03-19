#!/bin/sh

DIR_PATH=$(find ~/dev/projects -maxdepth 1 | sort | awk NR\>1 | fzf)
SESSION_NAME="$(basename "${DIR_PATH}")"

# No session name given
if [ -z "$SESSION_NAME" ]; then
	exit
# Session already exists
elif tmux has-session -t "$SESSION_NAME"; then
	tmux switch -t "$SESSION_NAME":1
	exit
fi

cd "$DIR_PATH" || exit
tmux new-session -d -s "$SESSION_NAME"
tmux new-window -d -t "$SESSION_NAME"
tmux switch -t "$SESSION_NAME":1
tmux send-keys -l -t "$SESSION_NAME" 'nvim'
