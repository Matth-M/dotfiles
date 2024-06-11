#!/bin/bash
session_name=main
tmux has-session -t $session_name >/dev/null 2>&1
if [[ $? != 0 ]]; then
	tmux new-session -s $session_name -d -n Home -c $HOME
	tmux new-session -s $session_name -d -n Home -c $HOME
	tmux new-window -t $session_name:2 -d -n Downloads -c $HOME/Downloads/
fi
tmux attach -t $session_name:1
