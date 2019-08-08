#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" && . "./lib/helpers.sh"

log ""
log "###############################################" $red
log "#        DO NOT RUN THIS SCRIPT BLINDLY       #" $red
log "#         YOU'LL PROBABLY REGRET IT...        #" $red
log "#                                             #" $red
log "#              READ IT THOROUGHLY             #" $red
log "#         AND EDIT TO SUIT YOUR NEEDS         #" $red
log "###############################################" $red
log ""

log_header "Intro"

if ! verify_os "Darwin"; then
    log_exit "1" "You are not on OSX"
fi
ask_for_confirmation "Have you read through the script you're about to run ?"
if ! answer_for_confirmation ; then
    log_exit "1" "Read the entire script before re-launch the script"
fi
ask_for_confirmation "Did you understand that it will make changes to your computer ?"
if ! answer_for_confirmation ; then
    log_exit "1" "Read the entire script before re-launch the script"
fi
log ""

log_header "OSX Software"
bash ./scripts/osx-software.sh
