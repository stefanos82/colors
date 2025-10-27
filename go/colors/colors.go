package main

import "fmt"

const (
	FOREGROUND = 38
	BACKGROUND = 48
	INITIAL    = 0
	FINAL      = 255
)

func ColorRange(start int, end int, anyground int) {
	const (
		resetdefault   = "\x1b[0m"
		resetwithspace = "\x1b[0m "
	)
	resetoutput := resetwithspace
	for color := start; color <= end; color++ {
		if color%16 == 0 {
			fmt.Println()
		}

		if color == end {
			resetoutput = resetdefault
		}
		fmt.Printf("\x1b[%d;5;%dm%3d%s", anyground, color, color, resetoutput)
	}
}

func main() {
	fmt.Printf("\x1b[1;39m%d to %d Colors (FOREGROUND)\x1b[22;0m\n", INITIAL, FINAL)
	ColorRange(INITIAL, FINAL, FOREGROUND)
	fmt.Println("\n")

	fmt.Printf("\x1b[1;39m%d to %d Colors (BACKGROUND)\x1b[22;0m\n", INITIAL, FINAL)
	ColorRange(INITIAL, FINAL, BACKGROUND)
	fmt.Println("\n")
}
