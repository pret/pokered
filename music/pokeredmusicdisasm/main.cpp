#include "Console.h"
#include "Parser.h"
#include <sstream>
#include <string>

using namespace std;

int main(int argc, char** argv)
{
	const unsigned char parameters = 2;
	const unsigned char self = 1;
	const unsigned char _max_argc = parameters + self;
	const string defFileLoc = "../baserom.gbc";

	string arg1;	// Offset
	string arg2;	// File or "--" (if "--" then the file is assumed)

	string paramStopAddr;

	if(argc >= _max_argc)
	{
		arg1 = argv[1];
		arg2 = argv[2];
	}
	else if(argc == (_max_argc - 1))
	{
		arg1 = argv[1];
		arg2 = defFileLoc;
	}

	// Process any parameters
	if(argc > _max_argc)
	{
		for(int i = _max_argc; i < argc; i++)
		{
			string tmpArgv = argv[i];
			if(tmpArgv.substr(0, 7) == "--stop=") paramStopAddr = tmpArgv.substr(7);
		}
	}

	if(arg1 == "") Console::Ask("What offset in the file in hex (0x----): ", arg1);
	if(arg2 == "") Console::Ask("What file: ", arg2);
	if(arg2 == "--") arg2 = defFileLoc;	// You can also put "--" for the default file location

	// Weird way of converting arg1 to an unsigned integer
	Parser p(arg2);

	stringstream arg1Conv;
	unsigned int arg1ConvNum;
	arg1Conv << arg1;
	arg1Conv << hex;
	arg1Conv >> arg1ConvNum;

	if(paramStopAddr != "")
	{
		stringstream paramStopAddrConv;
		unsigned int paramStopAddrNum = 0;
		paramStopAddrConv.str("");
		paramStopAddrConv << paramStopAddr;
		paramStopAddrConv << hex;
		paramStopAddrConv >> paramStopAddrNum;
		p.SetStopAddress(paramStopAddrNum);
	}

	p.Parse(arg1ConvNum);
	Console::PrintLn(p.GetParsedAsm().c_str());

	return 0;
}