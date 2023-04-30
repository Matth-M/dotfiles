[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
export SHDOTDIR=$HOME/.config/shell

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

source $SHDOTDIR/aliasrc

# Example install plugins
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-autosuggestions"

#Example plugin pinned to specifc commit or branch, just pass the git reference
plug "zsh-users/zsh-syntax-highlighting"

plug "zap-zsh/completions"
plug "esc/conda-zsh-completion"

plug "hlissner/zsh-autopair"
plug "Aloxaf/fzf-tab"

# starship prompt
eval "$(starship init zsh)"


export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.local/bin/scripts
export PATH=$PATH:$HOME/.local/bin/flutter/bin
export PATH=$PATH:$HOME/anaconda3/bin
export ANDROID_INSTALL_FOLDER=/usr/local/android-studio
export PATH=$PATH:$ANDROID_INSTALL_FOLDER/bin
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$HOME/.local/bin/kitty.app/bin/

# Go
export PATH=$PATH:/usr/local/go/bin

# XAMPP
export LAMPP_HOME=/opt/lampp
export PATH=$PATH:$LAMPP_HOME/bin/

. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/matth/.local/share/pnpm"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# This allows the use of Ctrl-s to change the way of an i-search
stty -ixon
