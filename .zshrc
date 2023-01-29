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
