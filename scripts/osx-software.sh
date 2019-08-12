#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" && . "../lib/helpers.sh"

osx_available_updates () {
    tmp_file="$(mktemp /tmp/XXXXX)"
    softwareupdate -l &> "${tmp_file}"

    if cat "${tmp_file}" | grep -q "\*"; then
        return 0
    fi
    return 1
}

osx_install_update () {
    if osx_available_updates ; then
        log_info "Found OSX update"
        ask_for_confirmation "Do you want to install them ?"
        if answer_for_confirmation ; then
            sudo softwareupdate -ia
        fi

        if answer_for_confirmation "Do you want to restart ? (recommended)"; then
            restart
        fi
    else
        log_warn "OSX is up-to-date"
    fi
}

# Set Defaults for Sleep
osx_set_no_sleep () {
    sudo pmset -a sleep 0
    sudo pmset -a disksleep 0
}

# Set Hostname from DNS
osx_set_hostname () {
    local MY_NAME="$1"
    sudo scutil --set ComputerName "${MY_NAME}"
    sudo scutil --set HostName "${MY_NAME}"
    sudo scutil --set LocalHostName "{$MY_NAME}"
    sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "{$MY_NAME}"
}

main () {
    log_arrow "Install OSX update"
    ask_for_sudo
    osx_install_update
    osx_set_no_sleep
    osx_set_hostname
    log_empty_line
}

main
