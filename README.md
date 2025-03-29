# Initialisation

```bash
git init --bare ~/.dotfiles
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
dotfiles config status.showUntrackedFiles no
```

# Import on new system

```bash
git clone --bare https://github.com/Matth-M/dotfiles.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
mkdir -p ~/.dotfiles-backup && \
dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} {}.backup
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

https://wiki.archlinux.org/title/Dotfiles#Tracking_dotfiles_directly_with_Git
