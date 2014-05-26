Route1Script: ; 1caaf (7:4aaf)
	jp EnableAutoTextBoxDrawing

Route1TextPointers: ; 1cab2 (7:4ab2)
	dw Route1Text1
	dw Route1Text2
	dw Route1Text3

Route1Text1: ; 1cab8 (7:4ab8)
	db $08 ; asm
	ld hl, wd7bf
	bit 0, [hl]
	set 0, [hl]
	jr nz, .asm_02840 ; 0x1cac0
	ld hl, Route1ViridianMartSampleText
	call PrintText
	ld bc, (POTION << 8) | 1
	call GiveItem
	jr nc, .BagFull
	ld hl, Route1Text_1cae8 ; $4ae8
	jr .asm_46d43 ; 0x1cad3
.BagFull
	ld hl, Route1Text_1caf3 ; $4af3
	jr .asm_46d43 ; 0x1cad8
.asm_02840 ; 0x1cada
	ld hl, Route1Text_1caee ; $4aee
.asm_46d43 ; 0x1cadd
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
