#!/bin/bash

hit_goal() {
    local frames=(
        "🥅                  ⚽|0.30"
        "🥅                ⚽  |0.25"
        "🥅              ⚽    |0.20"
        "🥅            ⚽      |0.17"
        "🥅          ⚽        |0.14"
        "🥅        ⚽          |0.11"
        "🥅      ⚽            |0.09"
        "🥅    ⚽              |0.07"
        "🥅  💥                |0.10"
        "🥅💥                  |0.20"
        "🔥                    |0.60"
    )

    local frame delay
    for entry in "${frames[@]}"; do
        IFS="|" read -r frame delay <<< "${entry}"
        printf "\r%s" "${frame}"
        sleep "${delay}"
    done
    printf "\r\033[K"
}

printf "\033[?25l"  # hide cursor
trap 'printf "\033[?25h"' EXIT INT TERM

hit_goal
