setopt NO_GLOBAL_RCS

export LANG=en_US.UTF-8
export EDITOR=vim
export LESS='-iMR'

typeset -U path manpath
path=(
  $HOME{/Dropbox,}/bin(N-/)
  /usr/local/opt/{coreutils,findutils,gnu-sed}/libexec/gnubin(N-/)
  {/usr/local,/usr,}/bin(N-/)
  {/usr,}/sbin(N-/)
)
manpath=(
  /usr/local/opt/{coreutils,findutils,gnu-sed}/libexec/gnuman(N-/)
  /usr{/local,}/share/man(N-/)
  /Applications/Xcode.app/Contents/Developer/{,Toolchains/XcodeDefault.xctoolchain/}usr/share/man(N-/)
)
export PATH MANPATH

export FZF_DEFAULT_COMMAND='ag -l --nocolor --hidden --ignore .git --search-binary'
export FZF_DEFAULT_OPTS='--reverse --bind=ctrl-k:kill-line'
export FZF_ALT_C_COMMAND='(git rev-parse --is-inside-work-tree &> /dev/null && git ls-tree -dr --name-only HEAD || tree -dfiN --noreport | sed "1d;s/ -> .*//" | cut -b3-)'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_TMUX=1
export FZF_TMUX_HEIGHT=50%
export GHQ_ROOT=$HOME/src
export GIBO_BOILERPLATES=$HOME/src/github.com/github/gitignore
export GOPATH=$HOME

# local zshenv
if [[ -f $HOME/.zshenv.local ]]; then
  source $HOME/.zshenv.local
fi
