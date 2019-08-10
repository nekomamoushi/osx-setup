#!/usr/bin/env bash

RESET='\033[0m'
BOLD='\033[1m'
ITALIC='\033[3m'
UNDERLINE='\033[4m'

BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'

SUCCESS_SYMBOL="✓"
ERROR_SYMBOL="✗"
WARNING_SYMBOL="⚠"
INFO_SYMBOL="i"
ARROW_SYMBOL="➜"
QUESTION_SYMBOL="?"
EXIT_SYMBOL="☠"

log () {
    printf "%s\n" "$1"
}

log_empty_line () {
    printf "\n"
}

log_header () {
    printf "• %b%s%b\n" "${WHITE}" "$1" "${RESET}"
    log ""
}

log_info () {
    printf "\r    [ %b%s%b ] %s\n" "${WHITE}" "${INFO_SYMBOL}" "${RESET}" "$1"
}

log_arrow () {
    printf "  %b%s %b%s%b\n" "${BLUE}" "${ARROW_SYMBOL}" "${italic}" "$1" "${RESET}"
    log ""
}

log_question () {
    printf "    [ %b%s%b ] %s : " "${CYAN}" "${QUESTION_SYMBOL}" "${RESET}" "$1"
}

log_wait () {
    printf "\r    [ %s ] %s" " " "$1"
}

log_success () {
    printf "\r    [ %b%s%b ] %s\n" "${GREEN}" "${SUCCESS_SYMBOL}" "${RESET}" "$1"
}

log_warn () {
    printf "    [ %b%s%b ] %s\n" "${YELLOW}" "${WARNING_SYMBOL}" "${RESET}" "$1"
}

log_error () {
    printf "\r    [ %b%s%b ] %s\n" "${RED}" "${ERROR_SYMBOL}" "${RESET}" "$1"
}

log_error_stream() {
    while read -r line; do
        print_error "↳ ERROR: $line"
    done
}

log_result () {
    if [ "$1" = "0" ] ; then
        log_success "$2"
    else
        log_error "$2"
    fi
}

log_exit () {
    if [ "$1" = "0" ] ; then
        log_success "$2"
        return 0
    else
        printf "\n\n%b%s%b\n\n" "${RED}" "↳ EXIT: $2" "${reset}"
        exit 1
    fi
}

get_os () {
    OS_TYPE=$(uname -s)
    printf "%s" "${OS_TYPE}"
}

verify_os () {
    OS_TYPE=$(get_os)
    if [ "${OS_TYPE}" == "$1" ] ; then
        return 0
    else
        return 1
    fi
}

has () {
    command -v "$1" &> /dev/null
}

ask_for_confirmation () {
    log_question "$1 (y/n) "
    read -r -n 1
    printf "\n"
}

answer_for_confirmation () {
    [[ "${REPLY}" =~ ^[Yy]$ ]] && return 0 || return 1
}

ask_for_sudo () {

    # Ask for the administrator password upfront.
    sudo -v &> /dev/null

    # Update existing `sudo` time stamp
    # until this script has finished.
    #
    # https://gist.github.com/cowboy/3118588
    while true; do
        sudo -n true
        sleep 60
        kill -0 "$$" || exit
    done &> /dev/null &
}

restart () {
    ask_for_confirmation "Do you want to restart"
    if ! answer_for_confirmation; then
        return 0
    fi
    sudo shutdown -r now &> /dev/null
}

execute () {
    command="$1"
    message="${2:-$1}"
    tmp_file="$(mktemp /tmp/XXXXX)"
    exit_code=0
    pid_command=""

    log_wait "${message}"
    # Execute commands in background
    eval "${command}" &> /dev/null 2> "${tmp_file}" &
    pid_command=$!

    # Wait for the commands to no longer be executing
    # in the background, and then get their exit code.
    wait "${pid_command}" &> /dev/null
    exit_code=$?

    # Print output based on what happened.
    log_result "${exit_code}" "$MSG"

    if [ ${exit_code} -ne 0 ]; then
        log_error_stream < "${tmp_file}"
    fi

    rm -rf "${tmp_file}}"

    return ${exit_code}
}

brew_tap () {
    local command="brew tap $1"
    execute "${command}"
}

brew_install () {
    local command="brew install $1"

    if brew list "$1" &> /dev/null ; then
        log_warn "$1 is already installed"
        return 0
    fi

    execute "${command}"
}

cask_install () {
    local command=""
    local options="$2"

    if brew cask list "$1" &> /dev/null ; then
        log_warn "$1 is already installed"
        return 0
    fi

    command="brew cask install $1"
    if [ ! -z "${options}" ]; then
        command="brew cask install $2 $1"
    fi

    execute "${command}"
}

mas_install () {
    local command="mas install $1"

    if mas list | grep "$1" &> /dev/null ; then
        log_warn "$1 is already installed"
        return 0
    fi

    execute "${command}"
}
