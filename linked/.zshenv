export LANG=en_US.UTF-8
export EDITOR=vim

typeset -U path manpath
if [ -x /usr/libexec/path_helper ]; then
  eval "$(/usr/libexec/path_helper -s)"
fi
path=(
  /usr/local/opt/{coreutils,findutils,gnu-sed}/libexec/gnubin(N-/)
  $HOME{/Dropbox,}/bin(N-/)
  $path
)
manpath=(
  /usr/local/opt/{coreutils,findutils,gnu-sed}/libexec/gnuman(N-/)
  ${(s/:/)$(man -w)}  # Add Xcode man pages on OS X before exporting MANPATH
  $manpath
)
export MANPATH

# envs
export FZF_DEFAULT_COMMAND='ag -l --nocolor --hidden --ignore .git --search-binary'
export FZF_DEFAULT_OPTS='--reverse --bind=ctrl-k:kill-line'
export FZF_ALT_C_COMMAND="find -L . \\( -path '*/\\.*' -o -path '*/node_modules' -o -fstype 'dev' -o -fstype 'proc' \\) -prune -o -type d -print 2> /dev/null | sed 1d | cut -b3-"
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export GOPATH=$HOME
if [ -f /usr/local/opt/chruby/share/chruby/chruby.sh ]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  source /usr/local/opt/chruby/share/chruby/auto.sh

  # for Atom
  if [ -z $TERM ] && [ -f $HOME/.ruby-version ]; then
    chruby "$(head -n 1 $HOME/.ruby-version)"
  fi
fi

# local zshenv
if [ -f $HOME/.zshenv.local ]; then
  source $HOME/.zshenv.local
fi
