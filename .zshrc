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
alias -g L="| less"
alias -g H="| head"
alias -g T="| tail"
alias -g G="| grep"

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
    zle reset-prompt
}
zle -N cdup
bindkey '\^' cdup

# do not beep
setopt no_beep

# do not print matching errors by glob
setopt no_nomatch

# antigen
source "$ZSHDIR/antigen/antigen.zsh"
antigen-bundles <<EOF
autojump
bundler
gem
heroku
npm
rbenv
EOF
antigen-apply

# auto-fu.zsh
source "$ZSHDIR/auto-fu.zsh/auto-fu.zsh"
function zle-line-init () {
	auto-fu-init
}
zle -N zle-line-init
zstyle ':completion:*' completer _oldlist _complete

# zsh-git-prompt
source "$ZSHDIR/zsh-git-prompt/zshrc.sh"
__GIT_PROMPT_DIR="$ZSHDIR/zsh-git-prompt"
# do not overlap characters
ZSH_THEME_GIT_PROMPT_STAGED="$ZSH_THEME_GIT_PROMPT_STAGED "
ZSH_THEME_GIT_PROMPT_CONFLICTS="$ZSH_THEME_GIT_PROMPT_CONFLICTS "
ZSH_THEME_GIT_PROMPT_CHANGED="$ZSH_THEME_GIT_PROMPT_CHANGED "
ZSH_THEME_GIT_PROMPT_UNTRACKED="$ZSH_THEME_GIT_PROMPT_UNTRACKED "
ZSH_THEME_GIT_PROMPT_CLEAN="$ZSH_THEME_GIT_PROMPT_CLEAN "

# PROMPT
autoload colors; colors
PROMPT=$'
 %B%F{yellow}%~ $(git_super_status)
%B%F{green}[%n@%m]%f%b$ '
PROMPT2="[%n]> "
RPROMPT="%B%F{blue}[%*]"

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
