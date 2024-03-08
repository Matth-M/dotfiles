# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

###################################################
#  OPTIONS
###################################################

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return ;;
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


# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Disable Ctrl-S action (?)
stty start undef stop undef

# Editor
export EDITOR=nvim

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

source $HOME/.config/shell/aliasrc

###################################################
#  PATH
###################################################

export PATH=$PATH:/home/matth/.local/bin
export PATH=$PATH:/home/matth/.local/bin/scripts
export PATH=$PATH:/home/matth/.local/bin/flutter/bin
export PATH=$PATH:/home/matth/.local/bin/android-studio/bin
export PATH=$PATH:/usr/local/lib/nodejs/node-v20.11.1-linux-x64/bin
export PATH=$PATH:/home/matth/Android/sdk/cmdline-tools/latest/bin


###################################################
#  OTHERS
###################################################

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
    else
        export PATH="/usr/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#
export PATH="/home/matth/anaconda3/bin:$PATH"
###################################################
#  STYLE
###################################################

# Prompts a message when new terminal is opened
# figlet TERMINAL


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/matth/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
. "$HOME/.cargo/env"

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
