#!/usr/bin/env bash

if [ $LINUX ]
then
  sudo apt-add-repository ppa:fish-shell/release-3
  sudo apt-get update
  apt-get install -y fish

  FISH_PATH=$(command -v fish)
  # Always want to use ZSH as my default shell (e.g. for SSH)
  if ! grep -q "root.*/bin/fish" /etc/passwd
  then
    chsh -s $FISH_PATH root
  fi
fi

cd "$(dirname $0)"/..
# link fish-specific files and directories
ln -s ./fish/completions ~/.config/fish/completions
ln -s ./fish/functions ~/.config/fish/functions
ln -s ./fish/fish_plugins ~/.config/fish/fish_plugins

# install fisher
fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"

# install plugins
fish -c "fisher update"