Route2HouseScript: ; 1deed (7:5eed)
	jp EnableAutoTextBoxDrawing

Route2HouseTextPointers: ; 1def0 (7:5ef0)
	dw Route2HouseText1
	dw Route2HouseText2

Route2HouseText1: ; 1def4 (7:5ef4)
	TX_FAR _Route2HouseText1
	db "@"

Route2HouseText2: ; 1def9 (7:5ef9)
	db $08 ; asm
	ld a, $1
	ld [wWhichTrade], a
	predef Predef54
	jp TextScriptEnd
