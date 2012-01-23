#include <sstream>
#include "Jump.h"
using namespace std;

Jump::Jump()
{
	address = 0x0000;
	loop = 0;
}

Jump::Jump(unsigned char* byte) // Parse Immidiately
{
	Parse(byte);
}

Jump::Jump(unsigned short value, unsigned char loop, bool) // Set value
{
	SetAddress(value);
	SetLoop(loop);
}

unsigned short Jump::GetAddress()
{
	return address;
}

void Jump::SetAddress(unsigned short value)
{
	address = value;
}

unsigned char Jump::GetLoop()
{
	return loop;
}

void Jump::SetLoop(unsigned char value)
{
	loop = value;
}

string Jump::GenAsm()
{
	string tmpRet = AbstractData::GenAsm();
	if(tmpRet != "") return tmpRet;

	stringstream tmpAsmOut;
	tmpAsmOut << "mus_jump" << " " << (short)loop << ", $" << hex << uppercase << address;
	return tmpAsmOut.str();
}

bool Jump::IsValid(unsigned char* byte)
{
	if(byte[0] == 0xFE)
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

bool Jump::Parse(unsigned char* byte)
{
	if(!AbstractData::Parse(byte)) return false;

	loop = byte[1];

    address = byte[3];
    address <<= 8;
    address |= byte[2];

	return true;
}

unsigned int Jump::Arguments()
{
	// 1 1-byte command, 1 1-byte loop, 1 2-byte pointer = 4 bytes
	return 3;
}