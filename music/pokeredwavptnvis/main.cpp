#include <sstream>
#include <string>
#include <fstream>
#include <vector>

#include "Console.h"

using namespace std;

char* rawBytes = 0;
unsigned int fileLength = 0;

void Read(const char* filename)
{
	// open File
	fstream tmpFile(filename, ios_base::in | ios_base::binary);

	// Get Length
	tmpFile.seekg(0, ios::end);
	fileLength = tmpFile.tellg();
	tmpFile.seekg(0, ios::beg);

	// Allocate proper memory
	rawBytes = new char[fileLength];

	// Read filedata
	tmpFile.read(rawBytes, fileLength);
	tmpFile.close();
}

unsigned char GetNibble(unsigned char byte, bool high)
{
	if(high)
	{
		unsigned char tmp = byte & 0xF0;
		tmp >>= 4;
		return tmp;
	}
	else
	{
		unsigned char tmp = byte & 0x0F;
		return tmp;
	}
}

// Usage: pokeredwavptnvis [<offset> [<file> | --]]
// If no parameters or a parameter is missing the program enters limited interactive mode
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

	if(arg1 == "") Console::Ask("What offset in the file in hex: ", arg1);
	if(arg2 == "") Console::Ask("What file: ", arg2);
	if(arg2 == "--") arg2 = defFileLoc;	// You can also put "--" for the default file location

	stringstream arg1Conv;
	unsigned int arg1ConvNum;
	arg1Conv << arg1;
	arg1Conv << hex;
	arg1Conv >> arg1ConvNum;

	Read(arg2.c_str());
	unsigned char* rawBytesFixed = (unsigned char*)rawBytes;

	// All the loading is done, create a 32x16 vector
	vector<vector<bool>> image;
	vector<string> lines;	// This is the array of output lines

	// Initialize the vector image[x][y] and lines
	for(unsigned char i = 0; i < 32; i++)
	{
		image.push_back(vector<bool>());

		for(unsigned char j = 0; j < 16; j++)
		{
			image[i].push_back(false);
			lines.push_back("");
		}
	}

	unsigned char n1 = 0;
	unsigned char n2 = 0;

	vector<unsigned char> expBytes;
	for(unsigned char i = 0; i < 16; i++)
	{
		n1 = GetNibble(rawBytesFixed[arg1ConvNum + i], true);
		n2 = GetNibble(rawBytesFixed[arg1ConvNum + i], false);

		expBytes.push_back(n1);
		expBytes.push_back(n2);
	}

	// Go through each column in the vector and add a 1 on the appropiate line
	for(unsigned char i = 0; i < 32; i++)
	{
		unsigned char _tmpVal = expBytes[i];	// Here for debugging reasons
		image[i][_tmpVal] = true;
	}

	// Now draw the image
	for(unsigned char i = 0; i < 32; i++)
	{
		for(unsigned char j = 0; j < 16; j++)
		{
			if(i == 0)
			{
				if(image[i][j]) lines[j].append("|*");
				else lines[j].append("| ");
			}
			else if((i > 0) && (i < 31))
			{
				if(image[i][j]) lines[j].append(".*");
				else lines[j].append(". ");
			}
			else
			{
				if(image[i][j]) lines[j].append(".*|");
				else lines[j].append(". |");
			}
		}
	}

	// Now output the drawn lines (mirrored)
	stringstream tmpCtr;
	Console::PrintLn("  0 1 2 3 4 5 6 7 8 9 A B C D E F 0 1 2 3 4 5 6 7 8 9 A B C D E F");
	Console::PrintLn("  ---------------------------------------------------------------");
	for(unsigned char i = 0xF; (i >= 0x0) && (i < 0x10); i--)
	{
		tmpCtr << hex << uppercase << (short)i;
		Console::Print(tmpCtr.str().c_str());
		Console::PrintLn(lines[i].c_str());
		tmpCtr.str("");
	}

	return 0;
}