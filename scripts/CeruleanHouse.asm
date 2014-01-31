CeruleanHouseScript: ; 1d6f6 (7:56f6)
	jp EnableAutoTextBoxDrawing

CeruleanHouseTextPointers: ; 1d6f9 (7:56f9)
	dw CeruleanHouseText1
	dw CeruleanHouseText2

CeruleanHouseText1: ; 1d6fd (7:56fd)
	TX_FAR _CeruleanHouseText1
	db "@"

CeruleanHouseText2: ; 1d702 (7:5702)
	db $08 ; asm
	ld a, $6
	ld [wWhichTrade], a
	ld a, $54
	call Predef
	jp TextScriptEnd


