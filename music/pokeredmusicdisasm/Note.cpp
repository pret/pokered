#include <sstream>
#include "Note.h"

using namespace std;

Note::Note()
{
	pitch = 0x0;
	delay = 0x0;
}

Note::Note(unsigned char* byte) // Parse Immidiately
{
	Parse(byte);
}

Note::Note(unsigned char pitch, unsigned char delay,bool) // Set value
{
	SetPitch(pitch);
	SetDelay(delay);
}

unsigned char Note::GetPitch()
{
	return pitch;
}

void Note::SetPitch(unsigned char value)
{
	pitch = value;
}

unsigned char Note::GetDelay()
{
	return delay;
}

void Note::SetDelay(unsigned char value)
{
	delay = value;
}

bool Note::IsValid(unsigned char* byte)
{
	// A Note is a byte that is between 0x00 and 0xCF
	if((byte[0] >= 0x00) &&
		(byte[0] <= 0xCF))
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

// Generates the assembly for this note
string Note::GenAsm()
{
	string tmpRet = AbstractData::GenAsm();
	if(tmpRet != "") return tmpRet;

	stringstream tmpAsmOut;
	tmpAsmOut << "mus_note" << " " << LookupPitchStr() << ", " << LookupDelayStr();
	return tmpAsmOut.str();
}

// Takes the raw byte and parses it's data, storing it
bool Note::Parse(unsigned char* byte)
{
	if(!AbstractData::Parse(byte)) return false;

	pitch = byte[0] & 0xF0;
	pitch >>= 4;

	delay = byte[0] & 0x0F;
	return true;
}

// Fetches the asm string name for the pitch
string Note::LookupPitchStr()
{
	// In case some error happens and the values doesn't match the list below
	stringstream defTmp;

	switch(pitch)
	{
	case noteC:
		return "noteC";
	case noteCS:
		return "noteC#";
	case noteD:
		return "noteD";
	case noteDS:
		return "noteD#";
	case noteE:
		return "noteE";
	case noteF:
		return "noteF";
	case noteFS:
		return "noteF#";
	case noteG:
		return "noteG";
	case noteGS:
		return "noteG#";
	case noteA:
		return "noteA";
	case noteAS:
		return "noteA#";
	case noteB:
		return "noteB";
	case noteRst:
		return "noteRst";
	default:
		defTmp.setf(ios_base::uppercase | ios_base::hex);
		defTmp << "$" << pitch;
		return defTmp.str();
	}
}

// Fetches the asm string name for the delay
string Note::LookupDelayStr()
{
	// In case some error happens and the values doesn't match the list below
	stringstream defTmp;

	switch(delay)
	{
	case note16:
		return "note16";
	case note8:
		return "note8";
	case note8_16:
		return "note8_16";
	case note4:
		return "note4";
	case note4_16:
		return "note4_16";
	case note4_8:
		return "note4_8";
	case note4_8_16:
		return "note4_8_16";
	case note2:
		return "note2";
	case note2_16:
		return "note2_16";
	case note2_8:
		return "note2_8";
	case note2_8_16:
		return "note2_8_16";
	case note2_4:
		return "note2_4";
	case note2_4_16:
		return "note2_4_16";
	case note2_4_8:
		return "note2_4_8";
	case note2_4_8_16:
		return "note2_4_8_16";
	case note1:
		return "note1";
	default:
		defTmp.setf(ios_base::uppercase | ios_base::hex);
		defTmp << "$" << (short)pitch;
		return defTmp.str();
	}
}

unsigned int Note::Arguments()
{
	// No Arguments
	return 0;
}