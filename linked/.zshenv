export LANG=en_US.UTF-8

export ZSHDIR=$HOME/.zsh.d

typeset -U path
path=(
    # user
    $HOME{/.linuxbrew,/local,/Dropbox,}/bin(N-/)
    # Linux
    {/usr/local,/usr,}{/sbin,/bin}(N-/)
)

typeset -U fpath
fpath=(
    {$HOME/.linuxbrew,/usr/local}/share/zsh/site-functions(N-/)
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

# linuxbrew
export LD_LIBRARY_PATH=$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH

# brewed golang
path=(
    $HOME/.linuxbrew/opt/go/libexec/bin(N-/)
    $path
)

# rbenv
if which rbenv > /dev/null; then
    eval "$(rbenv init -)"
fi

# local zshenv
if [ -f $HOME/.zshenv.local ]; then
    source $HOME/.zshenv.local
fi
