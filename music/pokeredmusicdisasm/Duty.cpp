#include <sstream>
#include "Duty.h"
using namespace std;

Duty::Duty()
{
    duty = 0;
}

Duty::Duty(unsigned char* byte) // Parse Immidiately
{
    Parse(byte);
}

Duty::Duty(unsigned char value, bool) // Set value
{
    SetDuty(value);
}

unsigned char Duty::GetDuty()
{
    return duty;
}

void Duty::SetDuty(unsigned char value)
{
    // Clamp duty to 3 since that's the highest possible
    duty = value;
    if(duty >= 3) duty = 3;
}

// Byte 0 - The Command Code
// Byte 1 - The Value
bool Duty::IsValid(unsigned char* byte)
{
	if((byte[0] == 0xEC) &&
		(byte[1] >= 0x0) &&
		(byte[1] <= 0x3))
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

string Duty::GenAsm()
{
	string ret = AbstractData::GenAsm();
    if(ret != "") return ret;

	stringstream tmpAsmOut;
	tmpAsmOut << "mus_duty " << LookupDutyString();
	return tmpAsmOut.str();
}

bool Duty::Parse(unsigned char* byte)
{
	if(!AbstractData::Parse(byte)) return false;

	duty = byte[1];
        return true;
}

string Duty::LookupDutyString()
{
	// In case some error happens and the values doesn't match the list below
	stringstream defTmp;

	switch(duty)
	{
	case duty12_5:
		return "duty12_5";
	case duty25:
		return "duty25";
	case duty50:
		return "duty50";
	case duty75:
		return "duty75";
	default:
		defTmp << "$" << uppercase << hex << (short)duty;
		return defTmp.str();
	}
}

unsigned int Duty::Arguments()
{
    //1 1-byte argument = 1
    return 1;
}