#include "Console.h"
#include "Parser.h"
#include "args.h"
#include <sstream>
#include <string>

using namespace std;

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

	// Get the file path, this can be set with -f filename, --file=filename, arg #2, or missing (missing means default)
	// the filepath can contain the actual filename or -- to use the built-in path, if the path is not missing then it must be set (can't be blank)
	
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
	if(a.SearchKeys("s") != -1) a.GetValueC<unsigned int>(a.SearchKeys("s"), offset, ios_base::hex | ios_base::uppercase, true);
	else if(a.SearchKeys("stop") != -1) filePath = a.GetValue(a.SearchKeys("stop"));

	Parser p(filePath);
	if(stop != 0) p.SetStopAddress(stop);
	p.Parse(offset);

	Console::PrintLn(p.GetParsedAsm().c_str());

	return 0; 
}