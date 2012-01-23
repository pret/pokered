#include "AbstractData.h"
using namespace std;

AbstractData::AbstractData()
{
    error = false;
}

// This method must always return "" if true but can return
// any other value for false
string AbstractData::GenAsm()
{
    if(error) return ";#Error";
    else return "";
}

bool AbstractData::IsValid(unsigned char* byte)
{
	return true;
}

bool AbstractData::Parse(unsigned char* byte)
{
    // If it's not valid, don't even bother parsing
    if(!IsValid(byte)) return false;
    return true;
}

unsigned int AbstractData::Arguments()
{
	return 0;
}

bool AbstractData::GetError()
{
    return error;
}