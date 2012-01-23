#include <sstream>
#include "Velocity.h"
using namespace std;

Velocity::Velocity()
{
	velocity = 0;
	length = 0;
}

Velocity::Velocity(unsigned char* byte) // Parse Immidiately
{
	Parse(byte);
}

Velocity::Velocity(unsigned char velocity, unsigned char length, bool) // Set value
{
	SetVelocity(velocity);
	SetLength(length);
}

// Direct Getters/Setters
unsigned char Velocity::GetVelocity()
{
	return velocity;
}

void Velocity::SetVelocity(unsigned char value)
{
	velocity = value;
}

unsigned char Velocity::GetLength()
{
	return length;
}

void Velocity::SetLength(unsigned char value)
{
	length = value;
}

bool Velocity::IsValid(unsigned char* byte)
{
	if(byte[0] == 0xDC)
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

string Velocity::GenAsm()
{
	string tmpRet = AbstractData::GenAsm();
	if(tmpRet != "") return tmpRet;

	stringstream tmpAsmOut;
	tmpAsmOut << "mus_vel" << " " << (short)velocity << ", " << (short)length;
	return tmpAsmOut.str();
}

bool Velocity::Parse(unsigned char* byte)
{
	if(!AbstractData::Parse(byte)) return false;
	
	velocity = byte[1] & 0xF0;
	velocity >>= 4;

	length = byte[1] & 0x0F;
	return true;
}

unsigned int Velocity::Arguments()
{
	// 1 1-byte argument
	return 1;
}