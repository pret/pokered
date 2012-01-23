#ifndef STOP_H
#define STOP_H

#include "AbstractData.h"

//Represents 1 end music data
class Stop : public AbstractData
{
public:
	// Constructors
	Stop();
	Stop(unsigned char* byte); // Parse Immidiately

	// Re-Implementations
	virtual std::string GenAsm();
	virtual bool IsValid(unsigned char* byte);
	virtual bool Parse(unsigned char* byte);
	virtual unsigned int Arguments();
};

#endif