#!/usr/bin/env bash
INSTALL_DIR="$(dirname "${BASH_SOURCE[0]}")"  # get the directory name
INSTALL_DIR="$(realpath "${INSTALL_DIR}")"    # resolve its full path if need be
BASE_DIR="$(dirname "$INSTALL_DIR")"

# Update dotfiles repository
$(cd $BASE_DIR && git pull origin master)

# install brew
if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# vim dependencies

## command line fuzzy finder
brew install fzf

## Code-search similar to ack
brew install the_silver_searcher

## searchtool
brew install ripgrep

brew install neovim

# backup nvim configs
if [ -d "$HOME/.config/nvim" ]; then
  mv --backup=t $HOME/.config/nvim $HOME/.config/nvim_bkp
fi

# create link
ln -s $BASE_DIR/nvim $HOME/.config/nvim
