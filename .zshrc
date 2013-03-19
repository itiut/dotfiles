# 文字コード
export LANG=ja_JP.UTF-8

# zshディレクトリ
export ZSHDIR=${HOME}/.zsh.d

# Pathの設定
export PATH=${HOME}/android-sdks/platform-tools:${PATH}
export PATH=${HOME}/.nodebrew/current/bin:${PATH}
export PATH=${HOME}/.rbenv/bin:${PATH}
export PATH=/opt/altera/11.0sp1/quartus/bin:/opt/altera/11.0sp1/modelsim_ase/bin:${PATH}

# 補完
autoload -U compinit; compinit

# Emacsキーバインド
bindkey -e

# 履歴
# 履歴を保存するファイル指定
HISTFILE=${ZSHDIR}/.zsh_history

# 履歴の件数
HISTSIZE=10000
SAVEHIST=10000

# 履歴を共有する
setopt share_history

# 重複するコマンドを履歴に記録しない
setopt hist_ignore_all_dups

# 先頭にスペースを入れると履歴に記録しない
setopt hist_ignore_space

# 履歴にhistoryコマンドを記録しない
setopt hist_no_store

# 余分なスペースを削除して履歴に記録する
setopt hist_reduce_blanks

# 補完候補が複数ある時に、一覧表示
setopt auto_list

# 保管結果をできるだけ詰める
setopt list_packed

# 補完の時に大文字小文字を区別しない(但し大文字は小文字に変換しない)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完キー（Tab, Ctrl+I) を連打するだけで順に補完候補を自動で補完
setopt auto_menu

# Shift+Tabで逆順に補完
bindkey "\e[Z" reverse-menu-complete

# カッコの対応などを自動的に補完
setopt auto_param_keys

# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

# 補完候補リストの日本語を正しく表示
setopt print_eight_bit

# コマンド訂正
setopt correct

# 履歴の検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# 色の設定
export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx
export LS_COLORS='di=01;36:ln=01;35:ex=01;32'
zstyle ':completion:*' list-colors 'di=01;36' 'ln=01;35' 'ex=01;32'

# エイリアスの設定
alias -g L="| less"
alias -g H="| head"
alias -g T="| tail"
alias -g G="| grep"

alias ls="ls --classify --color"
alias la="ls -a"
alias ll="ls -l"
alias lla="ls -al"
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias grep="grep --color"

alias a="./a.out"
alias c="cd"
alias e="emacsclient --no-wait --alternate-editor=vim"
alias g="git"
alias l="ls"
alias o="xdg-open"
alias v="vim"

# ディレクトリ名だけでcdする
setopt auto_cd

# cdするときに自動でpushdする
setopt auto_pushd

#cdした後に自動でlsする
function chpwd() { ls }

# ^ でcd ..する
function cdup() {
    echo
    cd ..
    zle reset-prompt
}
zle -N cdup
bindkey '\^' cdup

# ビープ音をならなさない
setopt nobeep

# グロブ(*)でマッチングエラーを出さない
setopt nonomatch

# エディタ
export EDITOR=vim

# autojump
# $ sudo apt-get install autojump
if [ -d "/usr/share/autojump" ]; then
    source "/usr/share/autojump/autojump.zsh"
fi

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
# 文字が重ならないようにする
ZSH_THEME_GIT_PROMPT_STAGED="$ZSH_THEME_GIT_PROMPT_STAGED "
ZSH_THEME_GIT_PROMPT_CONFLICTS="$ZSH_THEME_GIT_PROMPT_CONFLICTS "
ZSH_THEME_GIT_PROMPT_CHANGED="$ZSH_THEME_GIT_PROMPT_CHANGED "
ZSH_THEME_GIT_PROMPT_UNTRACKED="$ZSH_THEME_GIT_PROMPT_UNTRACKED "
ZSH_THEME_GIT_PROMPT_CLEAN="$ZSH_THEME_GIT_PROMPT_CLEAN "

# プロンプトの設定
autoload colors; colors
PROMPT=$'
 %B%F{yellow}%~ $(git_super_status)
%B%F{green}[%n@%m]%f%b$ '
PROMPT2="[%n]> "
RPROMPT="%B%F{blue}[%*]"

case "${TERM}" in
# ターミナルの設定
kterm*|xterm)
    precmd() {
        # ウィンドウタイトルにユーザー名とホスト名を表示
        echo -ne "\033]0;${USER}@${HOST}\007"
    }
;;
# screen, byobuの設定
screen|screen-bce)
    preexec() {
        # タイトルにプロセス名を表示
        echo -ne "\ek#${1%% *}\e\\"
    }
    precmd() {
        # タイトルにディレクトリを名表示
        echo -ne "\ek${PWD:t}\e\\"
     }
;;
esac

# npm completion
eval "$(npm completion 2>/dev/null)"

# rbenv completion
eval "$(rbenv init -)"
