#ifndef FILE_H
#define FILE_H

#include <string>
#include <vector>
#include <fstream>

class File
{
public:
	File();
	File(std::string filename, unsigned int offset = 0, unsigned int length = 0);

	string GetFileName();
	void SetFilename(string value);

private:
	std::string filename;
	std::vector<unsigned char> fileBuffer;
	std::fstream fileHandle;

	std::vector<unsigned char>::iterator start;
	std::vector<unsigned char>::iterator cur;
};

#endif