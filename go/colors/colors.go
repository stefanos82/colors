package main

import "fmt"

const (
	FOREGROUND = 38
	BACKGROUND = 48
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
	fmt.Println("\x1b[1;39m0 to 255 Colors (FOREGROUND)\x1b[22;0m")
	ColorRange(0, 255, FOREGROUND)
	fmt.Println("\n")

	fmt.Println("\x1b[1;39m0 to 255 Colors (BACKGROUND)\x1b[22;0m")
	ColorRange(0, 255, BACKGROUND)
	fmt.Println("\n")
}
