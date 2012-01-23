#include "Console.h"
#include "Parser.h"
#include <sstream>
#include <string>

using namespace std;

int main(int argc, char** argv)
{
	string arg1;	// Offset
	string arg2;	// File

	if(argc >= 3)
	{
		arg1 = argv[1];
		arg2 = argv[2];
	}
	else if(argc == 2)
	{
		arg1 = argv[1];
		arg2 = "../baserom.gbc";
	}

	if(arg1 == "") Console::Ask("What offset in the file in hex (0x----): ", arg1);
	if(arg2 == "") Console::Ask("What file: ", arg2);

	// Weird way of converting arg1 to an unsigned integer
	stringstream arg1Conv;
	unsigned int arg1ConvNum;
	arg1Conv << arg1;
	arg1Conv << hex;
	arg1Conv >> arg1ConvNum;

	Parser p(arg2);
	p.Parse(arg1ConvNum);
	Console::PrintLn(p.GetParsedAsm().c_str());

	return 0;
}