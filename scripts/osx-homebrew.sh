#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" && . "../lib/helpers.sh"

# Specify your defaults in this environment variable
export HOMEBREW_CASK_OPTS="--appdir=~/Applications --fontdir=/Library/Fonts"

install_homebrew () {
    if ! command -v "brew" ; then
        printf "\n" | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null
        #  └─ simulate the ENTER keypress
        log_exit $? "Homebrew"
    else
        log_warn "Homebrew already installed"
        return 0
    fi
}

install_taps () {
    brew_tap "homebrew/bundle"
    brew_tap "homebrew/cask"
    brew_tap "homebrew/cask-fonts"
    brew_tap "homebrew/cask-versions"
    brew_tap "homebrew/core"
    brew_tap "sambadevi/powerlevel9k"
}

install_packages () {
    brew_install "bash"
    brew_install "bash-completion@2"
    brew_install "bash-git-prompt"
    brew_install "diff-so-fancy"
    brew_install "fzf"
    brew_install "git"
    brew_install "git-standup"
    brew_install "htop"
    brew_install "nvm"
    brew_install "pipenv"
    brew_install "python"
    brew_install "python@2"
    brew_install "pyenv"
    brew_install "qlcolorcode"
    brew_install "qlmarkdown"
    brew_install "quicklook-json"
    brew_install "quicklook-csv"
    brew_install "qlstephen"
    brew_install "the_silver_searcher"
    brew_install "tldr"
    brew_install "wget"
    brew_install "zsh"
    brew_install "zplug"
}

install_applications () {
    cask_install "1password" "/Applications"
    cask_install "adoptopenjdk8"
    cask_install "android-studio"
    cask_install "android-platform-tools"
    cask_install "android-sdk"
    cask_install "boostnote"
    cask_install "dropbox" "/Applications"
    cask_install "evernote"
    cask_install "iina"
    cask_install "firefox"
    cask_install "font-fira-code"
    cask_install "font-iosevka"
    cask_install "iterm2"
    cask_install "macdown"
    cask_install "numi"
    cask_install "sublime-merge"
    cask_install "sublime-text"
    cask_install "the-unarchiver"
    cask_install "transmission"
    cask_install "vscodium"
}

main () {
    log_arrow "Install Homebrew"
    install_homebrew

    log_arrow "Install Taps"
    install_taps

    log_arrow "Install Packages"
    install_packages

    log_arrow "Install Applications"
    install_applications
}

main
