#ifndef CONSOLE_H
#define CONSOLE_H

#include <iostream>
#include <string>
#include <sstream>

// Just a Console Utility Library
class Console
{
public:
    // Basic
    static void Get(char* value);
    static void Get(std::string& value);
    static void Print(const char* value);
    static void Error(const char* value);

    // Upper-Basic
    static void PrintLn(const char* value);
    static void ErrorLn(const char* value);

    // Higher
    //static void Ask(const char* question, char* answer);
    //static void Ask(const char* question, std::string& answer);

	template<class T>
	static void Ask(const char* question, T& answer, std::ios_base::fmtflags flags = std::ios_base::dec)
	{
		std::stringstream _tmpstr;
		std::string _tmp;

		Print(question);
		Get(_tmp);

		_tmpstr << _tmp;
		_tmpstr.flags(flags);
		_tmpstr >> answer;
	}
};

#endif // CONSOLE_H
