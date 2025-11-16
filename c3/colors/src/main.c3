module colors;
import std::io;

fn void color_range(int start, int end, int anyground)
{
    String resetdefault = "\x1b[0m";
    String resetwithspace = String.tconcat(resetdefault, " ");

    String resetoutput = resetwithspace;

    for (int color = start; color <= end; color++) {
        if (color % 16 == 0) io::printn();

        if (color == end) resetoutput = resetdefault;

        io::printf("\x1b[%d;5;%dm%3d%s", anyground, color, color, resetoutput);
    }
}

fn void main()
{
    var $fohground = 38;
    var $bahground = 48;

    var $clrBegin = 0;
    var $clrEnd = 255;

    io::printfn("\x1b[1;39m%d to %d Colors (FOREGROUND)\x1b[22;0m", $clrBegin, $clrEnd);
    color_range($clrBegin, $clrEnd, $fohground);
    io::printn("\n");

    io::printfn("\x1b[1;39m%d to %d Colors (BACKGROUND)\x1b[22;0m", $clrBegin, $clrEnd);
    color_range($clrBegin, $clrEnd, $bahground);
    io::printn("\n");
}
