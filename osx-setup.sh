#!/usr/bin/env bash
set -eu
cd $(dirname $0)

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

_update_repository() {
    local repository=$1
    local directory=$2

    if [ -d $directory ]; then
        # already cloned
        cd $directory
        git pull
        cd - > /dev/null

    else
        hub clone $repository $directory
    fi
}

update_repositories() {
    _update_repository "zsh-users/antigen" "$HOME/.zsh.d/antigen"
    _update_repository "rupa/z"            "$HOME/.zsh.d/z"
    _update_repository "git@bitbucket.org:itiut/fonts.git" "$HOME/.fonts"
    echo -e "[ $DONE ] Update Repositories"
}

_create_symlink() {
    local target=$1
    local link=$2

    if [ -L $link ]; then
        # symlink already exists
        return 0

    elif [ -e $link ]; then
        # another file or directory exists
        echo -e "[ $ERROR ] file or directory exists in $link."
        return 1
    fi

    if [ ! -e $(dirname $link) ]; then
        mkdir -pv $(dirname $link)
    fi
    ln -sv $target $link
}

update_dotfiles() {
    local dotfiles=(
        ".Xmodmap"
        ".aspell.conf"
        ".gemrc"
        ".gitconfig"
        ".rspec"
        ".rubocop.yml"
        ".tigrc"
        ".vimrc"
        ".zsh.d/itiut.zsh-theme"
        ".zshenv"
        ".zshrc"
    )
    local private_dotfiles=(
        ".gitconfig.local"
        ".ssh/config"
        ".zshenv.local"
    )

    for dotfile in ${dotfiles[@]}; do
        _create_symlink $PWD/linked/$dotfile $HOME/$dotfile
    done

    for dotfile in ${private_dotfiles[@]}; do
        _create_symlink $HOME/Dropbox/.share/$dotfile $HOME/$dotfile
    done

    echo -e "[ $DONE ] Update Dotfiles"
}

install_login_shell() {
    local zsh_paths=(
        "/usr/local/bin/zsh"
        "/bin/zsh"
    )

    for path in ${zsh_paths[@]}; do
        if ls $path &> /dev/null; then
            if [ "$path" = "$SHELL" ]; then
                # already set to $path
                echo -e "[ $SKIP ] Login shell is already installed."
                return 0
            fi

            # set to $path
            if ! cat /etc/shells | grep $path &> /dev/null; then
                sudo sh -c "echo $path >> /etc/shells"
            fi
            chsh -s $path
            echo -e "[ $DONE ] Install Login shell"
            return 0
        fi
    done

    # not found
    echo "[ $ERROR ] Login shell is not found."
    return 1
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

update_repositories
update_dotfiles
install_login_shell
