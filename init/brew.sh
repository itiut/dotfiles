#/usr/bin/env bash
set -eu

PROJECT_ROOT=$(realpath $(dirname $0)/..)
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

prepare_brew
brew_bundle