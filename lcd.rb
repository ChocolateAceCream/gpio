require 'charlcd'
char_lcd = CharLcd.new(37,35,[33, 31, 29, 23])
char_lcd.begin(16,2)
char_lcd.message("First Line\nSecond Line")
char_lcd.clean_pins()
