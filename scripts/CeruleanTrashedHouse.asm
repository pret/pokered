CeruleanTrashedHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

CeruleanTrashedHouse_TextPointers:
	dw CeruleanHouseTrashedText1
	dw CeruleanHouseTrashedText2
	dw CeruleanHouseTrashedText3

CeruleanHouseTrashedText1:
	text_asm
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
	text_far _CeruleanTrashedText_1d6ab
	text_end

CeruleanHouseTrashedText_1d6b0:
	text_far _CeruleanTrashedText_1d6b0
	text_end

CeruleanHouseTrashedText2:
	text_far _CeruleanHouseTrashedText2
	text_end

CeruleanHouseTrashedText3:
	text_far _CeruleanHouseTrashedText3
	text_end
