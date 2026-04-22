#!/bin/bash

print_error_box() {
    local msg=" $1 "
    local width=${#msg}
    local border

    border=$(printf '%*s' "$width" '')
    border=${border// /─}

    printf "\033[31m┌${border}┐\033[0m\n"
    printf "\033[31m│\033[0m\033[41m\033[97m${msg}\033[0m\033[31m│\033[0m\n"
    printf "\033[31m└${border}┘\033[0m\n"
}

script_dir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

if [[ -L "${BASH_SOURCE[0]}" ]]; then
    wrong_git="${0##*/}"
else
    wrong_git="${1:-gti}"
fi
readonly wrong_git


box_error=

case "${wrong_git}" in
    "gti")
        "${script_dir}/gti_crash.sh" "$@"
        box_error="Crash 'n' burn"
        ;;
    "gut")
        "${script_dir}/gut_enough.sh" "$@"
        box_error="Nein! git ist nicht 'gut'"
        ;;
    "got")
        "${script_dir}/got_fire.sh" "$@"
        box_error="Dracarys"
        ;;
    "fit")
        "${script_dir}/fit_wallrun.sh" "$@"
        box_error="You've hit a wall"
        ;;
    "hit")
        "${script_dir}/hit_goal.sh" "$@"
        box_error="Shoot and miss"
        ;;
esac


print_error_box "${box_error}"
echo "'${wrong_git}' is not git 🤡"
