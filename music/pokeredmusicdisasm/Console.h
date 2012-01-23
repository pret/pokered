#ifndef CONSOLE_H
#define CONSOLE_H

#include <iostream>
#include <string>

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
    static void Ask(const char* question, char* answer);
    static void Ask(const char* question, std::string& answer);

    // Better Error Handling
    static int atoi_ex(const char* input, bool supress = false);
};

#endif // CONSOLE_H
