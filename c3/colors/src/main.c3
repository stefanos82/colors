module colors;
import std::io;

const int FOREGROUND = 38;
const int BACKGROUND = 48;
const int INITIAL = 0;
const int FINAL = 255;

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
    io::printfn("\x1b[1;39m%d to %d Colors (FOREGROUND)\x1b[22;0m", INITIAL, FINAL);
    color_range(INITIAL, FINAL, FOREGROUND);
    io::printn("\n");

    io::printfn("\x1b[1;39m%d to %d Colors (BACKGROUND)\x1b[22;0m", INITIAL, FINAL);
    color_range(0, 255, BACKGROUND);
    io::printn("\n");
    return 0;
}
