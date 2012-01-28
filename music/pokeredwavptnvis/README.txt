to compile you must have g++ installed
type: make
and it will install to the extras folder

if you want to unmake
type: make clean
and it will remove make objects and the executable

the program usage is: pokeredwavptnvis [<offset> [<file> | --]
offset is the rom offset in hexidecimal (FFFF or 0xFFFF)
file is the rom file, you can use -- for "../baserom.gbc"

to make things quick and easy you can just enter the hexidecimal offset
pokeredwavptnvis <offset>

you may enter limited interactive mode by not supplying any arguments
pokeredwavptnvis