#!/bin/sh

set -e

# update packages
sudo apt update

# neovim
sudo apt install neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.config/nvim/ && ln -s "${PWD}/ubuntu/vimrc" ~/.config/nvim/init.vim && ln -s ${PWD}/ubuntu/vim/* ~/.config/nvim/
nvim '+PluginInstall --sync' +q

# tmux
sudo apt install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s "${PWD}/ubuntu/.tmux.conf" ~/.tmux.conf

# git configs
# ln -s "${PWD}/gitconfig" ~/.gitconfig
# ln -s "${PWD}/.gitignore_global" ~/.gitignore_global
