use v5.16;

my ($FOREGROUND, $BACKGROUND, $INITIAL, $FINAL) = (38, 48, 0, 255);

my $resetdefault = "\x1b[0m";
my $resetwithspace = "$resetdefault ";

sub color_range {
    my ($start, $end, $anyground) = @_;
    my $resetoutput = $resetwithspace;

    for (my $color = $start; $color <= $end; $color++) {
        # Add a newline every 16 columns with the help of `say` function.
        say if ($color % 16 == 0);

        if ($color == $end) {
            $resetoutput = $resetdefault;
        }

        printf("\x1b[%d;5;%dm%3d%s", $anyground, $color, $color, $resetoutput);
    }
}

printf("\x1b[1;37m%d to %d Colors (FOREGROUND)%s\n", $INITIAL, $FINAL, $resetdefault);
color_range($INITIAL, $FINAL, $FOREGROUND);
say "\n";

printf("\x1b[1;37m%d to %d Colors (BACKGROUND)%s\n", $INITIAL, $FINAL, $resetdefault);
color_range($INITIAL, $FINAL, $BACKGROUND);
say "\n";
