# prioritize dircolors
if whence dircolors > /dev/null && [ -f $HOME/.dircolors ]; then
  eval "$(dircolors $HOME/.dircolors)"
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

# man page
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;38;5;208m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[04;38;5;111m'

# prompt
local prompt_status='%(?..%K{red} %{$fg[black]%}✘ %? )%k'
local prompt_time='%K{247} %{$fg[black]%}%D{%T} %k'
local prompt_user='%K{237} %{$fg[yellow]%}%n %k'
local prompt_dir='%K{236} %F{033}%~ %k'
local prompt_git_info='$(git_prompt_info)$(git_prompt_status) %k'
ZSH_THEME_GIT_PROMPT_PREFIX="%K{235} %{$fg_bold[magenta]%} %{$fg_no_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=''
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%} ✔"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%} ✘"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%} ✚"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[magenta]%} ⬆"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg_bold[red]%} ⬇"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%} ✱"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[blue]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[magenta]%} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[cyan]%} ✭"
local prompt_char='%(?.%{$fg_bold[green]%}.%{$fg_bold[red]%})» %f%b'

PROMPT="
${prompt_status}${prompt_time}${prompt_user}${prompt_dir}${prompt_git_info}
${prompt_char}"
