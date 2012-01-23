#include <sstream>
#include "Octave.h"
using namespace std;

Octave::Octave()
{
	octave = 0;
}

Octave::Octave(unsigned char* byte) // Parse Immidiately
{
	Parse(byte);
}

Octave::Octave(unsigned char octave, bool) // Set value
{
	SetOctave(octave);
}

unsigned char Octave::GetOctave()
{
	return octave;
}

void Octave::SetOctave(unsigned char value)
{
	octave = value;
}

bool Octave::IsValid(unsigned char* byte)
{
	if((byte[0] >= 0xE0) &&
		(byte[0] <= 0xE7))
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

string Octave::GenAsm()
{
	string tmpRet = AbstractData::GenAsm();
	if(tmpRet != "") return tmpRet;

	stringstream tmpAsmOut;
	tmpAsmOut << "mus_octave" << " " << LookupOctString();
	return tmpAsmOut.str();
}

bool Octave::Parse(unsigned char* byte)
{
	if(!AbstractData::Parse(byte)) return false;

	octave = byte[0];
	return true;
}

string Octave::LookupOctString()
{
	// In case some error happens and the values doesn't match the list below
	stringstream defTmp;

	switch(octave)
	{
	case oct0:
		return "oct0";
	case oct1:
		return "oct1";
	case oct2:
		return "oct2";
	case oct3:
		return "oct3";
	case oct4:
		return "oct4";
	case oct5:
		return "oct5";
	case oct6:
		return "oct6";
	case oct7:
		return "oct7";
	default:
		defTmp.setf(ios_base::uppercase | ios_base::hex);
		defTmp << "$" << (short)octave;
		return defTmp.str();
	}
}

unsigned int Octave::Arguments()
{
	// No Arguments
	return 0;
}