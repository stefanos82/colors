const FOREGROUND: u64 = 38;
const BACKGROUND: u64 = 48;

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
    println!("\x1b[1;39m0 to 255 Colors (FOREGROUND)\x1b[22;0m");
    color_range(0, 255, FOREGROUND);
    println!("\n");

    println!("\x1b[1;39m0 to 255 Colors (BACKGROUND)\x1b[22;0m");
    color_range(0, 255, BACKGROUND);
    println!("\n");
}
