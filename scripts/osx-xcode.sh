#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" && . "../lib/helpers.sh"

xcode_install() {
    # If necessary, prompt user to install `Xcode`.
    if [ ! -d "/Applications/Xcode.app" ]; then
        log_exit "1" "Xcode is not installed. Go to App Store and Install it."
    fi
}

xcode_install_cli () {
    xcode-select --install &> /dev/null
    log_exit "$?" "Install Xcode Command Line Tools"
}

xcode_accept_license () {
    # Automatically agree to the terms of the `Xcode` license.
    # https://github.com/alrra/dotfiles/issues/10
    sudo xcodebuild -license accept &> /dev/null
    log_exit "$?" "Accept Xcode License"
}

xcode_set_developer_directory () {
    # Point the `xcode-select` developer directory to
    # the appropriate directory from within `Xcode.app`.
    # https://github.com/alrra/dotfiles/issues/13
    # https://stackoverflow.com/questions/17980759/xcode-select-active-developer-directory-error/17980786#17980786
    DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer"
    sudo xcode-select -switch "${DEVELOPER_DIR}" &> /dev/null
    log_exit "$?" "Switch to ${DEVELOPER_DIR}"
}

main () {
    log_arrow "Install Xcode and Command Line Tools"
    xcode_install
    xcode_install_cli
    xcode_accept_license
    xcode_set_developer_directory
}

main
