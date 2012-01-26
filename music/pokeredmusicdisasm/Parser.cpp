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
	stopAddress = 0;

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
		// Ensure each line isn't already a new-line, this prevents double or tripple empty lines from piling up
		if(parsedString[i] != "\n") tmpStr += parsedString[i] + "\n";
		else tmpStr += parsedString[i];
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

	rawBytesFixed = (unsigned char*)rawBytes;
}

// Code Operations
void Parser::Parse(unsigned int offset)
{
	filePos = offset;
	ParseNext();
}

template<class T>
bool Parser::ParseData(unsigned int& pos, bool reado)
{
	// Create the class to use if correct and a dummy class for validating
	T* tmpC = 0;
	T dummy;

	// If the bytes are this data type then create and save it
	if(dummy.IsValid(&rawBytesFixed[pos]))
	{
		// Ensure this whole opperation isn't read-only (just peeking)
		if(!reado)
		{
			// Initialize the class
			tmpC = new T(&rawBytesFixed[pos]);

			// Push it onto the stack and it's assembly generation onto the output class
			parsedBytes.push_back(tmpC);	// 
			parsedString.push_back(tmpC->GenAsm());

			// If the class had any arguments, increment the counter that much forward
			pos += tmpC->Arguments();
		}
		return true;	// Let the code know this class was valid
	}

	return false;	// Let the code know this class wasn't valid
}

void Parser::ParseNext() // Parses the block immidiately following
{
	stringstream tmpStr;
	stop = false;

	// Smart generation
	bool firstNonNote = false;	// (unused so far)First byte wasn't a note or octacve switch, add ";Setup" comment
	bool firstNote = false;	// (unused so far) First note or octave
	unsigned char lDataType = DATA_NA;

	stringstream pos;
	pos << "; " << hex << uppercase << (unsigned int)filePos;
	parsedString.push_back(pos.str());

	unsigned int count = 1;	// Counter for processed instructions
	for(unsigned int i = filePos; (i <= fileLength) && (stop == false); i++)
	{
		// First peek to see what kind of data it is, then perform any pre and post setup
		if(ParseData<Call>(i, true))
		{
			if(lDataType == DATA_NOTE) parsedString.push_back("\n"); // Insert a newline after notes

			ParseData<Call>(i);
			lDataType = DATA_CALL;
		}
		else if(ParseData<Duty>(i, true))
		{
			if(lDataType == DATA_NOTE) parsedString.push_back("\n"); // Insert a newline after notes

			ParseData<Duty>(i);
			lDataType = DATA_DUTY;
		}
		else if(ParseData<Jump>(i, true))
		{
			if(lDataType == DATA_NOTE) parsedString.push_back("\n"); // Insert a newline after notes

			ParseData<Jump>(i);
			lDataType = DATA_JUMP;
		}
		else if(ParseData<Modulation>(i, true))
		{
			if(lDataType == DATA_NOTE) parsedString.push_back("\n"); // Insert a newline after notes

			ParseData<Modulation>(i);
			lDataType = DATA_MODULATION;
		}
		else if(ParseData<Note>(i, true))
		{
			 // Insert a newline after certain types
			if((lDataType == DATA_UNKCODE) ||
				(lDataType == DATA_UNKEB)) parsedString.push_back("\n");

			// If the previous item was a rest note then insert a new line
			else if(lDataType == DATA_NOTE)
			{
				Note* _tmpNote = (Note*)parsedBytes[parsedBytes.size() - 1];
				if(_tmpNote->GetPitch() == _tmpNote->noteRst) parsedString.push_back("\n");
			}

			ParseData<Note>(i);

			// Further indent each note
			parsedString[parsedString.size() - 1] = "\t" + parsedString[parsedString.size() - 1];
			lDataType = DATA_NOTE;
		}
		else if(ParseData<Octave>(i, true))
		{
			// Insert new-line if previous line isn't a newline
			if(parsedString[parsedString.size() - 1] != "\n") parsedString.push_back("\n");

			ParseData<Octave>(i);
			lDataType = DATA_OCTAVE;
		}
		else if(ParseData<Tempo>(i, true))
		{
			if(lDataType == DATA_NOTE) parsedString.push_back("\n"); // Insert a newline after notes

			ParseData<Tempo>(i);
			lDataType = DATA_TEMPO;
		}
		else if(ParseData<Velocity>(i, true))
		{
			if(lDataType == DATA_NOTE) parsedString.push_back("\n"); // Insert a newline after notes

			ParseData<Velocity>(i);
			lDataType = DATA_VELOCITY;
		}
		else if(ParseData<Volume>(i, true))
		{
			if(lDataType == DATA_NOTE) parsedString.push_back("\n"); // Insert a newline after notes

			ParseData<Volume>(i);
			lDataType = DATA_VOLUME;
		}
		else if(ParseData<UnkEB>(i, true))	// The opcode is 0xEB which is unknown and takes a 1-byte argument
		{
			if(lDataType == DATA_NOTE) parsedString.push_back("\n"); // Insert a newline after notes

			ParseData<UnkEB>(i);
			lDataType = DATA_UNKEB;
		}
		else if(ParseData<Stop>(i, true))
		{
			if(lDataType == DATA_NOTE) parsedString.push_back("\n"); // Insert a newline after notes

			ParseData<Stop>(i);
			stop = true; // Raise the stop flag informing the parser to stop
			lDataType = DATA_STOP;
		}
		else
		{
			if(lDataType == DATA_NOTE) parsedString.push_back("\n"); // Insert a newline after notes

			ParseData<UnkCode>(i);	// The opcode is unknown - process the raw byte and move on
			lDataType = DATA_UNKCODE;
		}

		// Put everything tabbed over at least 1 time to fix some weird RGBDS bug by pre-pending a tab character
		parsedString[parsedString.size() - 1] = "\t" + parsedString[parsedString.size() - 1];

		// Append File Position in hexidecimal at end of line every 5 instructions
		if((count % 5) == 0)
		{
			stringstream _tmpCount;
			_tmpCount << hex << uppercase << i;
			parsedString[parsedString.size() - 1] = parsedString[parsedString.size() - 1] + "; " + _tmpCount.str();
		}

		filePos = i;
		count++;

		// If the stop address parameter is set, break when we get there
		if( (stopAddress != 0) && (i >= stopAddress) ) break;
	}

	// Now record the postion we left off
	pos.str("");
	pos << "; " << hex << uppercase << (unsigned int)filePos;
	parsedString.push_back(pos.str());

	filePos += 1;		// increment 1 for the start of the next possible song
}