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

main () {
    log_arrow "Install OSX update"
    osx_install_update
    log_empty_line
}

main
