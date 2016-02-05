# zplug
source $REPODIR/github.com/b4b4r07/zplug/zplug

_omz_libs=(
  clipboard
  completion
  directories
  functions
  git
  grep
  history
  key-bindings
  misc
  termsupport
  theme-and-appearance
)
zplug 'robbyrussell/oh-my-zsh', of:"lib/{${(j:,:)_omz_libs}}.zsh"
zplug $ZSHDIR, from:local, of:'itiut.zsh-theme', nice: 19

zplug 't413/zsh-background-notify'
zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-history-substring-search'
zplug 'zsh-users/zsh-syntax-highlighting'

_Z_CMD=j
zplug 'rupa/z', of:'z.sh'

zplug check || zplug install
zplug load

# zsh-users/zsh-history-substring-search
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

# aliases
alias ls="${$(alias ls)[5,-2]} -F"  # defined in oh-my-zsh/lib/theme-and-appearance.zsh
alias la='ls -A'
alias ll='ls -l -a'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias be='bundle exec'
alias c='cd'
alias g='git'
alias gl='ghq look'
alias m='tmux new-session -A -s main'
alias l='ls'
alias o='open_command'  # defined in oh-my-zsh/lib/functions.zsh
alias t='tig'
alias ta='tig --all'
alias v='vim'

# automatically expand abbreviations
setopt extended_glob

typeset -A abbreviations
abbreviations=(
  'A'  '| awk'
  'C'  '| clipcopy'
  'E'  '2>&1 > /dev/null'
  'G'  '| grep'
  'H'  '| head'
  'L'  '| less'
  'N'  '> /dev/null'
  'S'  '| sed'
  'T'  '| tail'
  'W'  '| wc'
  'X'  '| xargs'
)

magic-abbrev-expand() {
  local MATCH
  LBUFFER=${LBUFFER%%(#m)[-_a-zA-Z0-9]#}
  LBUFFER+=${abbreviations[$MATCH]:-$MATCH}
  zle self-insert
}

zle -N magic-abbrev-expand

bindkey ' ' magic-abbrev-expand
bindkey '^ ' magic-space        # control-space to bypass completion
bindkey -M isearch ' ' magic-space # normal space during searches

# remove superflous blanks from commands
setopt hist_reduce_blanks

# automatically list choices on an ambiguous completion
setopt auto_list

# make the completion list smaller
setopt list_packed

# insert the parameter-following character immediately after parameter names
setopt auto_param_keys

# automatically insert '/' after directory names
setopt auto_param_slash

# print 8-bit characters correctly
setopt print_eight_bit

# correct the spelling of commands
setopt correct

# automatically run `ls` after `cd`
function auto-ls() { ls; }
add-zsh-hook chpwd auto-ls

# run `cd ..` or insert '^' by ^
function cdup-or-insert-circumflex() {
  if [[ -z "$BUFFER" ]]; then
    echo
    cd ..
    local precmd_func
    for precmd_func in $precmd_functions; do
      $precmd_func
    done
    zle reset-prompt
    echo '\n'  # avoid being not displayed when PROMPT contains newline
  else
    zle self-insert '^'
  fi
}
zle -N cdup-or-insert-circumflex
bindkey '\^' cdup-or-insert-circumflex

# run `ls && git status` by C-t
function ls-and-git-status() {
  echo
  ls

  if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
    echo
    echo -e '\e[0;33m--- git status ---\e[0m'
    git status -sb
  fi

  echo '\n'  # avoid being not displayed when PROMPT contains newline
  zle reset-prompt
}
zle -N ls-and-git-status
bindkey '^T' ls-and-git-status

# open working directory in filer
function open-working-directory-in-filer() {
  open_command $PWD
}
zle -N open-working-directory-in-filer
bindkey '^O' open-working-directory-in-filer

# do not beep
setopt no_beep

# do not print matching errors by glob
setopt no_nomatch

# aws
aws() {
  unset -f aws
  source /usr/local/share/zsh/site-functions/_aws
  aws "$@"
}

# direnv
if whence direnv > /dev/null; then
  eval "$(direnv hook zsh)"
fi
