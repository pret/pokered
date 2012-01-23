#include <sstream>
#include "Stop.h"
using namespace std;

Stop::Stop()
{}

Stop::Stop(unsigned char* byte)
{
	Parse(byte);
}

bool Stop::IsValid(unsigned char* byte)
{
	if(byte[0] == 0xFF)
	{
		error = false;	// Unblock assembling
		return true;
	}
	else
	{
		error = true;	// Block assembling
		return false;
	}
}

string Stop::GenAsm()
{
	string tmpRet = AbstractData::GenAsm();
	if(tmpRet != "") return false;

	stringstream tmpAsmOut;
	tmpAsmOut << "mus_end";
	return tmpAsmOut.str();
}

bool Stop::Parse(unsigned char* byte)
{
	if(AbstractData::Parse(byte)) return false;
	return true;
}

unsigned int Stop::Arguments()
{
	// No Arguments
	return 0;
}