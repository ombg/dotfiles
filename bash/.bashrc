# ~/.bashrc: executed by bash(1) for non-login shells.

if [[ "$(hostname)" == *mac* ]]; then
  source ~/git/dotfiles/bash/.bashrc-mac
fi

if [[ "$(hostname)" == *chewbacca* ]]; then
  source ~/git/dotfiles/bash/.bashrc-chewbacca
fi

if [[ "$(hostname)" == *zarquon* ]]; then
  source ~/git/dotfiles/bash/.bashrc-zarquon
fi

# Valid for both GPU servers othrys/othrys2
if [[ "$(hostname)" == *othrys* ]]; then
  source ~/git/dotfiles/bash/.bashrc-othrys
fi

