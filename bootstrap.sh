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

create_link_to_home() {
    ln --symbolic --force --verbose $1 $HOME
}

link_bin() {
    echo_with_program_name "link bin in $PWD"
    create_link_to_home $PWD/bin
}

_link_dotfiles() {
    echo_with_program_name "link dotfiles in $PWD"
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
                create_link_to_home $PWD/$dotfile;;
        esac
    done
}

link_dotfiles() {
    if [ $# -eq 1 ]; then
        path=$1
    else
        path=$PWD
    fi

    oldpath=$PWD
    cd $path

    _link_dotfiles

    cd $oldpath
}

cd $(dirname $0)
init_submodules
link_bin
link_dotfiles
link_dotfiles $HOME/Dropbox/.share
