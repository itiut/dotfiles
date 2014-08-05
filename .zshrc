# antigen
source $ZSHDIR/antigen/antigen.zsh
antigen-use oh-my-zsh
antigen-bundles <<EOBUNDLES
brew
bundler
docker
gem
heroku
npm
rbenv
vagrant
zsh-users/zsh-syntax-highlighting
EOBUNDLES
antigen-theme $ZSHDIR/itiut.zsh-theme
antigen-apply

# aliases
alias ls="ls -F -G"
alias la="ls -A"
alias ll="ls -l -a"
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

alias a="./a.out"
alias c="cd"
alias e="emacsclient --no-wait --alternate-editor=vim"
alias g="git"
alias l="ls"
alias o="open"
alias t="tig --all"
alias v="vim"

# automatically expand abbreviations
setopt extended_glob

typeset -A abbreviations
abbreviations=(
    "C"    "| xclip -in -selection clipboard"
    "E"    "2>&1 > /dev/null"
    "G"    "| grep"
    "H"    "| head"
    "L"    "| less"
    "N"    "> /dev/null"
    "S"    "| sed"
    "T"    "| tail"
    "W"    "| wc"
    "X"    "| xargs"
)

magic-abbrev-expand() {
    local MATCH
    LBUFFER=${LBUFFER%%(#m)[-_a-zA-Z0-9]#}
    LBUFFER+=${abbreviations[$MATCH]:-$MATCH}
    zle self-insert
}

zle -N magic-abbrev-expand

bindkey " " magic-abbrev-expand
bindkey "^ " magic-space        # control-space to bypass completion
bindkey -M isearch " " magic-space # normal space during searches

# history file
HISTDIR=$HOME/Dropbox/.share/.zsh_history
if [ -d $HISTDIR ]; then
    HISTFILE=$HISTDIR/$(hostname).zsh_history
fi

# remove superflous blanks from commands
setopt hist_reduce_blanks

# search history
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

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

# run `ls` after `cd`
function chpwd() { ls }

# run `cd ..` or insert '^' by ^
function cdup-or-insert-circumflex() {
    if [[ -z "$BUFFER" ]]; then
        echo
        cd ..
        zle reset-prompt
        echo "\n"                   # avoid being not displayed when PROMPT contains newline
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
        echo -e "\e[0;33m--- git status ---\e[0m"
        git status -sb
    fi

    echo "\n"                   # avoid being not displayed when PROMPT contains newline
    zle reset-prompt
}
zle -N ls-and-git-status
bindkey '^T' ls-and-git-status

# open working directory in filer
function open-working-directory-in-filer() {
    open $PWD
}
zle -N open-working-directory-in-filer
bindkey '^O' open-working-directory-in-filer

# do not beep
setopt no_beep

# do not print matching errors by glob
setopt no_nomatch

# auto-fu.zsh
source $ZSHDIR/auto-fu.zsh/auto-fu.zsh
function zle-line-init () {
    auto-fu-init
}
zle -N zle-line-init
zstyle ':completion:*' completer _oldlist _complete
zle -N zle-keymap-select auto-fu-zle-keymap-select
bindkey -M afu '^O' open-working-directory-in-filer

# direnv
if which direnv > /dev/null; then
    eval "$(direnv hook $0)"
fi

# z.sh
_Z_CMD=j
source $ZSHDIR/z/z.sh
