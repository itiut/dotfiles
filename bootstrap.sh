#!/bin/sh
set -eu
PROGRAM=$(basename $0)

echo_with_program_name() {
    echo "[$PROGRAM] $1"
}

init_submodules() {
    echo_with_program_name 'init submodules'
    git submodule update --init
}

link_bin_and_dotfiles() {
    echo_with_program_name 'link bin'
    ln --symbolic --force --verbose $PWD/bin $HOME

    echo_with_program_name 'link dotfiles'
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
                ln --symbolic --force --verbose $PWD/$dotfile $HOME;;
        esac
    done
}

link_dropbox_shared_dotfiles() {
    echo_with_program_name 'link dropbox shared dotfiles'
    local paths=$HOME/Dropbox/.share/.?*
    for path in $paths; do
        case $(basename $path) in
            .gitconfig.local)
                ln --symbolic --force --verbose $path $HOME;;
        esac
    done
}

cd $(dirname $0)
init_submodules
link_bin_and_dotfiles
link_dropbox_shared_dotfiles
