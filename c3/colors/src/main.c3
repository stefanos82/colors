module colors;
import std::io;

const int FOREGROUND = 38;
const int BACKGROUND = 48;

fn void color_range(int start, int end, int anyground)
{
    String resetdefault = "\x1b[0m";
    String resetwithspace = "\x1b[0m ";

    String resetoutput = resetwithspace;

    for (int color = start; color <= end; color++) {
        if (color % 16 == 0) io::printn();

        if (color == end) resetoutput = resetdefault;

        io::printf("\x1b[%d;5;%dm%3d%s", anyground, color, color, resetoutput);
    }
}

fn int main(String[] args)
{
    io::printn("\x1b[1;39m0 to 255 Colors (FOREGROUND)\x1b[22;0m");
    color_range(0, 255, FOREGROUND);
    io::printfn("\n");

    io::printn("\x1b[1;39m0 to 255 Colors (BACKGROUND)\x1b[22;0m");
    color_range(0, 255, BACKGROUND);
    io::printfn("\n");
    return 0;
}
