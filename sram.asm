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


; The PC boxes will not fit into one SRAM bank,
; so they use multiple SECTIONs
box_n = 0
boxes: MACRO
rept \1
box_n = box_n + 1
sBox{d:box_n}:: ds wBoxDataEnd - wBoxDataStart
endr
ENDM

SECTION "Saved Boxes 1", SRAM ; BANK 2

; sBox1 - sBox6
	boxes 6
sBank2AllBoxesChecksum:: ds 1
sBank2IndividualBoxChecksums:: ds 6

SECTION "Saved Boxes 2", SRAM ; BANK 3

; sBox7 - sBox12
	boxes 6
sBank3AllBoxesChecksum:: ds 1
sBank3IndividualBoxChecksums:: ds 6

; All 12 boxes fit within 2 SRAM banks
	assert box_n == NUM_BOXES, \
		"boxes: Expected {d:NUM_BOXES} total boxes, got {d:box_n}"
