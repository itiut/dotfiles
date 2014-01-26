export LANG=en_US.UTF-8

typeset -U path
path=(
    $HOME/bin
    $HOME/.anyenv/bin
    {/usr/local,/usr,}{/sbin,/bin}(N-/)
)

eval "$(anyenv init -)"

export ZSHDIR=$HOME/.zsh.d

export EDITOR=vim
