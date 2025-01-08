#include <cstdio>

constexpr int FOREGROUND = 38;
constexpr int BACKGROUND = 48;

void color_range(int start, int end, int anyground)
{
    const char* resetdefault = "\x1b[0m";
    const char* resetwithspace = "\x1b[0m ";

    const char* resetoutput = resetwithspace;

    for (int color = start; color <= end; color++) {
        if (color % 16 == 0) {
            std::putchar('\n');
        }

        if (color == end) {
            resetoutput = resetdefault;
        }

        std::printf("\x1b[%d;5;%dm%3d%s", anyground, color, color, resetoutput);
    }
}

int main()
{
    std::printf("\x1b[1;39m0 to 255 Colors (FOREGROUND)\x1b[22;0m\n");
    color_range(0, 255, FOREGROUND);
    std::puts("\n");

    std::printf("\x1b[1;39m0 to 255 Colors (BACKGROUND)\x1b[22;0m\n");
    color_range(0, 255, BACKGROUND);
    std::puts("\n");
}

