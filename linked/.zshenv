export LANG=en_US.UTF-8
export EDITOR=vim

export REPODIR=$HOME/src
export ZSHDIR=$HOME/.zsh.d

typeset -U path fpath manpath

if [ -x /usr/libexec/path_helper ]; then
  eval "$(/usr/libexec/path_helper -s)"
fi

path=(
  /usr/local/opt/{coreutils,gnu-sed}/libexec/gnubin(N-/)
  $HOME{/Dropbox,}/bin(N-/)
  $path
)
fpath=(
  /usr/local/share/zsh/site-functions(N-/)
  $fpath
)
manpath=(
  /usr/local/opt/{coreutils,gnu-sed}/libexec/gnuman(N-/)
  {/usr/local,/usr}/share/man(N-/)
  ${(s/:/)$(man -w)}  # Add Xcode man pages on OS X before exporting MANPATH
  $manpath
)
export MANPATH

# envs
export GOPATH=$HOME
if [ -f /usr/local/opt/chruby/share/chruby/chruby.sh ]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  source /usr/local/opt/chruby/share/chruby/auto.sh
fi

# local zshenv
if [ -f $HOME/.zshenv.local ]; then
  source $HOME/.zshenv.local
fi
