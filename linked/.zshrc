### zgen
source $HOME/.zgen/zgen.zsh

if ! zgen saved; then
  # oh-my-zsh/lib/theme-and-appearance.zsh requires .dircolors to exist
  # See https://github.com/robbyrussell/oh-my-zsh/commit/1b799e9762067f912c0eb807cd5a55d8f122adfd
  zgen clone seebi/dircolors-solarized
  if [ ! -L $HOME/.dircolors ]; then
    ln -sv $(-zgen-get-clone-dir seebi/dircolors-solarized)/dircolors.256dark $HOME/.dircolors
  fi

  _omz_libs=(clipboard completion directories functions git grep history key-bindings misc termsupport theme-and-appearance)
  for lib in ${_omz_libs[@]}; do
    zgen load robbyrussell/oh-my-zsh lib/$lib.zsh
  done
  zgen load itiut/itiut.zsh-theme itiut.zsh-theme  # depends on oh-my-zsh

  zgen load /usr/local/opt/fzf/shell
  zgen load rupa/z
  zgen load sindresorhus/pretty-time-zsh
  zgen load t413/zsh-background-notify
  zgen load zsh-users/zsh-completions src
  zgen load zsh-users/zsh-syntax-highlighting zsh-syntax-highlighting.zsh
  zgen load zsh-users/zsh-history-substring-search  # load after zsh-users/zsh-syntax-highlighting

  zgen load https://gist.github.com/13f1a097655dc00a2a08fa684d295d3c.git  # _aws

  zgen save
fi

LESS='-iMR'  # override oh-my-zsh/lib/misc.zsh

# zsh-users/zsh-history-substring-search
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

### zshoptions
# completion
setopt AUTO_LIST
setopt AUTO_PARAM_KEYS
setopt AUTO_PARAM_SLASH
setopt LIST_PACKED

# expansion and globbing
setopt EXTENDED_GLOB
setopt NO_NOMATCH

# history
setopt HIST_REDUCE_BLANKS

# input/output
setopt CORRECT
setopt PRINT_EIGHT_BIT

# zle
setopt NO_BEEP

### aliases
# overrides
alias cp='cp -i'
alias diff='colordiff -u'
alias ls="${aliases[ls]:-ls} -F"  # defined in oh-my-zsh/lib/theme-and-appearance.zsh
alias mv='mv -i'
alias rm='rm -i'

# abbreviations
alias be='bundle exec'
alias bupd='brew update && brew outdated'
alias bupg='brew upgrade && brew cleanup -s'
alias c='cd'
alias d='docker'
alias dc='docker-compose'
alias dm='docker-machine'
alias dm-env='eval "$(docker-machine env default)"'
alias dm-restart='docker-machine restart default && eval "$(docker-machine env default)"'
alias dm-start='docker-machine start default && eval "$(docker-machine env default)"'
alias g='git'
alias gl='ghq look'
alias m='tmux new-session -A -s main'
alias l='ls'
alias la='ls -A'
alias ll='ls -l -a'
alias o="${functions[(i)open_command]:-open}"  # defined in oh-my-zsh/lib/functions.zsh
alias t='tig'
alias ta='tig --all'
alias tf='terraform'
alias v='vim'
alias va='vagrant'

### functions and keybindings
# automatically expand abbreviations by <space>
typeset -A abbreviations
abbreviations=(
  'A'  '| awk'
  'C'  '| clipcopy'
  'E'  '2>&1 > /dev/null'
  'F'  '| fzf'
  'G'  '| grep'
  'H'  '| head'
  'J'  '| jq'
  'L'  '| less'
  'N'  '&> /dev/null'
  'N1' '> /dev/null'
  'N2' '2> /dev/null'
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
bindkey ' '  magic-abbrev-expand
bindkey '^ ' magic-space  # skip expanding by <ctrl-space>
bindkey -M isearch ' ' magic-space  # insert a space in isearch

# automatically run `ls` after `cd`
auto-ls() { ls; }
chpwd_functions+=(auto-ls)

# run `cd ..` or insert '^' by <^>
cdup-or-insert-circumflex() {
  if [[ -z $BUFFER ]]; then
    BUFFER='cd ..'
    zle accept-line
  else
    zle self-insert '^'
  fi
}
zle -N cdup-or-insert-circumflex
bindkey '\^' cdup-or-insert-circumflex

# run `ls && git status` by <alt-l>
ls-and-git-status() {
  echo
  ls

  if git rev-parse --is-inside-work-tree &> /dev/null; then
    echo
    echo -e '\e[0;33m--- git status ---\e[0m'
    git status -sb
  fi

  echo '\n'  # avoid being not displayed when PROMPT contains newline
  zle reset-prompt
}
zle -N ls-and-git-status
bindkey '^[l' ls-and-git-status

# open current directory by <ctrl-o>
open-current-directory() {
  o $PWD
}
zle -N open-current-directory
bindkey '^O' open-current-directory

# `cd` to the repository selected with ghq and fzf by <ctrl-]>
fzf-cd-ghq() {
  local repo=$(ghq list | fzf-tmux --prompt 'cd> ')
  [[ -z $repo ]] && return

  BUFFER="cd $(ghq root)/$repo"
  zle accept-line
}
zle -N fzf-cd-ghq
bindkey '^]' fzf-cd-ghq

# open the repository in the browser, selected with ghq and fzf by <alt-]>
fzf-browse-ghq() {
  local repo=$(ghq list | fzf-tmux --prompt 'browse> ')
  [[ -z $repo ]] && return

  if [[ ${repo:0:11} = 'github.com/' ]]; then
    hub browse ${repo:11}
  else
    local url=${$(git config --file $(ghq root)/$repo/.git/config --get remote.origin.url)%.git}
    [[ -z $url ]] && return

    if [[ ${url:0:4} == 'git@' ]]; then
      url="https://${${url:4}/://}"
    fi
    o $url
  fi
}
zle -N fzf-browse-ghq
bindkey '^[]' fzf-browse-ghq

### envs
if (( ${+commands[direnv]} )); then
  eval "$(direnv hook zsh)"
fi
