#ifndef JUMP_H
#define JUMP_H

#include "AbstractData.h"

// Represents 1 Jump Class
class Jump : public AbstractData
{
public:
    // Constructors
    Jump(); // Default
    Jump(unsigned char* byte); // Parse Immidiately
    Jump(unsigned short value, unsigned char loop, bool); // Set value

    // Direct Getter/Setter Functions
    unsigned short GetAddress();
    void SetAddress(unsigned short value);

	unsigned char GetLoop();
    void SetLoop(unsigned char value);

    // The standard re-implementations from AbstractData
    virtual std::string GenAsm();
    virtual bool IsValid(unsigned char* byte);
    virtual bool Parse(unsigned char* byte);
    virtual unsigned int Arguments();

private:
    unsigned short address;
	unsigned char loop;
};

#endif