export LANG=en_US.UTF-8

typeset -U path
path=(
    $HOME/bin(N-/)
    $HOME/Dropbox/bin(N-/)
    $HOME/.anyenv/bin(N-/)
    {/usr/local,/usr,}{/sbin,/bin}(N-/)
)

eval "$(anyenv init -)"

export ZSHDIR=$HOME/.zsh.d

export EDITOR=vim
