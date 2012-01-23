#include <sstream>
#include "Parser.h"
using namespace std;

// Constructors
Parser::Parser()
{
	rawBytes = 0;
	fileLength = 0;
	filePos = 0;
	stop = false;
	stopAddress = 0;
}

Parser::Parser(std::string filename)
{
	rawBytes = 0;
	fileLength = 0;
	filePos = 0;
	stop = false;

	SetFilename(filename);
}

// Deconstructors
Parser::~Parser()
{
	// Clear out temporary buffer
	delete[] rawBytes;

	// Clear out parsed buffer
	for(unsigned int i = 0; i < parsedBytes.size(); i++)
	{
		delete parsedBytes[i];
	}
}

// Getters / Setters
string Parser::GetFilename()
{
	return filename;
}

void Parser::SetFilename(std::string value)
{
	filename = value;
	Read();
}

unsigned int Parser::GetStopAddress()
{
	return stopAddress;
}

void Parser::SetStopAddress(unsigned int value)
{
	stopAddress = value;
}

string Parser::GetParsedAsm()
{
	string tmpStr;

	for(unsigned int i = 0; i < parsedString.size(); i++)
	{
		tmpStr += parsedString[i] + "\n";
	}

	return tmpStr;
}

// File Operations
// Absolutely no error checking at all - likely needs to be done at somepoint
void Parser::Read()
{
	// open File
	fstream tmpFile(filename, ios_base::in | ios_base::binary);

	// Get Length
	tmpFile.seekg(0, ios::end);
	fileLength = tmpFile.tellg();
	tmpFile.seekg(0, ios::beg);

	// Allocate proper memory
	rawBytes = new char[fileLength];

	// Read filedata
	tmpFile.read(rawBytes, fileLength);
	tmpFile.close();
}

// Code Operations
void Parser::Parse(unsigned int offset)
{
	filePos = offset;
	ParseNext();
}

void Parser::ParseNext() // Parses the block immidiately following
{
	stringstream tmpStr;
	unsigned char* rawBytesFixed = (unsigned char*)rawBytes;
	stop = false;

	// Smart generation
	bool indent = false;
	bool firstNonNote = false;	// First byte wasn't a note or octacve switch, add ";Setup" comment
	bool firstNote = false;	// First note or octave

	stringstream pos;
	pos << "; " << hex << uppercase << (unsigned int)filePos;
	parsedString.push_back(pos.str());

	for(unsigned int i = filePos; (i <= fileLength) && (stop == false); i++)
	{
		// There's a way to make this block shorter but for now it does it's job
		filePos = i;

		// Check to see if it's the correct data type and if so then use it
		if(tmpCall.IsValid(&rawBytesFixed[i])) // Should have made IsValid static
		{
			// Call data type

			// Create data type then move the increment pointer further up as needed
			parsedBytes.push_back(new Call(&rawBytesFixed[i]));
			parsedString.push_back(parsedBytes[parsedBytes.size() - 1]->GenAsm());
			i += tmpCall.Arguments(); // should have made Arguments static

			Call* _tmp = (Call*)parsedBytes[parsedBytes.size() - 1];
		}
		else if(tmpDuty.IsValid(&rawBytesFixed[i]))
		{
			// Duty data type
			parsedBytes.push_back(new Duty(&rawBytesFixed[i]));
			parsedString.push_back(parsedBytes[parsedBytes.size() - 1]->GenAsm());
			i += tmpDuty.Arguments();
		}
		else if(tmpJump.IsValid(&rawBytesFixed[i]))
		{
			// Jump data type
			parsedBytes.push_back(new Jump(&rawBytesFixed[i]));
			parsedString.push_back(parsedBytes[parsedBytes.size() - 1]->GenAsm());
			i += tmpJump.Arguments();

			Jump* _tmp = (Jump*)parsedBytes[parsedBytes.size() - 1];
		}
		else if(tmpModulation.IsValid(&rawBytesFixed[i]))
		{
			// Modulation data type
			parsedBytes.push_back(new Modulation(&rawBytesFixed[i]));
			parsedString.push_back(parsedBytes[parsedBytes.size() - 1]->GenAsm());
			i += tmpModulation.Arguments();
		}
		else if(tmpNote.IsValid(&rawBytesFixed[i]))
		{
			// Note data type
			parsedBytes.push_back(new Note(&rawBytesFixed[i]));
			parsedString.push_back(parsedBytes[parsedBytes.size() - 1]->GenAsm());
			i += tmpNote.Arguments();
		}
		else if(tmpOctave.IsValid(&rawBytesFixed[i]))
		{
			// Octave data type
			parsedBytes.push_back(new Octave(&rawBytesFixed[i]));
			parsedString.push_back("\n" + parsedBytes[parsedBytes.size() - 1]->GenAsm());
			i += tmpOctave.Arguments();
		}
		else if(tmpStop.IsValid(&rawBytesFixed[i]))
		{
			// Stop data type
			parsedBytes.push_back(new Stop(&rawBytesFixed[i]));
			parsedString.push_back(parsedBytes[parsedBytes.size() - 1]->GenAsm());
			i += tmpStop.Arguments();

			stop = true;	// Stop all further processing, we've reached the end of the song
		}
		else if(tmpTempo.IsValid(&rawBytesFixed[i]))
		{
			// Tempo data type
			parsedBytes.push_back(new Tempo(&rawBytesFixed[i]));
			parsedString.push_back(parsedBytes[parsedBytes.size() - 1]->GenAsm());
			i += tmpTempo.Arguments();
		}
		else if(tmpVelocity.IsValid(&rawBytesFixed[i]))
		{
			// Velocity data type
			parsedBytes.push_back(new Velocity(&rawBytesFixed[i]));
			parsedString.push_back(parsedBytes[parsedBytes.size() - 1]->GenAsm());
			i += tmpVelocity.Arguments();
		}
		else if(tmpVolume.IsValid(&rawBytesFixed[i]))
		{
			// Volume data type
			parsedBytes.push_back(new Volume(&rawBytesFixed[i]));
			parsedString.push_back(parsedBytes[parsedBytes.size() - 1]->GenAsm());
			i += tmpVolume.Arguments();
		}
		else
		{
			// Unknown code
			stringstream unkCode;
			short tmpByte = (short)rawBytesFixed[i];
			unkCode << "db $" << hex << uppercase << (short)rawBytesFixed[i];
			parsedString.push_back(unkCode.str());
		}

		// If the stop address parameter is set, break when we get there
		if( (stopAddress != 0) && (i >= stopAddress) ) break;
	}

	// Now record the postion we left off
	pos.str("");
	pos << "; " << hex << uppercase << (unsigned int)filePos;
	parsedString.push_back(pos.str());

	filePos += 1;		// increment 1 for the start of the next possible song
}