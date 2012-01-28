Usage: [<offset> [<file> | --]]
Usage: [--offset=<offset> | -o <offset>] [--file=[<file> | --] | -f [<file> | --]] [--stop=<offset> | -s <offset>]
Usage: [-h | --help]

Used without parameters will start in limited interactive mode where the program will ask you the file and offset
An offset is a requirement but the file may be blank or explicitly set, whenever the file is set you may use '--' to substitute for the default file '../baserom.gbc'
If parameter options are not used the ordering is important:
There is an intentional glitch in the program, since long paramaters must be specified with --xxx= with or without a value, you may use the short option instead -xxx even though it's suppose to be -xxx=
	* <offset> <file>
If parameter options are used the ordering does not matter, ensure the <offset> parameter option or parameter is present
You may mix and match parameters and parameter options, keep in mind that bare parameters must be in a certain order
If the offset parameter is missing in any way the program will prompt you for it
The program will stop parsing when it encounters mus_end regardlessly
Parameter types
	* <xxx> - Bare parameter, they must be in a certain order
	* -xxx=xxx - Long parameter option, it can be in any order but is case sensitive, can contain no spaces, must contain the equal sign, and is read literally
	* -xxx xxx - Short parameter option, it can be in any order but is case sensitive, must contain 1 space and is read literally
----
Breakdown of parameters:
<offset> - A bare parameter, it must be in hexidecimal eith alone or prefixed with 0x and be the first parameter. It tells the parser where to start parsing
<file> - A bare parameter, it must be the second parameter and tells the parser which rom file to parse
-- - A special file path value meaning use the default file '../baserom.gbc'
--offset, -o - the parameterized offset in hexidecimal, It tells the parser where to start parsing
--file, -f - the parameterized file path, It tells the parser which rom file to parse
--stop, -s - tells the parser to stop at that hexidecimal address or until it reaches mus_end.
help, --help, -h - prints this info and exits, if the bare parameter is used it must be the first parameter
