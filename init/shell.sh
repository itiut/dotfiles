#!/usr/bin/env bash
set -eu

ZSH_PATH=/usr/local/bin/zsh
ZGEN_PATH=$HOME/.zgen/zgen.zsh
TPM_PATH=$HOME/.tmux/plugins/tpm/tpm

prepare_loginshell() {
  if [ ! -x $ZSH_PATH ]; then
    echo zsh not found at $ZSH_PATH
    exit 1
  fi

  local current_shell=$(dscl . -read $HOME UserShell | cut -d ' ' -f 2)
  if [ $current_shell = $ZSH_PATH ]; then
    echo current login shell is zsh, skip.
    return
  fi

  echo setting login shell to zsh...
  sudo dscl . -change $HOME UserShell $current_shell $ZSH_PATH
}

prepare_zgen() {
  if [ -x $ZGEN_PATH ]; then
    echo zgen exists, skip.
    return
  fi
  git clone https://github.com/tarjoilija/zgen.git $(dirname $ZGEN_PATH)
}

prepare_tpm() {
  if [ -x $TPM_PATH ]; then
    echo tpm exists, skip.
    return
  fi
  git clone https://github.com/tmux-plugins/tpm.git $(dirname $TPM_PATH)
}

prepare_loginshell
prepare_zgen
prepare_tpm
