const FOREGROUND = 38;
const BACKGROUND = 48;


function color_range(start, end, anyground) {

    const resetdefault = "\x1b[0m";
    const resetwithspace = "\x1b[0m ";

    let resetoutput = resetwithspace;

    for (let color = start; color <= end; color++) {
        if ((color % 16) === 0) {
            console.log();
        }

        if (color == end) {
            resetoutput = resetdefault;
        }

        process.stdout.write(`\x1b[${anyground};5;${color}m${color.toString().padStart(3)}${resetoutput}`);
    }
}

console.log("\x1b[1;39m0 to 255 Colors (FOREGROUND)\x1b[22;0m");
color_range(0, 255, FOREGROUND);
console.log("\n");

console.log("\x1b[1;39m0 to 255 Colors (BACKGROUND)\x1b[22;0m");
color_range(0, 255, BACKGROUND);
console.log("\n");
