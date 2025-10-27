const FOREGROUND = 38;
const BACKGROUND = 48;
const INITIAL = 0;
const FINAL = 255;

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

process.stdout.write(`\x1b[1;39m${INITIAL} to ${FINAL} Colors (FOREGROUND)\x1b[22;0m\n`);
color_range(INITIAL, FINAL, FOREGROUND);
console.log("\n");

process.stdout.write(`\x1b[1;39m${INITIAL} to ${FINAL} Colors (BACKGROUND)\x1b[22;0m\n`);
color_range(INITIAL, FINAL, BACKGROUND);
console.log("\n");
