# ~/.bashrc: executed by bash(1) for non-login shells.

if [[ "$(hostname)" == *zarquon* ]]; then
  source ~/.bashrc-zarquon
fi

# Valid for both GPU servers othrys/othrys2
if [[ "$(hostname)" == *othrys* ]]; then
  source ~/.bashrc-othrys
fi

