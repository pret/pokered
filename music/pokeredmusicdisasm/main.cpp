#include "Console.h"
#include "Parser.h"
#include "args.h"
#include <sstream>
#include <string>

using namespace std;

void PrintUsage()
{
	Console::PrintLn("Usage: [<offset> [<file> | --]]");
	Console::PrintLn("Usage: [--offset=<offset> | -o <offset>] [--file=[<file> | --] | -f [<file> | --]] [--stop=<offset> | -s <offset>]");
	Console::PrintLn("Usage: [-h | --help]");
	Console::PrintLn("");
	Console::PrintLn("Used without parameters will start in limited interactive mode where the program will ask you the file and offset");
	Console::PrintLn("An offset is a requirement but the file may be blank or explicitly set, whenever the file is set you may use '--' to substitute for the default file '../baserom.gbc'");
	Console::PrintLn("If parameter options are not used the ordering is important:");
	Console::PrintLn("There is an intentional glitch in the program, since long paramaters must be specified with --xxx= with or without a value, you may use the short option instead -xxx even though it's suppose to be -xxx=");
		Console::PrintLn("\t* <offset> <file>");
	Console::PrintLn("If parameter options are used the ordering does not matter, ensure the <offset> parameter option or parameter is present");
	Console::PrintLn("You may mix and match parameters and parameter options, keep in mind that bare parameters must be in a certain order");
	Console::PrintLn("If the offset parameter is missing in any way the program will prompt you for it");
	Console::PrintLn("The program will stop parsing when it encounters mus_end regardlessly");
	Console::PrintLn("Parameter types");
		Console::PrintLn("\t* <xxx> - Bare parameter, they must be in a certain order");
		Console::PrintLn("\t* -xxx=xxx - Long parameter option, it can be in any order but is case sensitive, can contain no spaces, must contain the equal sign, and is read literally");
		Console::PrintLn("\t* -xxx xxx - Short parameter option, it can be in any order but is case sensitive, must contain 1 space and is read literally");
	Console::PrintLn("----");
	Console::PrintLn("Breakdown of parameters:");
	Console::PrintLn("<offset> - A bare parameter, it must be in hexidecimal eith alone or prefixed with 0x and be the first parameter. It tells the parser where to start parsing");
	Console::PrintLn("<file> - A bare parameter, it must be the second parameter and tells the parser which rom file to parse");
	Console::PrintLn("-- - A special file path value meaning use the default file '../baserom.gbc'");
	Console::PrintLn("--offset, -o - the parameterized offset in hexidecimal, It tells the parser where to start parsing");
	Console::PrintLn("--file, -f - the parameterized file path, It tells the parser which rom file to parse");
	Console::PrintLn("--stop, -s - tells the parser to stop at that hexidecimal address or until it reaches mus_end.");
	Console::PrintLn("-fo - must be used with --stop, forces the program to proceed on despite discovering any mus_end");
	Console::PrintLn("help, --help, -h - prints this info and exits, if the bare parameter is used it must be the first parameter");
}

/* 
	Usage:
		pokeredmusicdisasm [<offset> [<file> | --]]
		pokeredmusicdisasm [--offset=<offset> | -o <offset>] [--file=[<file> | --] | -f [<file> | --]] [--stop=<offset> | -s <offset>]
*/
int main(int argc, char** argv)
{
	Args a(argc, argv);

	const unsigned char parameters = 2;
	const string defFileLoc = "../baserom.gbc";

	string filePath = "";
	unsigned int offset = 0;
	unsigned int stop = 0;
	bool force = false;

	// Get the file path, this can be set with -f filename, --file=filename, arg #2, or missing (missing means default)
	// the filepath can contain the actual filename or -- to use the built-in path, if the path is not missing then it must be set (can't be blank)
	
	// Is the user asking for help with -h, --help=, or help
	if((a.SearchKeys("h") != -1) || (a.SearchKeys("help") != -1) || (a.GetArgv(1) == "help"))
	{
		PrintUsage();
		return 0;
	}

	// Does a -f or --file key exist
	if(a.SearchKeys("f") != -1) filePath = a.GetValue(a.SearchKeys("f"), true);
	else if(a.SearchKeys("file") != -1) filePath = a.GetValue(a.SearchKeys("file"));

	// BUG FIX: a short parameter can be either 1 or 2 parts so this causes the if statement below to load incorrect info if
	// -f or --file isn't specified and the first argument is a short parameter "-x x"
	else if((a.GetArgs() == (2 + 1)) && (a.IsShortOption(1, true))) filePath = defFileLoc;

	// Does arg #2 exist
	else if(a.GetArgs() >= 2 + 1) a.GetValueC<string>(2, filePath);

	// Is there at least 1 arg (In that case it's missing and the default can be assumed)
	else if(a.GetArgs() >= 1 + 1) filePath = defFileLoc;

	// Ask the user
	else Console::Ask("Filepath: ", filePath);

	if(filePath == "--") filePath = defFileLoc;
	else if(filePath == "")
	{
		Console::PrintLn("Filename can't be blank");
		return 1;
	}

	// Get the offset, this can be set with -o <offset>, --offset=<offset>, or as arg #1
	if(a.SearchKeys("o") != -1) a.GetValueC<unsigned int>(a.SearchKeys("o"), offset, ios_base::hex | ios_base::uppercase, true);
	else if(a.SearchKeys("offset") != -1) a.GetValueC(a.SearchKeys("offset"), offset, ios_base::hex | ios_base::uppercase);

	// Does arg #1 exist
	else if(a.GetArgs() >= 1 + 1) a.GetValueC<unsigned int>(1, offset, ios_base::hex | ios_base::uppercase);

	// Ask the user
	else Console::Ask<unsigned int>("Offset: ", offset, ios_base::hex | ios_base::uppercase);

	// Get the stop parameter, this can be set with -s <offset>, --stop=<offset> (it must be set via args)
	if(a.SearchKeys("s") != -1) a.GetValueC<unsigned int>(a.SearchKeys("s"), stop, ios_base::hex | ios_base::uppercase, true);
	else if(a.SearchKeys("stop") != -1) filePath = a.GetValue(a.SearchKeys("stop"));

	// Get the force parameter, this can be set with -f (it must be set via args)
	if(a.SearchKeys("fo") != -1) force = true;

	if((stop == 0) && (force == true))
	{
		Console::ErrorLn("Error! You set the force command but did not set the stop command, this means it will parse every line until the end of the rom.");
		return 1;
	}

	Parser p(filePath);
	if(stop != 0) p.SetStopAddress(stop);
	if(force) p.SetForce(true);
	p.Parse(offset);

	Console::PrintLn(p.GetParsedAsm().c_str());

	return 0; 
}