CeruleanTrashedHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

CeruleanTrashedHouse_TextPointers:
	dw CeruleanHouseTrashedText1
	dw CeruleanHouseTrashedText2
	dw CeruleanHouseTrashedText3

CeruleanHouseTrashedText1:
	TX_ASM
	ld b, $e4
	predef GetQuantityOfItemInBag
	and b
	jr z, .asm_f8734
	ld hl, CeruleanHouseTrashedText_1d6b0
	call PrintText
	jr .asm_8dfe9
.asm_f8734
	ld hl, CeruleanHouseTrashedText_1d6ab
	call PrintText
.asm_8dfe9
	jp TextScriptEnd

CeruleanHouseTrashedText_1d6ab:
	TX_FAR _CeruleanTrashedText_1d6ab
	db "@"

CeruleanHouseTrashedText_1d6b0:
	TX_FAR _CeruleanTrashedText_1d6b0
	db "@"

CeruleanHouseTrashedText2:
	TX_FAR _CeruleanHouseTrashedText2
	db "@"

CeruleanHouseTrashedText3:
	TX_FAR _CeruleanHouseTrashedText3
	db "@"
