#include <cstdio>

constexpr int FOREGROUND = 38;
constexpr int BACKGROUND = 48;
constexpr int INITIAL = 0;
constexpr int FINAL = 255;

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
    std::printf("\x1b[1;39m%d to %d Colors (FOREGROUND)\x1b[22;0m\n", INITIAL, FINAL);
    color_range(INITIAL, FINAL, FOREGROUND);
    std::puts("\n");

    std::printf("\x1b[1;39m%d to %d Colors (BACKGROUND)\x1b[22;0m\n", INITIAL, FINAL);
    color_range(INITIAL, FINAL, BACKGROUND);
    std::puts("\n");
}

