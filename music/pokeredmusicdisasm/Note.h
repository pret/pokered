#ifndef NOTE_H
#define NOTE_H

#include "AbstractData.h"

// Holds a single note
class Note : public AbstractData
{
public:
	// Constructors
	Note();
	Note(unsigned char* byte); // Parse Immidiately
    Note(unsigned char pitch, unsigned char delay,bool); // Set value

	// Reimplementations
	virtual std::string GenAsm();
	virtual bool IsValid(unsigned char* byte);
	virtual bool Parse(unsigned char* byte);
	virtual unsigned int Arguments();

	// Getters and Setters
	unsigned char GetPitch();
	void SetPitch(unsigned char value);

	unsigned char GetDelay();
	void SetDelay(unsigned char value);

	// Specific Methods
	std::string LookupPitchStr();
	std::string LookupDelayStr();

	const enum pitch_code : unsigned char
	{
		noteC = 0x0,
		noteCS = 0x1,
		noteD = 0x2,
		noteDS = 0x3,
		noteE = 0x4,
		noteF = 0x5,
		noteFS = 0x6,
		noteG = 0x7,
		noteGS = 0x8,
		noteA = 0x9,
		noteAS = 0xA,
		noteB = 0xB,
		noteRst = 0xC
	};

	const enum delay_code : unsigned char
	{
		note16 = 0x0,
		note8 = 0x1,
		note8_16 = 0x2,
		note4 = 0x3,
		note4_16 = 0x4,
		note4_8 = 0x5,
		note4_8_16 = 0x6,
		note2 = 0x7,
		note2_16 = 0x8,
		note2_8 = 0x9,
		note2_8_16 = 0xA,
		note2_4 = 0xB,
		note2_4_16 = 0xC,
		note2_4_8 = 0xD,
		note2_4_8_16 = 0xE,
		note1 = 0xF
	};
private:
	unsigned char pitch;
	unsigned char delay;
};

#endif