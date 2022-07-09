# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

###################################################
#  OPTIONS 
###################################################

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

export TERM=xterm-256color

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Disable Ctrl-S action (?)
stty start undef stop undef

# Editor
export EDITOR=vim

###################################################
#  PS1
###################################################

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1="\e[0;32m\]\u: \w \]\e[0m\]\$(parse_git_branch)\[\e[00m\] \n> "


###################################################
#  ALIASES
###################################################

#ls aliases
alias ls='ls --color=auto'
alias ll='ls -AlF'
alias la='ls -A'
alias l='ls -CF'


alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias c='clear'

#Used to store dot files, use 'cfg' instead of 'git'
alias cfg='/usr/bin/git --git-dir=/home/matth/.cfg/ --work-tree=/home/matth' 

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias matlab='bash ~/matlab/bin/matlab'

alias v='vim'
alias nv='nvim'
alias t='tmux'

# git
alias gs='git status'
alias graph='git log --oneline --graph --decorate'
alias ga='git add'
alias gc='git checkout'

###################################################
#  PATH
###################################################

export PATH=$PATH:/home/matth/.local/bin
export PATH=$PATH:/home/matth/.local/bin/scripts


###################################################
#  OTHERS
###################################################

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/matth/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/matth/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/matth/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/matth/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
###################################################
#  STYLE
###################################################

# Prompts a message when new terminal is opened
figlet TERMINAL
. "$HOME/.cargo/env"
