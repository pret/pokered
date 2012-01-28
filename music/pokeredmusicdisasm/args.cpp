#include <sstream>
#include "args.h"
using namespace std;

Args::Args(int _argc, char**& _argv)
{
	argc = _argc;
	for(int i = 0; i < _argc; i++)
	{
		argv.push_back(string(_argv[i]));
	}
}

//template<class T>
/*export void Args::GetArg(unsigned int ind, T& var, ios_base::fmtflags flags)
{
	string stream _tmpstr;

	_tmpstr << flags;
	_tmpstr << GetArgv(ind);
	_tmpstr >> var;
}*/

int Args::GetArgs()
{
	return argv.size();
}

string Args::GetArgv(int ind)
{
	return argv[ind];
}

bool Args::IsLongOption(int ind) // Is that argument a --long-key=value
{
	if(GetArgv(ind).substr(0, 2) == "--") return true;
	else return false;
}

bool Args::IsShortOption(int ind, bool param2) // Is that argument a --long-key=value
{
	if(param2)
	{
		if(GetArgv(ind).substr(0, 1) == "-" &&		// The argument must start with -
			GetArgv(ind).substr(0, 2) != "--" &&	// The argument can't start with "--"
			ind + 1 < GetArgs()) return true;		// The second argument must exist
	}
	else
	{
		if(GetArgv(ind).substr(0, 1) == "-" &&				// The argument must start with -
			GetArgv(ind).substr(0, 2) != "--") return true;	// The argument can't start with "--"
	}

	return false;
}

string Args::GetKey(int ind) // Get the key, if not a key/value then returns the arg
{
	if(IsLongOption(ind) && GetArgv(ind).find("=") != string::npos) return GetArgv(ind).substr(2, GetArgv(ind).find("=") - 2);
	else if(IsShortOption(ind)) return GetArgv(ind).substr(1);
	else return GetArgv(ind);
}

string Args::GetValue(int ind, bool param2) // Get the value , if not a key/value then returns the arg
{
	if(IsLongOption(ind) && GetArgv(ind).find("=") != string::npos) return GetArgv(ind).substr(GetArgv(ind).find("=") + 1);
	else if(IsShortOption(ind, param2))
	{
		if(param2) return GetArgv(ind + 1);
		else return GetArgv(ind);
	}
	
	return GetArgv(ind);
}

int Args::SearchKeys(const char* str)
{
	string needle = str;
	string scr = "";
	unsigned int pos = -1;

	for(int i = 0; i < GetArgs(); i++)
	{
		scr = GetKey(i);
		if(scr == needle)
		{
			pos = i;
			break;
		}
	}

	return pos;
}