#!/bin/bash

gut_enough() {
    local delay=0.3
    local emojis=("🏅" "🥇" "🥈" "🥉" "💣" "💥" "🔥" "🔥")

    for emoji in "${emojis[@]}"; do
        printf "\r%s" "${emoji}"
        sleep "${delay}"
    done
    printf "\r\033[K"
}

printf "\033[?25l"  # hide cursor
trap 'printf "\033[?25h"' EXIT INT TERM

gut_enough
