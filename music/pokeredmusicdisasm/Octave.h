#ifndef OCTAVE_H
#define OCTAVE_H

#include "AbstractData.h"

//Represents 1 octave value
class Octave : public AbstractData
{
public:
	// Constructors
	Octave();
	Octave(unsigned char* byte); // Parse Immidiately
    Octave(unsigned char octave, bool); // Set value

	// Direct Getters / Setters
	unsigned char GetOctave();
	void SetOctave(unsigned char value);

	// Overides
	virtual std::string GenAsm();
	virtual bool IsValid(unsigned char* byte);
	virtual bool Parse(unsigned char* byte);
	virtual unsigned int Arguments();

	std::string LookupOctString();

        enum OctaveCode : unsigned char
        {
            oct0 = 0xE7,
            oct1 = 0xE6,
            oct2 = 0xE5,
            oct3 = 0xE4,
            oct4 = 0xE3,
            oct5 = 0xE2,
            oct6 = 0xE1,
            oct7 = 0xE0
        };

private:
	unsigned char octave;
};

#endif