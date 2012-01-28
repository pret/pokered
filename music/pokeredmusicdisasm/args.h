#ifndef ARGS_H
#define ARGS_H

#include <string>
#include <vector>
#include <sstream>

class Args
{
public:
	Args(int _argc, char**& _argv);

	template<class T> // Get the argument automatically in any format that stringstream can output to
	void GetValueC(int ind, T& var, std::ios_base::fmtflags flags = std::ios_base::dec, bool param2 = false)
	{
		std::stringstream _tmpstr;

		_tmpstr << GetValue(ind, param2);
		_tmpstr.flags(flags);
		_tmpstr >> var;
	}

	int GetArgs(); // Get number of args
	std::string GetArgv(int ind); // Get the arg based on true index
	bool IsLongOption(int ind); // Is that argument a --long-key=value
	bool IsShortOption(int ind, bool param2 = false); // Is that argument a --long-key=value

	std::string GetKey(int ind); // Get the key, if not a key/value then returns the arg
	std::string GetValue(int ind, bool param2 = false); // Get the value, if not a key/value then returns the arg

	int SearchKeys(const char* str); // Return the index number of found key or -1 if not found

private:
	int argc;
	std::vector<std::string> argv;
};

#endif