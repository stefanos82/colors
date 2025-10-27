const FOREGROUND: u64 = 38;
const BACKGROUND: u64 = 48;
const INITIAL: u64 = 0;
const FINAL: u64 = 255;

fn color_range(start: u64, end: u64, anyground: u64) {
    let resetdefault = "\x1b[0m";
    let resetwithspace = format!("{}{}", resetdefault, " ");

    let mut resetoutput = resetwithspace;

    for color in start..=end {
        if color % 16 == 0 {
            println!();
        }

        if color == end {
            resetoutput = resetdefault.to_string();
        }

        print!("\x1b[{};5;{}m{:>3}{}", anyground, color, color, resetoutput);
    }
}

fn main() {
    println!("\x1b[1;39m{INITIAL} to {FINAL} Colors (FOREGROUND)\x1b[22;0m");
    color_range(INITIAL, FINAL, FOREGROUND);
    println!("\n");

    println!("\x1b[1;39m{INITIAL} to {FINAL} Colors (BACKGROUND)\x1b[22;0m");
    color_range(INITIAL, FINAL, BACKGROUND);
    println!("\n");
}
