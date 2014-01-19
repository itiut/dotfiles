# LANG
export LANG=en_US.UTF-8

# ZSHDIR
export ZSHDIR="$HOME/.zsh.d"

# PATH
export PATH="$HOME/.nodebrew/current/bin:$PATH"
export PATH="$HOME/android-sdks/platform-tools:$PATH"

# EDITOR
export EDITOR=vim

# use Emacs keybindings
bindkey -e

# aliases
alias -g C="| xclip -in -selection clipboard"
alias -g G="| grep"
alias -g H="| head"
alias -g L="| less"
alias -g S="| sed"
alias -g T="| tail"

alias ls="ls --classify --color"
alias la="ls --all"
alias ll="ls -l"
alias lla="ls -l --all"
alias cp="cp --interactive"
alias mv="mv --interactive"
alias rm="rm --interactive"
alias grep="grep --color"

alias a="./a.out"
alias c="cd"
alias e="emacsclient --no-wait --alternate-editor=vim"
alias g="git"
alias l="ls"
alias o="xdg-open"
alias t="tig"
alias v="vim"

# history file
HISTFILE="$ZSHDIR/.zsh_history"

# history size
HISTSIZE=10000
SAVEHIST=10000

# share command history data
setopt share_history

# remove duplication commands
setopt hist_ignore_all_dups

# ignore commands which are the same as previous one
setopt hist_ignore_dups

# ignore commands when the first charactor is a space
setopt hist_ignore_space

# remove the 'history' command
setopt hist_no_store

# remove superflous blanks from commands
setopt hist_reduce_blanks

# search history
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# use completion
autoload -Uz compinit; compinit

# automatically list choices on an ambiguous completion
setopt auto_list

# make the completion list smaller
setopt list_packed

# do not distinguish lowercases from uppercases
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# next completion by <tab>, C-i
setopt auto_menu

# previous completion by <S-tab>
bindkey "\e[Z" reverse-menu-complete

# insert the parameter-following character immediately after parameter names
setopt auto_param_keys

# automatically insert '/' after directory names
setopt auto_param_slash

# print 8-bit characters correctly
setopt print_eight_bit

# correct the spelling of commands
setopt correct

# completion when `kill`
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# LSCOLORS
export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx
export LS_COLORS='di=01;36:ln=01;35:ex=01;32'
zstyle ':completion:*' list-colors 'di=01;36' 'ln=01;35' 'ex=01;32'

# run `cd` if the command is only a directory name
setopt auto_cd

# run `pushd` when `cd`
setopt auto_pushd

# run `ls` after `cd`
function chpwd() { ls }

# run `cd ..` by ^
function cdup() {
    echo
    cd ..
    echo "\n"                   # avoid being not displayed when PROMPT contains newline
    zle reset-prompt
}
zle -N cdup
bindkey '\^' cdup

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

# antigen
source "$ZSHDIR/antigen/antigen.zsh"
antigen-use oh-my-zsh
antigen-bundles <<EOF
rbenv
gem
bundler
heroku
npm
vagrant
EOF
antigen-theme $ZSHDIR/itiut.zsh-theme
antigen-apply

# auto-fu.zsh
source "$ZSHDIR/auto-fu.zsh/auto-fu.zsh"
function zle-line-init () {
	auto-fu-init
}
zle -N zle-line-init
zstyle ':completion:*' completer _oldlist _complete

# z.sh
_Z_CMD=j
source "$ZSHDIR/z/z.sh"

case "${TERM}" in
# gnome-terminal
kterm*|xterm)
    precmd() {
        # print user name and host name on window title
        echo -ne "\033]0;${USER}@${HOST}\007"
    }
;;
# screen, byobu
screen|screen-bce)
    preexec() {
        # print process name on title
        echo -ne "\ek#${1%% *}\e\\"
    }
    precmd() {
        # print current directory name on title
        echo -ne "\ek${PWD:t}\e\\"
    }
;;
esac
