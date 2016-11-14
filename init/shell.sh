#!/usr/bin/env bash
set -eu

ZSH_PATH=/usr/local/bin/zsh

prepare_loginshell() {
  if [ ! -x $ZSH_PATH ]; then
    echo zsh not found at $ZSH_PATH
    exit 1
  fi

  local current_shell=$(dscl . -read $HOME UserShell | cut -d ' ' -f 2)
  if [ $current_shell = $ZSH_PATH ]; then
    echo current login shell is zsh, skip.
    exit 0
  fi

  echo setting login shell to zsh...
  sudo dscl . -change $HOME UserShell $current_shell $ZSH_PATH
}

prepare_loginshell
