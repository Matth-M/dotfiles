#/bin/bash
/usr/bin/git --git-dir=/home/matth/.cfg/ --work-tree=/home/matth ls-tree --full-tree --name-only -r HEAD | fzf | xargs -I {} nvim {}
