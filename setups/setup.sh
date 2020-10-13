#!/bin/sh

clear

echo "Starting to setup...\n"
echo ""
echo "-----------****----------"
echo ""
#
# echo "brew install pyenv"
# brew install pyenv
# echo "brew install neovim"
# brew install neovim
# echo "brew install "

DOTFILES="~/dev/dotfiles"

git clone git@github.com:sff1019/dotfiles.git $HOME/dev/
echo "Setting up zsh..."
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


echo "Finished setting up zsh!!"

echo "Setting up neovim"
[ ! -d "~/.local" ] && mkdir -p "~/.local"

echo "Installing neovim...\n"

NEOVIM_DIR="~/.local/.neovim"

if [ ! -d $NEOVIM_DIR ]
do
  NVIM_CONFIG="~/.config/nvim"
  pushd ~/.local  # ~/.local
  git clone git@github.com:neovim/neovim.git
  pushd neovim  # ~/.local/neovim
  git checkout stable
  make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/.local/neovim"
  make install
  export PATH="$HOME/.local/neovim/bin:$PATH"
done

echo "Installed neovim!!\n"

popd  # ~/.local
popd  # ~

[ ! -d "~/.config" ] && mkdir -p "~/.config"
[ ! -d "~/.config/nvim" ] && mkdir -p "~/.config/nvim"

echo "Setup nvim"
ln -s $DOTFILES/.vimrc $NVIM_CONFIG/init.vim
ln -s $DOTFILES/vim/rc/settings.rc.vim $NVIM_CONFIG/settings.rc.vim
ln -s $DOTFILES/vim/rc/ft.rc.vim $NVIM_CONFIG/ft.rc.vim
ln -s $DOTFILES/vim/rc/dein.toml $NVIM_CONFIG/dein.toml
ln -s $DOTFILES/vim/rc/deinlazy.toml $NVIM_CONFIG/deinlazy.toml
ln -s $DOTFILES/vim/rc/deincol.toml $NVIM_CONFIG/deincol.toml
ln -s $DOTFILES/vim/rc/plugins/deoplete.rc.vim $NVIM_CONFIG/deoplete.rc.vim
ln -s $DOTFILES/vim/rc/plugins/lsp.toml $NVIM_CONFIG/lsp.toml

echo "Finished setting up nvim configs"

echo "Setting up tmux"
ln -s $DOTFILES/.tmux.conf $HOME/.tmux.conf

