#!/usr/bin/env bash
source "$(dirname "$0")/../script/_helpers.sh"
export HOME_DOTFILES=$HOME/.dotfiles

install_fish_files () {
  info 'installing fishfiles'

  if [ -n "$CODESPACES" ]
  then
    local overwrite_all=false backup_all=true skip_all=false
  else
    local overwrite_all=false backup_all=false skip_all=false
  fi

  # link fish-specific files and directories
  link_file $HOME_DOTFILES/fish/completions ~/.config/fish/completions
  link_file $HOME_DOTFILES/fish/functions ~/.config/fish/functions
  link_file $HOME_DOTFILES/fish/fish_plugins ~/.config/fish/fish_plugins
  link_file $HOME_DOTFILES/fish/config.fish ~/.config/fish/config.fish
}

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
install_fish_files

if [[ $(fish -c "fisher") ]];
then
  success "fisher installed"
else
  info "installing fisher"
  # install fisher
  fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"
  success "fisher installed"
fi

info "updating fish plugins"
# install plugins
if fish -c "fisher update"
then
  success "updating fish plugins"
else
  fail "updating fish plugins"
fi