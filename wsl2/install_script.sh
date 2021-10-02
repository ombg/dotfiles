#echo "IaC script: Installing python stuff..."
#brew install python3 pip pipenv
#brew tap homebrew/cask-fonts
#brew cask install font-hack-nerd-font

echo "IaC script: Installing oh my zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo "IaC script: Installing FZF fuzzy finder..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
# This should be called as the final step.
echo "IaC script: Installing P10K..."
echo 'source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc
