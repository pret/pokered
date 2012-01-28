#include <sstream>
#include "Tempo.h"
using namespace std;

Tempo::Tempo()
{
	divider = 0;
	modifier = 0;
}

Tempo::Tempo(unsigned char* byte) // Parse Immidiately
{
	Parse(byte);
}

Tempo::Tempo(unsigned char divider, unsigned char modifier, bool) // Set value
{
	SetDivider(divider);
	SetModifier(modifier);
}

unsigned char Tempo::GetDivider()
{
	return divider;
}

void Tempo::SetDivider(unsigned char value)
{
	divider = value;
}

unsigned char Tempo::Getmodifier()
{
	return modifier;
}

void Tempo::SetModifier(unsigned char value)
{
	modifier = value;
}

bool Tempo::IsValid(unsigned char* byte)
{
	if(byte[0] == 0xED)
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

string Tempo::GenAsm()
{
	string tmpRet = AbstractData::GenAsm();
	if(tmpRet != "") return tmpRet;

	stringstream tmpAsmOut;
	tmpAsmOut << "mus_tempo" << " " << (short)divider << ", " << (short)modifier;
	return tmpAsmOut.str();
}

bool Tempo::Parse(unsigned char* byte)
{
	if(!AbstractData::Parse(byte)) return false;

	divider = byte[1];
	modifier = byte[2];

	return true;
}

unsigned int Tempo::Arguments()
{
	// 2 1-byte arguments = 2
	return 2;
}