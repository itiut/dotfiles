#!/bin/sh -eu

init_submodules() {
    echo ""
    echo "init submodules..."

    git submodule update --init
}

link_dotfiles() {
    echo ""
    echo "link dotfiles..."

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
