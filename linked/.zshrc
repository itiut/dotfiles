# antigen
source $REPODIR/github.com/zsh-users/antigen/antigen.zsh
antigen-use oh-my-zsh

antigen-bundle zsh-users/zsh-completions src
antigen-bundle zsh-users/zsh-history-substring-search
antigen-bundle zsh-users/zsh-syntax-highlighting

antigen-theme $ZSHDIR/itiut.zsh-theme
antigen-apply

## zsh-history-substring-search
bindkey "^P" history-substring-search-up
bindkey "^N" history-substring-search-down

## zsh-autosuggestions
antigen-bundle tarruda/zsh-autosuggestions # workaround for tab completion
function zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init


# OS specific settings
if [[ "$OSTYPE" =~ [a-z]+ ]] && [ -f $HOME/.zshrc.$MATCH ]; then
    source $HOME/.zshrc.$MATCH
fi

# aliases
alias ls="ls -F $_MY_LS_COLOR"
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
alias o="$_MY_OPEN"
alias v="vim"

alias be="bundle exec"

alias t="tig"
alias ta="tig --all"

# automatically expand abbreviations
setopt extended_glob

typeset -A abbreviations
abbreviations=(
    "C"    "| $_MY_CLIP"
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
function _my_ls() { ls }
add-zsh-hook chpwd _my_ls

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
    o $PWD
}
zle -N open-working-directory-in-filer
bindkey '^O' open-working-directory-in-filer

# do not beep
setopt no_beep

# do not print matching errors by glob
setopt no_nomatch

# direnv
if which direnv > /dev/null; then
    eval "$(direnv hook $0)"
fi

# z.sh
_Z_CMD=j
source $REPODIR/github.com/rupa/z/z.sh
