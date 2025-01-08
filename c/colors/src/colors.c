#include <stdio.h>

const int FOREGROUND = 38;
const int BACKGROUND = 48;

void color_range(int start, int end, int anyground)
{
    const char* resetdefault = "\x1b[0m";
    const char* resetwithspace = "\x1b[0m ";

    const char* resetoutput = resetwithspace;

    for (int color = start; color <= end; color++) {
        if (color % 16 == 0) {
            putchar('\n');
        }

        if (color == end) {
            resetoutput = resetdefault;
        }

        printf("\x1b[%d;5;%dm%3d%s", anyground, color, color, resetoutput);
    }
}

int main(void)
{
    puts("\x1b[1;39m0 to 255 Colors (FOREGROUND)\x1b[22;0m");
    color_range(0, 255, FOREGROUND);
    puts("\n");

    puts("\x1b[1;39m0 to 255 Colors (BACKGROUND)\x1b[22;0m");
    color_range(0, 255, BACKGROUND);
    puts("\n");

    return 0;
}

