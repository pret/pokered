#ifndef MODULATION_H
#define MODULATION_H

#include "AbstractData.h"

//Represents 1 modulation value
class Modulation : public AbstractData
{
public:
	// Constructors
	Modulation();
	Modulation(unsigned char* byte); // Parse Immidiately
    Modulation(unsigned char delay, unsigned char depth, unsigned char rate, bool); // Set value

	// Direct Getter/Setter Functions
    unsigned char GetDelay();
    void SetDelay(unsigned char value);

	unsigned char GetDepth();
    void SetDepth(unsigned char value);

	unsigned char GetRate();
    void SetRate(unsigned char value);

	// Re-implemented
	virtual std::string GenAsm();
	virtual bool IsValid(unsigned char* byte);
	virtual bool Parse(unsigned char* byte);
	virtual unsigned int Arguments();

private:
	unsigned char delay;
	unsigned char depth;
	unsigned char rate;
};

#endif