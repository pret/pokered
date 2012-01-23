#ifndef PARSER_H
#define PARSER_H

#include <fstream>
#include <string>
#include <vector>

#include "AbstractData.h"
#include "Call.h"
#include "Console.h"
#include "Duty.h"
#include "Jump.h"
#include "Modulation.h"
#include "Note.h"
#include "Octave.h"
#include "Parser.h"
#include "Stop.h"
#include "Tempo.h"
#include "Velocity.h"
#include "Volume.h"

// This is the final class, it takes all of the data types, abstract class, and helper functions and uses them
// for parsing

// the final decided plan was to read the whole file into memory (a rom isn't exactly a big memory breaker)
class Parser
{
public:
	// Constructors
	Parser();
	Parser(std::string filename);

	// Deconstructors
	~Parser();

	// Getters / Setters
	std::string GetFilename();
	void SetFilename(std::string value);

	unsigned int GetStopAddress();
	void SetStopAddress(unsigned int value);

	std::string GetParsedAsm();

	// File Operations
	void Read();

	// Code Operations
	void Parse(unsigned int offset);
	void ParseNext(); // Parses the block immidiately following

private:
	std::string filename;
	std::vector<AbstractData*> parsedBytes;
	std::vector<std::string> parsedString;

	char* rawBytes;
	unsigned int fileLength;
	unsigned int filePos;
	bool stop;

	// Optional Settings
	unsigned int stopAddress;

	// A lot of tmp classes
	Call tmpCall;
	Duty tmpDuty;
	Jump tmpJump;
	Modulation tmpModulation;
	Note tmpNote;
	Octave tmpOctave;
	Stop tmpStop;
	Tempo tmpTempo;
	Velocity tmpVelocity;
	Volume tmpVolume;
};

#endif