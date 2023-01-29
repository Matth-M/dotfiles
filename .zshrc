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

# Example theme
plug "zap-zsh/zap-prompt"

# Example install completion
plug "esc/conda-zsh-completion"

plug "hlissner/zsh-autopair"
plug "Aloxaf/fzf-tab"



export PATH=$PATH:/home/matth/.local/bin
export PATH=$PATH:/home/matth/.local/bin/scripts
export PATH=$PATH:/home/matth/.local/bin/flutter/bin
export PATH=$PATH:/home/matth/.local/bin/android-studio/bin
export PATH=$PATH:/home/matth/Android/sdk/cmdline-tools/latest/bin

. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/matth/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# GNAT
export GNAT_BIN="/home/matth/opt/GNAT/2021/bin"
export PATH="$PATH:$GNAT_BIN"
# end GNAT
