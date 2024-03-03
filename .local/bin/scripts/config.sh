#!/bin/bash
session_name=config
tmux has-session -t $session_name >/dev/null 2>&1
if [[ $? != 0 ]]; then
	tmux new-session -s $session_name -d -n Home -c $HOME
	tmux new-window -t $session_name:2 -n nvim -c $HOME/.config/nvim/
	tmux new-window -t $session_name:3 -n config -c $HOME/.config
	tmux new-window -t $session_name:4 -n i3config -c $HOME/.config/i3/
	tmux new-window -t $session_name:5 -n terminal -c $HOME/.config/kitty/
	tmux new-window -t $session_name:6 -n tmux -c $HOME/.config/tmux/
	tmux new-window -t $session_name:7 -n scripts -c $HOME/.local/bin/scripts
fi
tmux attach -t $session_name:1
