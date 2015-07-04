StartSlotMachine: ; 37e2d (d:7e2d)
	ld a, [wTrainerSpriteOffset]
	cp $fd
	jr z, .printOutOfOrder
	cp $fe
	jr z, .printOutToLunch
	cp $ff
	jr z, .printSomeonesKeys
	callba AbleToPlaySlotsCheck
	ld a, [wTrainerSpriteOffset]
	and a
	ret z
	ld a, [wUnknownSlotVar]
	ld b, a
	ld a, [wTrainerFacingDirection]
	inc a
	cp b
	jr z, .asm_37e58
	ld a, $fd
	jr .asm_37e5a
.asm_37e58
	ld a, $fa
.asm_37e5a
	ld [wcc5b], a
	ld a, [H_LOADEDROMBANK]
	ld [wcc5e], a
	call PromptUserToPlaySlots
	ret
.printOutOfOrder
	tx_pre_id GameCornerOutOfOrderText
	jr .printText
.printOutToLunch
	tx_pre_id GameCornerOutToLunchText
	jr .printText
.printSomeonesKeys
	tx_pre_id GameCornerSomeonesKeysText
.printText
	push af
	call EnableAutoTextBoxDrawing
	pop af
	call PrintPredefTextID
	ret

GameCornerOutOfOrderText: ; 37e79 (d:7e79)
	TX_FAR _GameCornerOutOfOrderText
	db "@"

GameCornerOutToLunchText: ; 37e7e (d:7e7e)
	TX_FAR _GameCornerOutToLunchText
	db "@"

GameCornerSomeonesKeysText: ; 37e83 (d:7e83)
	TX_FAR _GameCornerSomeonesKeysText
	db "@"
