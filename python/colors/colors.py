FOREGROUND = 38
BACKGROUND = 48

def color_range(start, end, anyground):
    resetdefault = "\x1b[0m"
    resetwithspace = "\x1b[0m "

    resetoutput = resetwithspace
    for color in range(start, end):
        if color % 16 == 0:
            print()

        if color == end:
            resetoutput = resetdefault

        print("\x1b[%d;5;%dm%3d%s" % (anyground, color, color, resetoutput), end='')


def main():
    print("\x1b[1;39m0 to 255 Colors (FOREGROUND)\x1b[22;0m")
    color_range(0, 255, FOREGROUND)
    print("\n")
    print("\x1b[1;39m0 to 255 Colors (BACKGROUND)\x1b[22;0m")
    color_range(0, 255, BACKGROUND)
    print("\n")

if __name__ == '__main__':
    main()
