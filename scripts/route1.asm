Route1Script: ; 1caaf (7:4aaf)
	jp EnableAutoTextBoxDrawing

Route1TextPointers: ; 1cab2 (7:4ab2)
	dw Route1Text1
	dw Route1Text2
	dw Route1Text3

Route1Text1: ; 1cab8 (7:4ab8)
	TX_ASM
	CheckAndSetEvent EVENT_GOT_POTION_SAMPLE
	jr nz, .asm_1cada
	ld hl, Route1ViridianMartSampleText
	call PrintText
	lb bc, POTION, 1
	call GiveItem
	jr nc, .BagFull
	ld hl, Route1Text_1cae8
	jr .asm_1cadd
.BagFull
	ld hl, Route1Text_1caf3
	jr .asm_1cadd
.asm_1cada
	ld hl, Route1Text_1caee
.asm_1cadd
	call PrintText
	jp TextScriptEnd

Route1ViridianMartSampleText: ; 1cae3 (7:4ae3)
	TX_FAR _Route1ViridianMartSampleText
	db "@"

Route1Text_1cae8: ; 1cae8 (7:4ae8)
	TX_FAR _Route1Text_1cae8
	db $0b,"@"

Route1Text_1caee: ; 1caee (7:4aee)
	TX_FAR _Route1Text_1caee
	db "@"

Route1Text_1caf3: ; 1caf3 (7:4af3)
	TX_FAR _Route1Text_1caf3
	db "@"

Route1Text2: ; 1caf8 (7:4af8)
	TX_FAR _Route1Text2
	db "@"

Route1Text3: ; 1cafd (7:4afd)
	TX_FAR _Route1Text3
	db "@"
