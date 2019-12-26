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
        log_empty_line
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
    log_empty_line
}

install_packages () {
    brew_install "bash"
    brew_install "bash-completion@2"
    brew_install "bash-git-prompt"
    brew_install "diff-so-fancy"
    brew_install "exa"
    brew_install "fzf"
    brew_install "git"
    brew_install "git-standup"
    brew_install "htop"
    brew_install "mas"
    brew_install "nvm"
    brew_install "python"
    brew_install "python@2"
    brew_install "pipenv"
    brew_install "pyenv"
    brew_install "the_silver_searcher"
    brew_install "tldr"
    brew_install "wget"
    brew_install "zsh"
    brew_install "zplug"
    log_empty_line
}

install_applications () {
    cask_install "1password" "--appdir=/Applications --no-quarantine"
    cask_install "adoptopenjdk8"
    cask_install "android-studio"
    cask_install "android-platform-tools"
    cask_install "android-sdk"
    cask_install "anybar"
    cask_install "appcleaner"
    cask_install "docker"
    cask_install "dropbox" "--appdir=/Applications"
    cask_install "evernote"
    cask_install "firefox" "--appdir=/Applications"
    cask_install "font-fira-code"
    cask_install "font-hack-nerd-font"
    cask_install "font-iosevka"
    cask_install "iina"
    cask_install "iterm2"
    cask_install "google-chrome" "--appdir=/Applications"
    cask_install "lepton"
    cask_install "macdown"
    cask_install "netnewswire"
    cask_install "numi"
    cask_install "postman"
    cask_install "qlcolorcode"
    cask_install "qlmarkdown"
    cask_install "quicklook-json"
    cask_install "quicklook-csv"
    cask_install "qlstephen"
    cask_install "spotify"
    cask_install "sublime-merge"
    cask_install "sublime-text"
    cask_install "the-unarchiver"
    cask_install "transmission"
    cask_install "vscodium"

    mas_install "1284863847" # Unsplash Wallpapers
    mas_install "1287445660" # Agenda.

    log_empty_line
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

ask_for_sudo
main
