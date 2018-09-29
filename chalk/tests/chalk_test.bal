import ballerina/io;
import ballerina/test;

@test:Config
function testDefaultColors() {
    string text = "Hello world !!!";
    Chalk chalk = new(DEFAULT, DEFAULT);
    string escapeCode = ESCAPE_PREFIX + ESCAPE_SUFFIX;
    string expected = escapeCode + text + RESET_ALL_CODE;
    string actual = chalk.write(text);
    io:println(actual);
}

@test:Config
function testLightBackgroundColors() {

    Color[] colors = [BLACK, RED, GREEN, YELLOW, BLUE, PURPLE, CYAN, WHITE];
    int[] codes = [40, 41, 42, 43, 44, 45, 46, 47];

    string text = "Hello world !!!";
    foreach i in 0..<lengthof colors {
        Chalk chalk = new(DEFAULT, colors[i]);
        string escapeCode = ESCAPE_PREFIX + LIGHT_CODE + codes[i] + ";" + ESCAPE_SUFFIX;
        string expected = escapeCode + text + RESET_ALL_CODE;
        string actual = chalk.light().write(text);
        io:println(actual);
        test:assertEquals(actual, expected, msg = io:sprintf("Failed for color %s", colors[i]));
    }
}

@test:Config
function testNormalBackgroundColors() {

    Color[] colors = [BLACK, RED, GREEN, YELLOW, BLUE, PURPLE, CYAN, WHITE];
    int[] codes = [40, 41, 42, 43, 44, 45, 46, 47];

    string text = "Hello world !!!";
    foreach i in 0..<lengthof colors {
        Chalk chalk = new(DEFAULT, colors[i]);
        string escapeCode = ESCAPE_PREFIX + codes[i] + ";" + ESCAPE_SUFFIX;
        string expected = escapeCode + text + RESET_ALL_CODE;
        string actual = chalk.write(text);
        io:println(actual);
        test:assertEquals(actual, expected, msg = io:sprintf("Failed for color %s", colors[i]));
    }
}

@test:Config
function testDarkBackgroundColors() {

    Color[] colors = [BLACK, RED, GREEN, YELLOW, BLUE, PURPLE, CYAN, WHITE];
    int[] codes = [40, 41, 42, 43, 44, 45, 46, 47];

    string text = "Hello world !!!";
    foreach i in 0..<lengthof colors {
        Chalk chalk = new(DEFAULT, colors[i]);
        string escapeCode = ESCAPE_PREFIX + DARK_CODE + codes[i] + ";" + ESCAPE_SUFFIX;
        string expected = escapeCode + text + RESET_ALL_CODE;
        string actual = chalk.dark().write(text);
        io:println(actual);
        test:assertEquals(actual, expected, msg = io:sprintf("Failed for color %s", colors[i]));
    }
}

@test:Config
function testLightForgroundColors() {

    Color[] colors = [BLACK, RED, GREEN, YELLOW, BLUE, PURPLE, CYAN, WHITE];
    int[] codes = [30, 31, 32, 33, 34, 35, 36, 37];

    string text = "Hello world !!!";
    foreach i in 0..<lengthof colors {
        Chalk chalk = new(colors[i], DEFAULT);
        string expected = ESCAPE_PREFIX + LIGHT_CODE + codes[i] + ";" + ESCAPE_SUFFIX + text + RESET_ALL_CODE;
        string actual = chalk.light().write(text);
        io:println(actual);
        test:assertEquals(actual, expected, msg = io:sprintf("Failed for color %s", colors[i]));
    }
}

@test:Config
function testNormalForgroundColors() {

    Color[] colors = [BLACK, RED, GREEN, YELLOW, BLUE, PURPLE, CYAN, WHITE];
    int[] codes = [30, 31, 32, 33, 34, 35, 36, 37];

    string text = "Hello world !!!";
    foreach i in 0..<lengthof colors {
        Chalk chalk = new(colors[i], DEFAULT);
        string expected = ESCAPE_PREFIX + codes[i] + ";" + ESCAPE_SUFFIX + text + RESET_ALL_CODE;
        string actual = chalk.write(text);
        io:println(actual);
        test:assertEquals(actual, expected, msg = io:sprintf("Failed for color %s", colors[i]));
    }
}

@test:Config
function testDarkForgroundColors() {

    Color[] colors = [BLACK, RED, GREEN, YELLOW, BLUE, PURPLE, CYAN, WHITE];
    int[] codes = [30, 31, 32, 33, 34, 35, 36, 37];

    string text = "Hello world !!!";
    foreach i in 0..<lengthof colors {
        Chalk chalk = new(colors[i], DEFAULT);
        string expected = ESCAPE_PREFIX + DARK_CODE + codes[i] + ";" + ESCAPE_SUFFIX + text + RESET_ALL_CODE;
        string actual = chalk.dark().write(text);
        io:println(actual);
        test:assertEquals(actual, expected, msg = io:sprintf("Failed for color %s", colors[i]));
    }
}

@test:Config
function testColors() {

    Color[] foregroundColors = [BLACK, RED, GREEN, YELLOW, BLUE, PURPLE, CYAN, WHITE];
    int[] forgroundColorCodes = [30, 31, 32, 33, 34, 35, 36, 37];

    Color[] backgroundColors = [BLACK, RED, GREEN, YELLOW, BLUE, PURPLE, CYAN, WHITE];
    int[] backgroundColorCodes = [40, 41, 42, 43, 44, 45, 46, 47];

    string text = "Hello world !!!";
    foreach i in 0..<lengthof foregroundColors {
        foreach j in 0..<lengthof backgroundColors {
            Chalk chalk = new(foregroundColors[i], backgroundColors[j]);
            string expected = ESCAPE_PREFIX + forgroundColorCodes[i] + ";" + backgroundColorCodes[j] + ";" +
                ESCAPE_SUFFIX + text + RESET_ALL_CODE;
            string actual = chalk.write(text);
            io:println(actual);
            test:assertEquals(actual, expected, msg = io:sprintf("Failed for color %s", foregroundColors[i]));
        }
    }
}
