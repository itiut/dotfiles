#!/usr/bin/env bash
set -eu

PROJECT_ROOT=$(cd $(dirname $0)/.. && pwd)
BREWFILE_PATH=$PROJECT_ROOT/linked/.Brewfile

prepare_brew() {
  if ! which brew > /dev/null; then
    echo '`brew` not found. install...'
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}

brew_bundle() {
  if [ -f $HOME/.Brewfile ]; then
    brew bundle --global
  else
    brew bundle --file=$BREWFILE_PATH
  fi
}

show_taken_time() {
  local prev=$(date +%s) line
  while IFS= read -r line; do
    local now=$(date +%s)
    echo $line \($(( now - prev ))s\)
    prev=$now
  done
}

prepare_brew
brew_bundle | show_taken_time
