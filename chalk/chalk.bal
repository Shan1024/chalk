import ballerina/io;

public type Chalk object {

    private {
        Color foregroundColor;
        Color backgroundColor;
        boolean italicized;
        boolean underlined;
        boolean isLight;
        boolean isDark;
        boolean isReversed;
    }

    public new(foregroundColor, backgroundColor, boolean italicize = false, boolean underline = false) {
        italicized = italicize;
        underlined = underline;
    }

    public function italicize() returns Chalk {
        italicized = true;
        return self;
    }

    public function underline() returns Chalk {
        underlined = true;
        return self;
    }

    public function dark() returns Chalk {
        isDark = true;
        return self;
    }

    public function light() returns Chalk {
        isLight = true;
        return self;
    }

    public function normal() returns Chalk {
        isLight = false;
        isDark = false;
        italicized = false;
        underlined = false;
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
            italicized = getBoolean(property, value);
        } else if (property == UNDERLINE) {
            underlined = getBoolean(property, value);
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

        string coloredString;
        // First, we append the forground color code. Then we append the background color code.
        coloredString += ESCAPE_PREFIX;
        // Add light property.
        if (isLight){
            coloredString += LIGHT_CODE;
        }
        // Add dark property.
        if (isDark){
            coloredString += DARK_CODE;
        }
        // Add italicized property.
        if (italicized){
            coloredString += ITALIC_CODE;
        }
        // Add underlined property.
        if (underlined){
            coloredString += UNDERLINE_CODE;
        }
        // Add reversed property.
        if (isReversed){
            coloredString += REVERSE_CODE;
        }
        // Append the forground color only if it is not set to default color.
        if (foregroundColorIndex != -1){
            coloredString += FORGROUND_COLOR_CODES[foregroundColorIndex];
        }
        coloredString += ESCAPE_SUFFIX;
        // Append the background color only if it is not set to default color.
        if (backgroundColorIndex != -1){
            // Append the background color.
            coloredString += (ESCAPE_PREFIX + BACKGROUND_COLOR_CODES[backgroundColorIndex] + ESCAPE_SUFFIX);
        }

        // Append the text.
        coloredString += text;
        // Append the reset code.
        coloredString += RESET_ALL_CODE;
        // Return the string.
        return coloredString;
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
