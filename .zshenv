export LANG=en_US.UTF-8

export ZSHDIR=$HOME/.zsh.d

typeset -U path
path=(
    # user
    $HOME{/local,/Dropbox,}/bin(N-/)
    # Linux
    {/usr/local,/usr,}{/sbin,/bin}(N-/)
)

typeset -U fpath
fpath=(
    $ZSHDIR/site-functions
    $fpath
)

typeset -U manpath
manpath=(
    # user
    $HOME/local/share/man(N-/)
    # Linux
    {/usr/local,/usr}/share/man(N-/)
)

export EDITOR=vim
