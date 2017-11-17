#!/usr/bin/env zsh
### autolaod
autoload -Uz \
  cdup-or-insert-circumflex \
  fzf-ghq--cd \
  fzf-git-commit-hash \
  gen-mit-license

autoload -z \
  fzf-ghq--browse \
  ls-and-git-status \
  open-current-directory

### keybinding
# cdup-or-insert-circumflex by <^>
zle -N cdup-or-insert-circumflex
bindkey '\^' cdup-or-insert-circumflex

# fzf-ghq--browse by <alt-]>
zle -N fzf-ghq--browse
bindkey '^[]' fzf-ghq--browse

# fzf-ghq--cd by <ctrl-]>
zle -N fzf-ghq--cd
bindkey '^]' fzf-ghq--cd

# fzf-git-commit-hash by <alt-@>
zle -N fzf-git-commit-hash
bindkey '^[@' fzf-git-commit-hash

# ls-and-git-status by <alt-l>
zle -N ls-and-git-status
bindkey '^[l' ls-and-git-status

# open-current-directory by <ctrl-o>
zle -N open-current-directory
bindkey '^O' open-current-directory
