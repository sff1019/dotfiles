#!/bin/sh

clear

echo "Starting to setup..."
echo ""
echo "-----------****----------"
echo ""
#
# echo "brew install pyenv"
# brew install pyenv
# echo "brew install neovim"
# brew install neovim
# echo "brew install "

ZSH_DIR="~/.zsh"
ZSH_FILE="~/.zshrc"

if [ -h -a $ZSH_FILE ]; then
  rm $ZSH_FILE
fi

ln -s ~/dev/dotfiles/.zsh/.zshrc ~/.zshrc
ln -s ~/dev/dotfiles/.zsh/zsh_plugins.txt ~/.zsh_plugins.txt

mkdir $ZSH_DIR
mkdir $ZSH_DIR/modules

ln -s ~/dev/dotfiles/.zsh/modules/figlet.zsh ~/.zsh/modules/figlet.zsh
ln -s ~/dev/dotfiles/.zsh/modules/figlet.zsh ~/.zsh/modules/prompt.zsh
