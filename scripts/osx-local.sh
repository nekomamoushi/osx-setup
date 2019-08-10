#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" && . "../lib/helpers.sh"

osx_update_shells_list () {
	for shell_name in "$@"; do
		printf "%s\n" "${shell_name}" | sudo tee -a /etc/shells
		log_result $? "Add ${shell_name} to /etc/shells"
	done
}

change_default_shell () {
	local new_default_shell=$1
	chsh -s "${new_default_shell}"
	log_result $? "Setting Up Default shell: ${new_default_shell}"
}

main () {
	local homebrew_bash="/usr/local/bin/bash"
	local homebrew_zsh="/usr/local/bin/zsh"
	osx_update_shells_list "${homebrew_bash}" "${homebrew_zsh}"
	change_default_shell "${homebrew_zsh}"
}

main

