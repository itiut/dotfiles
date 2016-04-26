export LANG=en_US.UTF-8
export EDITOR=vim

typeset -U path manpath
if [ -x /usr/libexec/path_helper ]; then
  eval "$(/usr/libexec/path_helper -s)"
fi
path=(
  /usr/local/opt/{coreutils,gnu-sed}/libexec/gnubin(N-/)
  $HOME{/Dropbox,}/bin(N-/)
  $path
)
manpath=(
  /usr/local/opt/{coreutils,gnu-sed}/libexec/gnuman(N-/)
  ${(s/:/)$(man -w)}  # Add Xcode man pages on OS X before exporting MANPATH
  $manpath
)
export MANPATH

# envs
export FZF_DEFAULT_OPTS='--reverse --bind=ctrl-k:kill-line'
export GOPATH=$HOME
if [ -f /usr/local/opt/chruby/share/chruby/chruby.sh ]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  source /usr/local/opt/chruby/share/chruby/auto.sh
fi

# local zshenv
if [ -f $HOME/.zshenv.local ]; then
  source $HOME/.zshenv.local
fi
