CeruleanHouseTrashedScript: ; 1d685 (7:5685)
	call EnableAutoTextBoxDrawing
	ret

CeruleanHouseTrashedTextPointers: ; 1d689 (7:5689)
	dw CeruleanHouseTrashedText1
	dw CeruleanHouseTrashedText2
	dw CeruleanHouseTrashedText3

CeruleanHouseTrashedText1: ; 1d68f (7:568f)
	db $08 ; asm
	ld b, $e4
	predef IsItemInBag_
	and b
	jr z, .asm_f8734 ; 0x1d698
	ld hl, CeruleanHouseTrashedText_1d6b0
	call PrintText
	jr .asm_8dfe9 ; 0x1d6a0
.asm_f8734 ; 0x1d6a2
	ld hl, CeruleanHouseTrashedText_1d6ab
	call PrintText
.asm_8dfe9 ; 0x1d6a8
	jp TextScriptEnd

CeruleanHouseTrashedText_1d6ab: ; 1d6ab (7:56ab)
	TX_FAR _CeruleanTrashedText_1d6ab
	db "@"

CeruleanHouseTrashedText_1d6b0: ; 1d6b0 (7:56b0)
	TX_FAR _CeruleanTrashedText_1d6b0
	db "@"

CeruleanHouseTrashedText2: ; 1d6b5 (7:56b5)
	TX_FAR _CeruleanHouseTrashedText2
	db "@"

CeruleanHouseTrashedText3: ; 1d6ba (7:56ba)
	TX_FAR _CeruleanHouseTrashedText3
	db "@"
