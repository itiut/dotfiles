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
    /usr/local/share/zsh/site-functions(N-/)
    $fpath
)

typeset -U manpath
manpath=(
    {/usr/local,/usr}/share/man(N-/)
    ${(s/:/)$(manpath)}         # Add CommandLineTools man in OS X
)
export MANPATH

export EDITOR=vim

# brew formulas
if which brew > /dev/null; then
    path=(
        $(brew --prefix)/opt/coreutils/libexec/gnubin(N-/)
        $(brew --prefix)/opt/go/libexec/bin(N-/)
        $path
    )
    fpath=(
        $(brew --prefix)/share/zsh/site-functions(N-/)
        $fpath
    )
    manpath=(
        $(brew --prefix)/opt/coreutils/libexec/gnuman(N-/)
        $manpath
    )
    export LD_LIBRARY_PATH=$(brew --prefix)/lib:$LD_LIBRARY_PATH
fi

# envs
if which pyenv > /dev/null; then eval "$(pyenv init - zsh)"; fi
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

# local zshenv
if [ -f $HOME/.zshenv.local ]; then
    source $HOME/.zshenv.local
fi
