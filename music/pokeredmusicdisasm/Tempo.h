#ifndef TEMPO_H
#define TEMPO_H

#include "AbstractData.h"

class Tempo : public AbstractData
{
public:
	// Constructors
	Tempo();
	Tempo(unsigned char* byte); // Parse Immidiately
    Tempo(unsigned char divider, unsigned char modifier, bool); // Set value

	// Direct Getters and Setters
	unsigned char GetDivider();
	void SetDivider(unsigned char value);

	unsigned char Getmodifier();
	void SetModifier(unsigned char value);

	// Overides
	virtual std::string GenAsm();
	virtual bool IsValid(unsigned char* byte);
	virtual bool Parse(unsigned char* byte);
	virtual unsigned int Arguments();

private:
	unsigned char divider;
	unsigned char modifier;
};

#endif