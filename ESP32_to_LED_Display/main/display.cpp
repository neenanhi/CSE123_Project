#include <stdio.h>
#include "DFRobot_LCD.h"

extern "C" void app_main(void)
{
    DFRobot_LCD lcd(16,2); // Assuming this initializes LCD with 16 columns and 2 rows

    lcd.init(); // Initialize the LCD once
    lcd.setRGB(0, 255, 0); // Set backlight color to green

    lcd.printstr("UNLOCKED"); // Print on the first line
    lcd.setCursor(0, 1); // Move cursor to the second line
    //lcd.printstr("Laurente"); // Print on the second line

    //testing
}
