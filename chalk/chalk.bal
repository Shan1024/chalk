import ballerina/io;

public type Chalk object {

    private {
        Color foregroundColor;
        Color backgroundColor;
        boolean isItalicized;
        boolean isUnderlined;
        boolean isLight;
        boolean isDark;
        boolean isReversed;
    }

    public new(foregroundColor, backgroundColor, boolean italicize = false, boolean underline = false) {
        isItalicized = italicize;
        isUnderlined = underline;
    }

    public function italicize() returns Chalk {
        isItalicized = true;
        return self;
    }

    public function underline() returns Chalk {
        isUnderlined = true;
        return self;
    }

    public function dark() returns Chalk {
        isLight = false;
        isDark = true;
        return self;
    }

    public function light() returns Chalk {
        isLight = true;
        isDark = false;
        return self;
    }

    public function normal() returns Chalk {
        isLight = false;
        isDark = false;
        isItalicized = false;
        isUnderlined = false;
        isReversed = false;
        return self;
    }

    public function reverse() returns Chalk {
        isReversed = true;
        return self;
    }

    public function foreground(Color color) returns Chalk {
        foregroundColor = color;
        return self;
    }

    public function background(Color color) returns Chalk {
        backgroundColor = color;
        return self;
    }

    public function withProperty(Property property, Color|boolean value) returns Chalk {
        if (property == ITALIC) {
            isItalicized = getBoolean(property, value);
        } else if (property == UNDERLINE) {
            isUnderlined = getBoolean(property, value);
        } else if (property == LIGHT) {
            isLight = getBoolean(property, value);
        } else if (property == DARK) {
            isDark = getBoolean(property, value);
        } else if (property == REVERSE) {
            isReversed = getBoolean(property, value);
        } else if (property == FOREGROUND) {
            foregroundColor = getColor(property, value);
        } else if (property == BACKGROUND) {
            backgroundColor = getColor(property, value);
        }
        return self;
    }

    public function write(string text) returns string {
        // Get the forground color index.
        int foregroundColorIndex = getColorIndex(foregroundColor);
        // Get the background color index.
        int backgroundColorIndex = getColorIndex(backgroundColor);

        string colorizedString;
        // First, we append the forground color code. Then we append the background color code.
        colorizedString += ESCAPE_PREFIX;
        // Append light color code.
        if (isLight){
            colorizedString += LIGHT_CODE;
        }
        // Append dark code.
        if (isDark){
            colorizedString += DARK_CODE;
        }
        // Append italic code.
        if (isItalicized){
            colorizedString += ITALIC_CODE;
        }
        // Append underline code.
        if (isUnderlined){
            colorizedString += UNDERLINE_CODE;
        }
        // Append reversed code.
        if (isReversed){
            colorizedString += REVERSE_CODE;
        }
        // Append the forground color only if it is not set to default color.
        if (foregroundColorIndex != -1){
            // Append the foreground color.
            colorizedString += FORGROUND_COLOR_CODES[foregroundColorIndex];
        } else {
            colorizedString += RESET_CODE;
        }
        // Append the escape suffix.
        colorizedString += ESCAPE_SUFFIX;
        // Append the background color only if it is not set to default color.
        if (backgroundColorIndex != -1){
            // Append the background color.
            colorizedString += (ESCAPE_PREFIX + BACKGROUND_COLOR_CODES[backgroundColorIndex] + ESCAPE_SUFFIX);
        }

        // Append the text.
        colorizedString += text;

        // Append the reset code.
        colorizedString += RESET_ALL_CODE;
        // Return the colorized string.
        return colorizedString;
    }

    function getColorIndex(Color color) returns int {
        int code;
        if (color == BLACK) {
            code = 0;
        } else if (color == RED) {
            code = 1;
        } else if (color == GREEN) {
            code = 2;
        } else if (color == YELLOW) {
            code = 3;
        } else if (color == BLUE) {
            code = 4;
        } else if (color == PURPLE) {
            code = 5;
        } else if (color == CYAN) {
            code = 6;
        } else if (color == WHITE) {
            code = 7;
        } else if (color == DEFAULT) {
            code = -1;
        } else {
            string msg = "Unknown color: " + io:sprintf("%r", color);
            error err = { message: msg };
            throw err;
        }
        return code;
    }

    function getBoolean(Property property, Color|boolean value) returns boolean {
        match value {
            Color => {
                error e = { message: "Boolean value expected for the property '" + io:sprintf("%r", property) + "'." };
                throw e;
            }
            boolean b => {
                return b;
            }
        }
    }

    function getColor(Property property, Color|boolean value) returns Color {
        match value {
            Color c => {
                return c;
            }
            boolean => {
                error e = { message: "Color value expected for the property '" + io:sprintf("%r", property) + "'." };
                throw e;
            }
        }
    }
};
