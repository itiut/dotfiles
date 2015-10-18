export LANG=en_US.UTF-8

export REPODIR=$HOME/src
export ZSHDIR=$HOME/.zsh.d

typeset -U path fpath manpath

if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi

path=(
    $HOME{/.linuxbrew,/local,/Dropbox,}/bin(N-/)
    $path
)
fpath=(
    /usr/local/share/zsh/site-functions(N-/)
    $fpath
)
manpath=(
    {/usr/local,/usr}/share/man(N-/)
    ${(s/:/)$(man -w)}          # Add CommandLineTools man on OS X
    $manpath
)
export MANPATH

export EDITOR=vim

# brew formulas
if which brew > /dev/null; then
    path=(
        $(brew --prefix coreutils)/libexec/gnubin(N-/)
        $(brew --prefix go)/libexec/bin(N-/)
        $path
    )
    fpath=(
        $(brew --prefix)/share/zsh/site-functions(N-/)
        $fpath
    )
    manpath=(
        $(brew --prefix coreutils)/libexec/gnuman(N-/)
        $manpath
    )
    source $(brew --prefix awscli)/share/zsh/site-functions/_aws
fi

# envs
export GOPATH=$HOME
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

# local zshenv
if [ -f $HOME/.zshenv.local ]; then
    source $HOME/.zshenv.local
fi
