SECTION "Sprite Buffers", SRAM, BANK[0]

S_SPRITEBUFFER0:: ds SPRITEBUFFERSIZE ; a000
S_SPRITEBUFFER1:: ds SPRITEBUFFERSIZE ; a188
S_SPRITEBUFFER2:: ds SPRITEBUFFERSIZE ; a310

	ds $100

sHallOfFame:: ds HOF_TEAM * HOF_TEAM_CAPACITY ; a598


SECTION "Save Data", SRAM, BANK[1]
	ds $598

sPlayerName::  ds 11 ; a598
sMainData::    ds W_NUMINBOX - wPokedexOwned ; a5a3
sSpriteData::  ds $200 ; wOAMBuffer - wSpriteStateData1 ; ad2c
sPartyData::   ds wPokedexOwned - wPartyCount ; af2c
sCurBoxData::  ds wBoxMonNicksEnd - W_NUMINBOX ; b0c0
sTilesetType:: ds 1 ; b522
sMainDataCheckSum:: ds 1 ; b523


SECTION "Saved Boxes 1", SRAM, BANK[2]

sBox1:: ds wBoxMonNicksEnd - W_NUMINBOX ; a000
sBox2:: ds wBoxMonNicksEnd - W_NUMINBOX ; a462
sBox3:: ds wBoxMonNicksEnd - W_NUMINBOX ; a8c4
sBox4:: ds wBoxMonNicksEnd - W_NUMINBOX ; ad26
sBox5:: ds wBoxMonNicksEnd - W_NUMINBOX ; b188
sBox6:: ds wBoxMonNicksEnd - W_NUMINBOX ; b5ea
sBank2AllBoxesChecksum:: ds 1 ; ba4c
sBank2IndividualBoxChecksums:: ds 6 ; ba4d


SECTION "Saved Boxes 2", SRAM, BANK[3]

sBox7::  ds wBoxMonNicksEnd - W_NUMINBOX ; a000
sBox8::  ds wBoxMonNicksEnd - W_NUMINBOX ; a462
sBox9::  ds wBoxMonNicksEnd - W_NUMINBOX ; a8c4
sBox10:: ds wBoxMonNicksEnd - W_NUMINBOX ; ad26
sBox11:: ds wBoxMonNicksEnd - W_NUMINBOX ; b188
sBox12:: ds wBoxMonNicksEnd - W_NUMINBOX ; b5ea
sBank3AllBoxesChecksum:: ds 1 ; ba4c
sBank3IndividualBoxChecksums:: ds 6 ; ba4d
