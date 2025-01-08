<?php

const FOREGROUND = 38;
const BACKGROUND = 48;

function color_range($start, $end, $anyground) {
    $resetdefault = "\x1b[0m";
    $resetwithspace = "\x1b[0m ";

    $resetoutput = $resetwithspace;

    for ($color = $start; $color <= $end; $color++) {
        if ($color % 16 == 0) {
            printf("\n");
        }

        if ($color == $end) {
            $resetoutput = $resetdefault;
        }

        printf("\x1b[%d;5;%dm%3d%s", $anyground, $color, $color, $resetoutput);
    }
}

printf("\x1b[1;39m0 to 255 Colors (FOREGROUND)\x1b[22;0m\n");
color_range(0, 255, FOREGROUND);
printf("\n\n");

printf("\x1b[1;39m0 to 255 Colors (BACKGROUND)\x1b[22;0m\n");
color_range(0, 255, BACKGROUND);
printf("\n\n");
