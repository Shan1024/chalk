@final int[] FORGROUND_COLOR_CODES = [30, 31, 32, 33, 34, 35, 36, 37];
@final int[] BACKGROUND_COLOR_CODES = [40, 41, 42, 43, 44, 45, 46, 47];

@final string RESET_CODE = "0";
@final string LIGHT_CODE = "1;";
@final string DARK_CODE = "2;";

@final string ITALIC_CODE = "3;";
@final string UNDERLINE_CODE = "4;";

@final string REVERSE_CODE = "7;";

@final string ESCAPE_PREFIX = "\u001B[";
@final string ESCAPE_SUFFIX = "m";

@final string RESET_ALL_CODE = ESCAPE_PREFIX + RESET_CODE + ESCAPE_SUFFIX;
