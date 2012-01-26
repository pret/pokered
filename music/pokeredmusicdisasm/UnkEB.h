#ifndef UNKEB_H
#define UNKEB_H

#include "AbstractData.h"

// Represents an unknown opcode
class UnkEB : public AbstractData
{
public:
	// Constructors
	UnkEB();
	UnkEB(unsigned char* byte); // Parse Immidiately
	UnkEB(unsigned char code, bool); // Set Value

	// Getters / Setters
	unsigned char GetParam();
	void SetParam(unsigned char value);

	// Re-implemented
	virtual std::string GenAsm();
	virtual bool Parse(unsigned char* byte);
	virtual bool IsValid(unsigned char* byte);
	virtual unsigned int Arguments();

private:
	unsigned char param;
};

#endif