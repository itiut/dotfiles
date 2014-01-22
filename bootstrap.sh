#!/bin/sh -eu
PROGRAM=$(basename $0)

init_submodules() {
    echo "[$PROGRAM] init submodules..."

    git submodule update --init
}

link_dotfiles() {
    echo "[$PROGRAM] link dotfiles..."

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
                ln -is "$PWD/$dotfile" $HOME
                ;;
        esac
    done
}

cd $(dirname $0)
init_submodules
link_dotfiles
