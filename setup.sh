#!/bin/sh

set -e

# Vim.
brew install neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.config/nvim/ && ln -s "${PWD}/vimrc" ~/.config/nvim/init.vim && ln -s ${PWD}/vim/* ~/.config/nvim/
nvim '+PluginInstall --sync' +q

# Tmux.
brew install tmux
ln -s "${PWD}/tmux.conf" ~/.tmux.conf

# Git.
ln -s "${PWD}/gitconfig" ~/.gitconfig
ln -s "${PWD}/.gitignore_global" ~/.gitignore_global
