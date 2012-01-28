#include <sstream>
#include "Volume.h"
using namespace std;

Volume::Volume()
{
	volume = 0;
}

Volume::Volume(unsigned char* byte) // Parse Immidiately
{
	Parse(byte);
}

Volume::Volume(unsigned char volume, bool) // Set value
{
	SetVolume(volume);
}

unsigned char Volume::GetVolume()
{
	return volume;
}

void Volume::SetVolume(unsigned char value)
{
	volume = value;
}

bool Volume::IsValid(unsigned char* byte)
{
	if(byte[0] == 0xF0)
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

string Volume::GenAsm()
{
	string tmpRet = AbstractData::GenAsm();
	if(tmpRet != "") return tmpRet;

	stringstream tmpAsmOut;
	tmpAsmOut << "mus_volume" << " " << (short)volume;
	return tmpAsmOut.str();
}

bool Volume::Parse(unsigned char* byte)
{
	// If it's not a Note, don't even bother parsing
	if(!AbstractData::Parse(byte)) return false;

	volume = byte[1];
	return true;
}

unsigned int Volume::Arguments()
{
	// 1 1-byte argument = 1
	return 1;
}