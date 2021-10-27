#!/usr/bin/env bash

if [ $UNIX ]
then
  # Check for Homebrew and install if we don't have it
  if test ! $(which brew); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  # Update Homebrew recipes
  brew update

  # Install all Brewfile deps
  brew bundle || true
fi