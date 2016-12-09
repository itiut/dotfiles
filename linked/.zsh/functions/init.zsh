#!/usr/bin/env zsh
### autolaod
autoload -Uz \
  cdup-or-insert-circumflex \
  fzf-cd-ghq \
  fzf-git-commit-hash \
  gen-mit-license

autoload -z \
  fzf-browse-ghq \
  ls-and-git-status \
  open-current-directory

### keybinding
# cdup-or-insert-circumflex by <^>
zle -N cdup-or-insert-circumflex
bindkey '\^' cdup-or-insert-circumflex

# fzf-browse-ghq by <alt-]>
zle -N fzf-browse-ghq
bindkey '^[]' fzf-browse-ghq

# fzf-cd-ghq by <ctrl-]>
zle -N fzf-cd-ghq
bindkey '^]' fzf-cd-ghq

# fzf-git-commit-hash by <alt-@>
zle -N fzf-git-commit-hash
bindkey '^[@' fzf-git-commit-hash

# ls-and-git-status by <alt-l>
zle -N ls-and-git-status
bindkey '^[l' ls-and-git-status

# open-current-directory by <ctrl-o>
zle -N open-current-directory
bindkey '^O' open-current-directory
