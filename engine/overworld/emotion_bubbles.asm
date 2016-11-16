EmotionBubble:
	ld a, [wWhichEmotionBubble]
	ld c, a
	ld b, 0
	ld hl, EmotionBubblesPointerTable
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, vChars1 + $780
	lb bc, BANK(EmotionBubbles), $04
	call CopyVideoData
	ld a, [wUpdateSpritesEnabled]
	push af
	ld a, $ff
	ld [wUpdateSpritesEnabled], a
	ld a, [wd736]
	bit 6, a ; are the last 4 OAM entries reserved for a shadow or fishing rod?
	ld hl, wOAMBuffer + 4 * 35 + $3 ; $8f
	ld de, wOAMBuffer + 4 * 39 + $3 ; $9f
	jr z, .next
	ld hl, wOAMBuffer + 4 * 31 + $3 ; $7f
	ld de, wOAMBuffer + 4 * 35 + $3 ; $8f

; Copy OAM data 16 bytes forward to make room for emotion bubble OAM data at the
; start of the OAM buffer.
.next
	ld bc, $90
.loop
	ld a, [hl]
	ld [de], a
	dec hl
	dec de
	dec bc
	ld a, c
	or b
	jr nz, .loop

; get the screen coordinates of the sprite the bubble is to be displayed above
	ld hl, wSpriteStateData1 + 4
	ld a, [wEmotionBubbleSpriteIndex]
	swap a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld b, a
	inc hl
	ld a, [hl]
	add $8
	ld c, a

	ld de, EmotionBubblesOAM
	xor a
	call WriteOAMBlock
	ld c, 60
	call DelayFrames
	pop af
	ld [wUpdateSpritesEnabled], a
	call DelayFrame
	jp UpdateSprites

EmotionBubblesPointerTable:
	dw EmotionBubbles
	dw EmotionBubbles + $40
	dw EmotionBubbles + $80

EmotionBubblesOAM:
	db $F8,$00,$F9,$00
	db $FA,$00,$FB,$00

EmotionBubbles:
	INCBIN "gfx/emotion_bubbles.2bpp"
