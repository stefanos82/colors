use v5.16;

my $FOREGROUND = 38;
my $BACKGROUND = 48;

my $resetdefault = "\x1b[0m";
my $resetwithspace = "$resetdefault ";

sub color_range {
    my ($start, $end, $anyground) = @_;
    my $resetoutput = $resetwithspace;

    for (my $color = $start; $color <= $end; $color++) {
        print "\n" if ($color % 16 == 0);

        if ($color == $end) {
            $resetoutput = $resetdefault;
        }

        printf("\x1b[%d;5;%dm%3d%s", $anyground, $color, $color, $resetoutput);
    }
}

printf("\x1b[1;37m0 to 255 Colors (FOREGROUND)%s\n", $resetdefault);
color_range(0, 255, $FOREGROUND);
say "\n";

printf("\x1b[1;37m0 to 255 Colors (BACKGROUND)%s\n", $resetdefault);
color_range(0, 255, $BACKGROUND);
say "\n";
