#!/bin/sh

set -e

# neovim
brew install neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.config/nvim/ && ln -s "${PWD}/mac/vimrc" ~/.config/nvim/init.vim && ln -s ${PWD}/mac/vim/* ~/.config/nvim/
nvim '+PluginInstall --sync' +q

# tmux
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s "${PWD}/mac/.tmux.conf" ~/.tmux.conf

# git configs
ln -s "${PWD}/gitconfig" ~/.gitconfig
ln -s "${PWD}/.gitignore_global" ~/.gitignore_global

