TradeCenter_Script:
	call EnableAutoTextBoxDrawing
	ldh a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	ld a, SPRITE_FACING_LEFT
	jr z, .next
	ld a, SPRITE_FACING_RIGHT
.next
	ldh [hSpriteFacingDirection], a
	ld a, $1
	ldh [hSpriteIndex], a
	call SetSpriteFacingDirection
	ld hl, wd72d
	bit 0, [hl]
	set 0, [hl]
	ret nz
	ld hl, wSprite01StateData2MapY
	ld a, 8 ; y
	ld [hli], a
	ld a, 10 ; x
	ld [hl], a
	ld a, SPRITE_FACING_LEFT
	ld [wSprite01StateData1FacingDirection], a
	ldh a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	ret z
	ld a, 7 ; x
	ld [wSprite01StateData2MapX], a
	ld a, SPRITE_FACING_RIGHT
	ld [wSprite01StateData1FacingDirection], a
	ret

TradeCenter_TextPointers:
	dw TradeCenterText1

TradeCenterText1:
	text_far _TradeCenterText1
	text_end
