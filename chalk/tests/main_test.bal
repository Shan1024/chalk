import ballerina/test;
import ballerina/io;

@test:Config
function testForgroundColors() {

    Color[] colors = [BLACK, RED, GREEN, YELLOW, BLUE, PURPLE, CYAN, WHITE];
    int[] codes = [30, 31, 32, 33, 34, 35, 36, 37];

    string text = "Hello world !!!";
    foreach i in [0..lengthof colors) {
        Chalk chalk = new(colors[i], DEFAULT);
        string expected = ESCAPE_PREFIX + codes[i] + ESCAPE_SUFFIX + text + RESET_ALL_CODE;
        string actual = chalk.write(text);
        test:assertEquals(expected, actual, msg = io:sprintf("Failed for color %r", colors[i]));
    }
}
