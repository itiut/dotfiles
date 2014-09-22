export LANG=en_US.UTF-8

export ZSHDIR=$HOME/.zsh.d

typeset -U path
path=(
    # user
    $HOME{/.linuxbrew,/local,/Dropbox,}/bin(N-/)
    # system
    {/usr/local,/usr,}{/sbin,/bin}(N-/)
)

typeset -U fpath
fpath=(
    {$(brew --prefix),/usr/local}/share/zsh/site-functions(N-/)
    $fpath
)

typeset -U manpath
manpath=(
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

# brewed envs
if which pyenv > /dev/null; then eval "$(pyenv init - zsh)"; fi
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

# local zshenv
if [ -f $HOME/.zshenv.local ]; then
    source $HOME/.zshenv.local
fi
