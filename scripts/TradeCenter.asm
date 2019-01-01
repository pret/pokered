TradeCenter_Script:
	call EnableAutoTextBoxDrawing
	ld a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	ld a, SPRITE_FACING_LEFT
	jr z, .next
	ld a, SPRITE_FACING_RIGHT
.next
	ld [hSpriteFacingDirection], a
	ld a, $1
	ld [H_SPRITEINDEX], a
	call SetSpriteFacingDirection
	ld hl, wd72d
	bit 0, [hl]
	set 0, [hl]
	ret nz
	ld hl, wSpriteStateData2 + $14
	ld a, $8
	ld [hli], a
	ld a, $a
	ld [hl], a
	ld a, SPRITE_FACING_LEFT
	ld [wSpriteStateData1 + $19], a
	ld a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	ret z
	ld a, $7
	ld [wSpriteStateData2 + $15], a
	ld a, SPRITE_FACING_RIGHT
	ld [wSpriteStateData1 + $19], a
	ret

TradeCenter_TextPointers:
	dw TradeCenterText1

TradeCenterText1:
	TX_FAR _TradeCenterText1
	db "@"
