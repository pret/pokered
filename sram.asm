SECTION "Sprite Buffers", SRAM ; BANK 0

sSpriteBuffer0:: ds SPRITEBUFFERSIZE
sSpriteBuffer1:: ds SPRITEBUFFERSIZE
sSpriteBuffer2:: ds SPRITEBUFFERSIZE

	ds $100

sHallOfFame:: ds HOF_TEAM * HOF_TEAM_CAPACITY


SECTION "Save Data", SRAM ; BANK 1
	ds $598

sPlayerName::  ds NAME_LENGTH
sMainData::    ds wMainDataEnd   - wMainDataStart
sSpriteData::  ds wSpriteDataEnd - wSpriteDataStart
sPartyData::   ds wPartyDataEnd  - wPartyDataStart
sCurBoxData::  ds wBoxDataEnd    - wBoxDataStart
sTileAnimations:: ds 1
sMainDataCheckSum:: ds 1


SECTION "Saved Boxes 1", SRAM ; BANK 2

sBox1:: ds wBoxDataEnd - wBoxDataStart
sBox2:: ds wBoxDataEnd - wBoxDataStart
sBox3:: ds wBoxDataEnd - wBoxDataStart
sBox4:: ds wBoxDataEnd - wBoxDataStart
sBox5:: ds wBoxDataEnd - wBoxDataStart
sBox6:: ds wBoxDataEnd - wBoxDataStart
sBank2AllBoxesChecksum:: ds 1
sBank2IndividualBoxChecksums:: ds 6


SECTION "Saved Boxes 2", SRAM ; BANK 3

sBox7::  ds wBoxDataEnd - wBoxDataStart
sBox8::  ds wBoxDataEnd - wBoxDataStart
sBox9::  ds wBoxDataEnd - wBoxDataStart
sBox10:: ds wBoxDataEnd - wBoxDataStart
sBox11:: ds wBoxDataEnd - wBoxDataStart
sBox12:: ds wBoxDataEnd - wBoxDataStart
sBank3AllBoxesChecksum:: ds 1
sBank3IndividualBoxChecksums:: ds 6
