#!/bin/sh
set -eu
PROGRAM=$(basename $0)

init_submodules() {
    echo "[$PROGRAM] init submodules"
    git submodule update --init
}

link_bin_and_dotfiles() {
    echo "[$PROGRAM] link bin"
    ln -is $PWD/bin $HOME

    echo "[$PROGRAM] link dotfiles"
    for dotfile in .?*; do
        case $dotfile in
            ..)
                continue;;
            .git)
                continue;;
            .gitignore)
                continue;;
            .gitmodules)
                continue;;
            *)
                ln -is $PWD/$dotfile $HOME;;
        esac
    done
}

link_dropbox_shared_dotfiles() {
    echo "[$PROGRAM] link dropbox shared dotfiles"
    local paths=$HOME/Dropbox/.share/.?*
    for path in $paths; do
        case $(basename $path) in
            .gitconfig.local)
                ln -is $path $HOME;;
        esac
    done
}

cd $(dirname $0)
init_submodules
link_bin_and_dotfiles
link_dropbox_shared_dotfiles
