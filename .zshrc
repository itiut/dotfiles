# antigen
source $ZSHDIR/antigen/antigen.zsh
antigen-use oh-my-zsh
antigen-bundles <<EOBUNDLES
bundler
gem
heroku
npm
vagrant
zsh-users/zsh-syntax-highlighting
EOBUNDLES
antigen-theme $ZSHDIR/itiut.zsh-theme
antigen-apply

# aliases
alias -g C="| xclip -in -selection clipboard"
alias -g G="| grep"
alias -g H="| head"
alias -g L="| less"
alias -g S="| sed"
alias -g T="| tail"

alias ls="ls --classify --color"
alias la="ls --almost-all"
alias ll="ls -l --all"
alias cp="cp --interactive"
alias mv="mv --interactive"
alias rm="rm --interactive"

alias a="./a.out"
alias c="cd"
alias e="emacsclient --no-wait --alternate-editor=vim"
alias g="git"
alias l="ls"
alias o="xdg-open"
alias t="tig --all"
alias v="vim"

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

# z.sh
_Z_CMD=j
source $ZSHDIR/z/z.sh
