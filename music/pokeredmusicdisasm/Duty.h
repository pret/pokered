#ifndef DUTY_H
#define DUTY_H

#include "AbstractData.h"

//Represents 1 Duty data
class Duty : public AbstractData
{
public:
    // Constructors
    Duty();
    Duty(unsigned char* byte); // Parse Immidiately
    Duty(unsigned char value, bool); // Set value

    // Re-Implementations from Parent
    virtual std::string GenAsm();
    virtual bool IsValid(unsigned char* byte);
    virtual bool Parse(unsigned char* byte);
    virtual unsigned int Arguments();

    // Direct Getters and Setters
    unsigned char GetDuty();
    void SetDuty(unsigned char value);

    // Custom Functions
    std::string LookupDutyString();

    const enum dutyList : unsigned char
    {
        duty12_5 = 0x0,
        duty25 = 0x1,
        duty50 = 0x2,
        duty75 = 0x3
    };

private:
	unsigned char duty;
};

#endif