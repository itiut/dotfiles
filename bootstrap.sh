#!/bin/sh -eu

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
link_dotfiles
