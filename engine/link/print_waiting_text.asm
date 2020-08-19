PrintWaitingText::
	hlcoord 3, 10
	ld b, $1
IF DEF(_ENGLISH)
	ld c, $b
ENDC
IF DEF(_GERMAN)
	ld c, $d
ENDC
	ld a, [wIsInBattle]
	and a
	jr z, .asm_4c17
	call TextBoxBorder
	jr .asm_4c1a
.asm_4c17
	call CableClub_TextBoxBorder
.asm_4c1a
	hlcoord 4, 11
	ld de, WaitingText
	call PlaceString
	ld c, 50
	jp DelayFrames

IF DEF(_ENGLISH)
WaitingText:
	db "Waiting...!@"
ENDC

IF DEF(_GERMAN)
WaitingText:
	db "BITTE WARTEN…@"
ENDC
