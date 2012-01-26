#ifndef UNKCODE_H
#define UNKCODE_H

#include "AbstractData.h"

// Represents an unknown opcode
class UnkCode : public AbstractData
{
public:
	// Constructors
	UnkCode();
	UnkCode(unsigned char* byte); // Parse Immidiately
	UnkCode(unsigned char code, bool); // Set Value

	// Getters / Setters
	unsigned char GetCode();
	void SetCode(unsigned char value);

	// Re-implemented
	virtual std::string GenAsm();
	virtual bool Parse(unsigned char* byte);
	virtual bool IsValid(unsigned char* byte);
	virtual unsigned int Arguments();

private:
	unsigned char code;
};

#endif