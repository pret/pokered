#ifndef CALL_H
#define CALL_H

#include "AbstractData.h"

// Represents 1 call
class Call : public AbstractData
{
public:
    // Constructors
    Call(); // Default
    Call(unsigned char* byte); // Parse Immidiately
    Call(unsigned short value, bool); // Set value

    // Direct Getter/Setter Functions
    unsigned short GetAddress();
    void SetAddress(unsigned short value);

    // The standard re-implementations from AbstractData
    virtual std::string GenAsm();
    virtual bool IsValid(unsigned char* byte);
    virtual bool Parse(unsigned char* byte);
    virtual unsigned int Arguments();

private:
    unsigned short address;
};

#endif

// Rqandom Notes
//ED Speed of song
//EC Instrument
//DC Volume