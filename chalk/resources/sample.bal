import ballerina/io;

function main(string... args) {
    io:println("\n\n");

    Chalk chalk = new(DEFAULT, DEFAULT);

    io:print("         ");
    io:print(chalk.light().write("light"));
    io:print(" ");
    io:print(chalk.normal().write("normal"));
    io:print(" ");
    io:print(chalk.dark().write("dark"));
    io:print(" ");

    io:println();
    io:print(chalk.normal().italicize().write("italic"));
    io:print("   ");
    io:print(chalk.light().italicize().write("Hello"));
    io:print(" ");
    io:print(chalk.normal().italicize().write("Hello"));
    io:print(" ");
    io:print(chalk.dark().italicize().write("Hello"));
    io:println();

    io:print(chalk.normal().underline().write("undeline"));
    io:print(" ");
    io:print(chalk.light().underline().write("Hello"));
    io:print(" ");
    io:print(chalk.normal().underline().write("Hello"));
    io:print(" ");
    io:print(chalk.dark().underline().write("Hello"));
    io:println();

    io:print("ita/und  ");
    io:print(chalk.light().italicize().underline().write("Hello"));
    io:print(" ");
    io:print(chalk.normal().italicize().underline().write("Hello"));
    io:print(" ");
    io:print(chalk.dark().italicize().underline().write("Hello"));
    io:println();

    chalk = chalk.reverse();

    io:print("Reverse  ");
    io:print(chalk.light().italicize().underline().write("Hello"));
    io:print(" ");
    io:print(chalk.normal().italicize().underline().write("Hello"));
    io:print(" ");
    io:print(chalk.dark().italicize().underline().write("Hello"));
    io:println();

    chalk = new(DEFAULT, DEFAULT);

    io:print(chalk.foreground(BLACK).write("fgBlack"));
    io:print(" ");
    io:print(chalk.foreground(RED).write("fgRed"));
    io:print(" ");
    io:print(chalk.foreground(GREEN).write("fgGreen"));
    io:print(" ");
    io:print(chalk.foreground(YELLOW).write("fgYellow"));
    io:print(" ");
    io:print(chalk.foreground(BLUE).write("fgBlue"));
    io:print(" ");
    io:print(chalk.foreground(PURPLE).write("fgPurple"));
    io:print(" ");
    io:print(chalk.foreground(CYAN).write("fgCyan"));
    io:print(" ");
    io:print(chalk.foreground(WHITE).write("fgWhite"));
    io:println();

    chalk = chalk.foreground(DEFAULT);

    io:print(chalk.background(BLACK).write("bgBlack"));
    io:print(" ");
    io:print(chalk.background(RED).write("bgRed"));
    io:print(" ");
    io:print(chalk.background(GREEN).write("bgGreen"));
    io:print(" ");
    io:print(chalk.background(YELLOW).write("bgYellow"));
    io:print(" ");
    io:print(chalk.background(BLUE).write("bgBlue"));
    io:print(" ");
    io:print(chalk.background(PURPLE).write("bgPurple"));
    io:print(" ");
    io:print(chalk.background(CYAN).write("bgCyan"));
    io:print(" ");
    io:print(chalk.background(WHITE).write("bgWhite"));

    io:println("\n\n");
}
