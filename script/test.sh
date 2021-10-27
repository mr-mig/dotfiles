#!/usr/bin/env bash
#
# Run all dotfiles installers.

source "$(dirname "$0")/_helpers.sh"
set -e
cd "$(dirname $0)"/..

info "Installing dotfiles dependencies"
# find the installers and run them iteratively
find . \
-not \( -path ./macos -prune \) \
-not \( -path ./script -prune \) \
-not \( -path ./homebrew -prune \) \
-name install.sh | while read installer ; do info "${installer}"; done

success "Installed dotfiles dependencies"