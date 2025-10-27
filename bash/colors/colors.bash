#!/bin/bash

set -e

FOREGROUND=38
BACKGROUND=48
INITIAL=0
FINAL=255

color_range() {
    local start=$1
    local end=$2
    local anyground=$3

    for ((color=start; color <= end; color++))
    do
        if [ $((color % 16)) == 0 ]
        then
            printf "\n"
        fi

        printf "\033[%d;5;%dm%3d\033[0m " "$anyground" "$color" "$color"
    done
}

printf "\033[1;39m%d to %d Colors (FOREGROUND)\033[22;0m\n" "$INITIAL" "$FINAL"
color_range $INITIAL $FINAL $FOREGROUND
printf "\n\n"

printf "\033[1;39m%d to %d Colors (BACKGROUND)\033[22;0m\n" "$INITIAL" "$FINAL"
color_range $INITIAL $FINAL $BACKGROUND
printf "\n\n"
