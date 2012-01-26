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

#include "UnkCode.h"

using namespace std;

UnkCode::UnkCode()
{
	code = 0;
}

UnkCode::UnkCode(unsigned char* byte)
{
	code = 0;
	Parse(byte);
}

UnkCode::UnkCode(unsigned char code, bool)
{
	SetCode(code);
}

// Getters / Setters
unsigned char UnkCode::GetCode()
{
	return code;
}

void UnkCode::SetCode(unsigned char value)
{
	code = value;
}

// Re-implemented
string UnkCode::GenAsm()
{
	stringstream tmpAsmOut;
	tmpAsmOut << "db $" << hex << (short)code;
	return tmpAsmOut.str();
}

bool UnkCode::Parse(unsigned char* byte)
{
	code = byte[0];
	return true;
}

bool UnkCode::IsValid(unsigned char* byte)
{
	return true;
}

unsigned int UnkCode::Arguments()
{
	return 0;
}