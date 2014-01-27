export LANG=en_US.UTF-8

typeset -U path
path=(
    # user
    $HOME{/local,/Dropbox,}/bin(N-/)
    # Linux
    {/usr/local,/usr,}{/sbin,/bin}(N-/)
)

typeset -U manpath
manpath=(
    # user
    $HOME/local/share/man(N-/)
    # Linux
    {/usr/local,/usr}/share/man(N-/)
)

export ZSHDIR=$HOME/.zsh.d

export EDITOR=vim
