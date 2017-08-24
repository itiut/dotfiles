#!/usr/bin/env bash
set -eu

PROJECT_ROOT=$(cd $(dirname $0)/.. && pwd)
DOTFILES_DIR=$PROJECT_ROOT/linked
DOTFILES_ADDITIONAL_TARGETS=(
  .atom
  .Brewfile
  .emacs.d
  Library/Application\ Support/Code/User/keybindings.json
  Library/Application\ Support/Code/User/settings.json
  Library/Scripts
)
DOTFILES_DROPBOX_DIR=$HOME/Dropbox/.share
DOTFILES_DROPBOX_ADDITIONAL_TARGETS=(
  .aws/config
  .aws/credentials
  .config/hub
  .ssh/config
)

ln_s() {
  local target=$1
  local target_dir=$2
  if [ -L "$HOME/$target" ]; then
    echo symlink exists, skip: $HOME/$target
  else
    ln -isv "$target_dir/$target" "$HOME/$target"
  fi
}

create_symlinks() {
  local dir=$1
  for target in $dir/.[a-z]*; do
    if [ -f $target ]; then
      ln_s $(basename $target) $dir
    fi
  done
}

create_symlinks $DOTFILES_DIR
create_symlinks $DOTFILES_DROPBOX_DIR

# NOTE: target path can contain spaces
for target in "${DOTFILES_ADDITIONAL_TARGETS[@]}"; do
  ln_s "$target" $DOTFILES_DIR
done

for target in ${DOTFILES_DROPBOX_ADDITIONAL_TARGETS[@]}; do
  ln_s $target $DOTFILES_DROPBOX_DIR
done
