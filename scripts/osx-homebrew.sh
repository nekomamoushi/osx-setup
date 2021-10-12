#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" && . "../lib/helpers.sh"

# Specify your defaults in this environment variable
export HOMEBREW_CASK_OPTS="--appdir=~/Applications --fontdir=/Library/Fonts"

install_homebrew () {
    if ! command -v "brew" ; then
        printf "\n" | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" &> /dev/null
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
    brew_install "awscli"
    brew_install "diff-so-fancy"
    brew_install "exa"
    brew_install "fzf"
    brew_install "gh"                   # Github CLI
    brew_install "git"
    brew_install "git-standup"
    brew_install "htop"
    brew_install "mas"
    brew_install "n"
    brew_install "python@3"
    brew_install "pipenv"
    brew_install "the_silver_searcher"
    brew_install "thefuck"
    brew_install "tldr"
    brew_install "wget"
    brew_install "zsh"
    brew_install "zplug"
    log_empty_line
}

install_applications () {
    cask_install "1password" "--appdir=/Applications --no-quarantine"
    cask_install "appcleaner"
    cask_install "cheatsheet"
    cask_install "dropbox" "--appdir=/Applications"
    cask_install "firefox" "--appdir=/Applications"
    cask_install "font-cascadia-mono"
    cask_install "font-hack-nerd-font"
    cask_install "font-iosevka"
    cask_install "font-jetbrains-mono"
    cask_install "github"
    cask_install "iina"
    cask_install "iterm2"
    cask_install "google-chrome" "--appdir=/Applications"
    cask_install "mark-text"
    cask_install "netnewswire"
    cask_install "numi"
    cask_install "postman"
    cask_install "qlcolorcode"  # https://github.com/sindresorhus/quick-look-plugins
    cask_install "qlimagesize"
    cask_install "qlmarkdown"
    cask_install "qlstephen"
    cask_install "quicklook-json"
    cask_install "quicklook-csv"
    cask_install "spotify"
    cask_install "sublime-merge"
    cask_install "sublime-text"
    cask_install "the-unarchiver"
    cask_install "transmission"
    cask_install "tweeten"
    cask_install "vlc"
    cask_install "visual-studio-code"

    mas_install "1287445660"  # Agenda.
    mas_install "442160987"   # FlyCut
    mas_install "441258766"   # Magnet
    mas_install "1006087419"  # SnippetsLab
    mas_install "1284863847"  # Unsplash Wallpapers

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
