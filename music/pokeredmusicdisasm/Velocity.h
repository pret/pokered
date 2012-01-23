#ifndef VELOCITY_H
#define VELOCITY_H

#include "AbstractData.h"

class Velocity : public AbstractData
{
public:
	// Constructors
	Velocity();
	Velocity(unsigned char* byte); // Parse Immidiately
    Velocity(unsigned char velocity, unsigned char length, bool); // Set value

	// Direct Getters/Setters
	unsigned char GetVelocity();
	void SetVelocity(unsigned char value);

	unsigned char GetLength();
	void SetLength(unsigned char value);

	// Overides
	virtual std::string GenAsm();
	virtual bool IsValid(unsigned char* byte);
	virtual bool Parse(unsigned char* byte);
	virtual unsigned int Arguments();

private:
	unsigned char velocity;
	unsigned char length;
};

#endif