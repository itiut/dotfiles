dotfiles
====

My dotfiles

Environment
----

* Ubuntu 14.04

Usage
----

```sh
$ git clone git@github.com:itiut/dotfiles.git ~/.dotfiles
$ ~/.dotfiles/bootstrap.sh
```

`bootstrap.sh` does followings:

* link `dotfiles/bin` to `$HOME`
* link `dotfiles/.*` to `$HOME`
  * except for `.git`, `.gitignore`, `.gitmodule` and `.zsh_history`
* link `$HOME/Dropbox/.share/.*` to `$HOME`

When creating symbloic links, `bootstrap.sh` does not overwrite existing ones.

Automatic setup by `ansible`
----
I use `ansible` to setup my Ubuntu machine automatically.

Ansible playbooks for my Ubuntu machine are in [itiut/itiut-ansible-ubuntu](https://github.com/itiut/itiut-ansible-ubuntu).
