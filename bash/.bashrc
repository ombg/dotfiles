# ~/.bashrc: executed by bash(1) for non-login shells.

if [[ "$(hostname)" == *mac* ]]; then
  source ~/git/dotfiles/.bashrc-mac
fi

if [[ "$(hostname)" == *zarquon* ]]; then
  source ~/git/dotfiles/.bashrc-zarquon
fi

# Valid for both GPU servers othrys/othrys2
if [[ "$(hostname)" == *othrys* ]]; then
  source ~/git/dotfiles/.bashrc-othrys
fi

