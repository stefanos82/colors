FOREGROUND = 38
BACKGROUND = 48
INITIAL = 0
FINAL = 255

def color_range(start, end, anyground):
    resetdefault = "\x1b[0m"
    resetwithspace = "\x1b[0m "

    resetoutput = resetwithspace
    for color in range(start, end+1):
        if color % 16 == 0:
            print()

        if color == end:
            resetoutput = resetdefault

        print("\x1b[%d;5;%dm%3d%s" % (anyground, color, color, resetoutput), end='')


def main():
    print(f"\x1b[1;39m{INITIAL} to {FINAL} Colors (FOREGROUND)\x1b[22;0m")
    color_range(INITIAL, FINAL, FOREGROUND)
    print("\n")
    print(f"\x1b[1;39m{INITIAL} to {FINAL} Colors (BACKGROUND)\x1b[22;0m")
    color_range(INITIAL, FINAL, BACKGROUND)
    print("\n")

if __name__ == '__main__':
    main()
