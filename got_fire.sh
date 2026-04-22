#!/bin/bash

readonly delay=0.20

got_fire_lines() {
    local frames=(
        "                🔥🐉"
        "              🔥🔥🐉"
        "            🔥🔥🔥🐉"
        "          🔥🔥🔥  🐉"
        "        🔥🔥🔥    🐉"
        "      🔥🔥🔥      🐉"
        "    🔥🔥🔥        🐉"
        "  🔥🔥🔥          🐉"
        "🔥🔥🔥            🐉"
        "🔥🔥              🐉"
        "🔥                🐉"
    )

    for frame in "${frames[@]}"; do
        printf "\r%s" "${frame}"
        sleep "${delay}"
    done
    printf "\r\033[K"
}

printf "\033[?25l"  # hide cursor
trap 'printf "\033[?25h"' EXIT INT TERM

got_fire_lines
