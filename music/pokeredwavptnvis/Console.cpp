#include "Console.h"

using namespace std;

// Basic
void Console::Get(char* value)
{
    cin >> value;
}
void Console::Get(string& value)
{
    cin >> value;
}
void Console::Print(const char* value)
{
    cout << value;
}
void Console::Error(const char* value)
{
    cerr << value;
}

// Upper-Basic
void Console::PrintLn(const char* value)
{
    Print(value);
    cout << endl;
}
void Console::ErrorLn(const char* value)
{
    Error(value);
    cerr << endl;
}

// Higher
void Console::Ask(const char* question, char* answer)
{
    Print(question);
    Get(answer);
}
void Console::Ask(const char* question, string& answer)
{
    Print(question);
    Get(answer);
}

// Better Error Handling
int Console::atoi_ex(const char* input, bool supress)
{
	int convInp = atoi(input);
	if((supress == false) && (convInp == 0))
			PrintLn("Warning: the converted integer input is 0, this may not be what you intended");
		return convInp;
}
