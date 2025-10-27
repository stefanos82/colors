public class Main {
    final static int FOREGROUND = 38;
    final static int BACKGROUND = 48;
    final static int INITIAL = 0;
    final static int FINAL = 255;

    static void color_range(int start, int end, int anyground) {
        String resetdefault = "\u001b[0m";
        String resetwithspace = resetdefault.concat(" ");
        String resetoutput = resetwithspace;

        for (int color = start; color <= end; color++) {
            if (color % 16 == 0) {
                System.out.println();
            }

            if (color == end) {
                resetoutput = resetdefault;
            }

            System.out.printf("\u001b[%d;5;%dm%3d%s", anyground, color, color, resetoutput);
        }
    }

    public static void main(String[] args) {
        System.out.printf("\u001b[1;39m%d to %d Colors (FOREGROUND)\u001b[22;0m\n", INITIAL, FINAL);
        color_range(INITIAL, FINAL, FOREGROUND);
        System.out.println("\n");

        System.out.printf("\u001b[1;39m0 to 255 Colors (BACKGROUND)\u001b[22;0m\n", INITIAL, FINAL);
        color_range(INITIAL, FINAL, BACKGROUND);
        System.out.println("\n");
    }
}
