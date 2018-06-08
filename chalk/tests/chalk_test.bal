import ballerina/io;
import ballerina/test;

@test:Config
function testLightBackgroundColors() {

    Color[] colors = [BLACK, RED, GREEN, YELLOW, BLUE, PURPLE, CYAN, WHITE];
    int[] codes = [40, 41, 42, 43, 44, 45, 46, 47];

    string text = "Hello world !!!";
    foreach i in [0..lengthof colors) {
        Chalk chalk = new(DEFAULT, colors[i]);
        string foreground = ESCAPE_PREFIX + LIGHT_CODE + RESET_CODE + ESCAPE_SUFFIX;
        string background = ESCAPE_PREFIX + LIGHT_CODE + codes[i] + ESCAPE_SUFFIX;
        string expected = foreground + background + text + RESET_ALL_CODE;
        string actual = chalk.light().write(text);
        io:println(actual);
        test:assertEquals(actual, expected, msg = io:sprintf("Failed for color %r", colors[i]));
    }
}

@test:Config
function testBackgroundColors() {

    Color[] colors = [BLACK, RED, GREEN, YELLOW, BLUE, PURPLE, CYAN, WHITE];
    int[] codes = [40, 41, 42, 43, 44, 45, 46, 47];

    string text = "Hello world !!!";
    foreach i in [0..lengthof colors) {
        Chalk chalk = new(DEFAULT, colors[i]);
        string foreground = RESET_ALL_CODE;
        string background = ESCAPE_PREFIX + codes[i] + ESCAPE_SUFFIX;
        string expected = foreground + background + text + RESET_ALL_CODE;
        string actual = chalk.write(text);
        io:println(actual);
        test:assertEquals(actual, expected, msg = io:sprintf("Failed for color %r", colors[i]));
    }
}

@test:Config
function testDarkBackgroundColors() {

    Color[] colors = [BLACK, RED, GREEN, YELLOW, BLUE, PURPLE, CYAN, WHITE];
    int[] codes = [40, 41, 42, 43, 44, 45, 46, 47];

    string text = "Hello world !!!";
    foreach i in [0..lengthof colors) {
        Chalk chalk = new(DEFAULT, colors[i]);
        string foreground = ESCAPE_PREFIX + DARK_CODE + RESET_CODE + ESCAPE_SUFFIX;
        string background = ESCAPE_PREFIX + DARK_CODE + codes[i] + ESCAPE_SUFFIX;
        string expected = foreground + background + text + RESET_ALL_CODE;
        string actual = chalk.dark().write(text);
        io:println(actual);
        test:assertEquals(actual, expected, msg = io:sprintf("Failed for color %r", colors[i]));
    }
}

@test:Config
function testLightForgroundColors() {

    Color[] colors = [BLACK, RED, GREEN, YELLOW, BLUE, PURPLE, CYAN, WHITE];
    int[] codes = [30, 31, 32, 33, 34, 35, 36, 37];

    string text = "Hello world !!!";
    foreach i in [0..lengthof colors) {
        Chalk chalk = new(colors[i], DEFAULT);
        string expected = ESCAPE_PREFIX + LIGHT_CODE + codes[i] + ESCAPE_SUFFIX + text + RESET_ALL_CODE;
        string actual = chalk.light().write(text);
        io:println(actual);
        test:assertEquals(actual, expected, msg = io:sprintf("Failed for color %r", colors[i]));
    }
}

@test:Config
function testForgroundColors() {

    Color[] colors = [BLACK, RED, GREEN, YELLOW, BLUE, PURPLE, CYAN, WHITE];
    int[] codes = [30, 31, 32, 33, 34, 35, 36, 37];

    string text = "Hello world !!!";
    foreach i in [0..lengthof colors) {
        Chalk chalk = new(colors[i], DEFAULT);
        string expected = ESCAPE_PREFIX + codes[i] + ESCAPE_SUFFIX + text + RESET_ALL_CODE;
        string actual = chalk.write(text);
        io:println(actual);
        test:assertEquals(actual, expected, msg = io:sprintf("Failed for color %r", colors[i]));
    }
}

@test:Config
function testDarkForgroundColors() {

    Color[] colors = [BLACK, RED, GREEN, YELLOW, BLUE, PURPLE, CYAN, WHITE];
    int[] codes = [30, 31, 32, 33, 34, 35, 36, 37];

    string text = "Hello world !!!";
    foreach i in [0..lengthof colors) {
        Chalk chalk = new(colors[i], DEFAULT);
        string expected = ESCAPE_PREFIX + DARK_CODE + codes[i] + ESCAPE_SUFFIX + text + RESET_ALL_CODE;
        string actual = chalk.dark().write(text);
        io:println(actual);
        test:assertEquals(actual, expected, msg = io:sprintf("Failed for color %r", colors[i]));
    }
}
