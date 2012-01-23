#ifndef VOLUME_H
#define VOLUME_H

#include "AbstractData.h"

class Volume : public AbstractData
{
public:
	// Constructors
	Volume();
	Volume(unsigned char* byte); // Parse Immidiately
    Volume(unsigned char volume, bool); // Set value

	// Direct Getters / Setters
	unsigned char GetVolume();
	void SetVolume(unsigned char value);

	// Re-implementations
	virtual std::string GenAsm();
	virtual bool IsValid(unsigned char* byte);
	virtual bool Parse(unsigned char* byte);
	virtual unsigned int Arguments();

private:
	unsigned char volume;
};

#endif