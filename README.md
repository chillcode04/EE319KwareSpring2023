# Lab 1. Digital Logic on the TM4C123 
## Port E: Key2, Key1, Key0 input switches on PE2,PE1,PE0 	output LED on PE4
### System Requirements
- The objective of this system is to implement a parity system. There are three bits of inputs (Key0, Key1, Key2)  and one bit of output (LED).  Inputs are positive logic: meaning if the switch is not pressed the input is 0, if the switch is pressed the input is 1. The output is in positive logic: outputting a 1 will turn on the LED, outputting a 0 will turn off the LED. 

## Odd parity
- Is an algorithm used in communication systems to detect errors during transmission. Consider the three inputs as a 3-bit data value, such that if the input switch is pressed, that data bit is 1. Your system will have one output bit, creating a 4-bit value, such that the number of ones, considered as one 4-bit value will always be odd. The communication system (if there were one) sends the 4-bit value as a message (containing the 3-bit data plus parity), and the receiver could detect if one of the bits were to be flipped during transmission. The following table illustrates the expected behavior for odd parity
# Example
![](images_dir/image_path.jpg)
