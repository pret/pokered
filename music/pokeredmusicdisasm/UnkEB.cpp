#include <sstream>

#include "Call.h"
#include "Duty.h"
#include "Jump.h"
#include "Modulation.h"
#include "Note.h"
#include "Octave.h"
#include "Stop.h"
#include "Tempo.h"
#include "Velocity.h"
#include "Volume.h"

#include "UnkEB.h"

using namespace std;

UnkEB::UnkEB()
{
	param = 0;
}

UnkEB::UnkEB(unsigned char* byte)
{
	param = 0;
	Parse(byte);
}

UnkEB::UnkEB(unsigned char code, bool)
{
	SetParam(code);
}

// Getters / Setters
unsigned char UnkEB::GetParam()
{
	return param;
}

void UnkEB::SetParam(unsigned char value)
{
	param = value;
}

// Re-implemented
string UnkEB::GenAsm()
{
	stringstream tmpAsmOut;
	tmpAsmOut << hex << "db $" << (short)0xEB << ", $" << (short)param;
	return tmpAsmOut.str();
}

bool UnkEB::Parse(unsigned char* byte)
{
	param = byte[1];
	return true;
}

bool UnkEB::IsValid(unsigned char* byte)
{
	if(byte[0] == 0xEB) return true;
	else return false;
}

unsigned int UnkEB::Arguments()
{
	// 1 1-Byte param
	return 1;
}