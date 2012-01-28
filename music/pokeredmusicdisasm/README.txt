to compile you must have g++ installed
type: make
and it will install to the extras folder

if you want to unmake
type: make clean
and it will remove make objects and the executable

the program usage is: pokeredmusicdisasm [<offset> [<file> | --] [--stop]
offset is the rom offset in hexidecimal (FFFF or 0xFFFF)
file is the rom file, you can use -- for "../baserom.gbc"
--stop is the hexidecimal stop number

to make things quick and easy you can just enter the hexidecimal offset
pokeredmusicdisasm <offset>

to use the stop parameter you must use it as the 3rd argument as below
pokeredmusicdisasm <offset> -- --stop=FFFF
pokeredmusicdisasm <offset> <file> --stop=FFFF

you may enter limited interactive mode by not supplying any arguments
pokeredmusicdisasm