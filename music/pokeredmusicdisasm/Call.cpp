#include <sstream>
#include "Call.h"
using namespace std;

Call::Call()
{
    error = false;
    address = 0;
}

Call::Call(unsigned char* byte)
{
    Parse(byte);
}

Call::Call(unsigned short value, bool)
{
    SetAddress(value);
}

unsigned short Call::GetAddress()
{
    return address;
}

void Call::SetAddress(unsigned short value)
{
    address = value;
}

string Call::GenAsm()
{
    string tmpRet = AbstractData::GenAsm();
    if(tmpRet != "") return tmpRet;

    stringstream tmpAsmOut;
    tmpAsmOut << "mus_call" << " $" << hex << uppercase << address;
    return tmpAsmOut.str();
}

bool Call::IsValid(unsigned char* byte)
{
	if(byte[0] == 0xFD)
	{
		error = false;
		return true;
	}
	else
	{
		error = true;
		return false;
	}
}

bool Call::Parse(unsigned char* byte)
{
    if(!AbstractData::Parse(byte)) return false;

    // Get Address
    address = byte[2];
    address <<= 8;
    address |= byte[1];

    return true;
}

unsigned int Call::Arguments()
{
    // 1 2-byte argument = 2 bytes
	return 2;
}