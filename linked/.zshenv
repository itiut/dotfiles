export LANG=en_US.UTF-8

export REPODIR=$HOME/src
export ZSHDIR=$HOME/.zsh.d

typeset -U path fpath manpath

if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi

path=(
    $HOME{/local,/Dropbox,}/bin(N-/)
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
        /usr/local/opt/coreutils/libexec/gnubin(N-/)
        $path
    )
    manpath=(
        /usr/local/opt/coreutils/libexec/gnuman(N-/)
        $manpath
    )
fi

# envs
export GOPATH=$HOME
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi
if [ -f /usr/local/opt/chruby/share/chruby/chruby.sh ]; then
    source /usr/local/opt/chruby/share/chruby/chruby.sh
    source /usr/local/opt/chruby/share/chruby/auto.sh
fi

# local zshenv
if [ -f $HOME/.zshenv.local ]; then
    source $HOME/.zshenv.local
fi
