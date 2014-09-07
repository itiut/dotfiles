#!/usr/bin/env bash
set -eu

DONE="\033[32mDONE\033[0m"
SKIP="\033[34mSKIP\033[0m"
ERROR="\033[31mERROR\033[0m"

install_command_line_tools() {
    if ! which xcode-select &> /dev/null; then
        echo -e "[ $ERROR ] xcode-select is not found."
        return 1
    fi

    if xcode-select -p &> /dev/null; then
        echo -e "[ $SKIP ] Command Line Tools is already installed."
        return 0
    fi

    xcode-select --install
    # TODO: need to wait?
    echo -e "[ $DONE ] Install Command Line Tools"
}

install_homebrew() {
    if which brew &> /dev/null; then
        echo -e "[ $SKIP ] Homebrew is already installed."
        return 0
    fi

    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
    brew doctor
    echo -e "[ $DONE ] Install Homebrew"
}

update_formulas() {
    local line

    while read line; do
        if [ "$line" = "" ]; then
            continue
        fi

        local commands=($line)
        if [ "${commands[0]}" = "install" ]; then
            if brew list | grep "${commands[1]##*/}" &> /dev/null; then
                # already installed formula
                continue
            fi

        elif [ "${commands[0]}" = "cask" ] && [ "${commands[1]}" = "install" ]; then
            if brew cask list | grep "${commands[2]}" &> /dev/null; then
                # already installed cask formula
                continue
            fi

        elif [ "$line" = "cask alfred link" ]; then
            if brew cask alfred status &> /dev/null; then
                # already linked
                continue
            fi
        fi 

        eval "brew $line"
    done
    echo -e "[ $DONE ] Update Formulas"
}

install_command_line_tools
install_homebrew

update_formulas <<EOBREWFILE
update
upgrade

install the_silver_searcher
install aspell
install emacs --cocoa --japanese --srgb --with-gnutls
install git
install gist
install hub
install rbenv
install ruby-build
install ssh-copy-id
install tig
install zsh

install caskroom/cask/brew-cask
cask install alfred
cask install bettertouchtool
cask install dropbox
cask install google-chrome
cask install google-japanese-ime
cask install iterm2
cask install java
cask install menumeters
cask alfred link

cleanup
EOBREWFILE
