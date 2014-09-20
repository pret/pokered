PrintCardKeyText: ; 52673 (14:6673)
	ld hl, SilphCoMapList
	ld a, [W_CURMAP]
	ld b, a
.silphCoMapListLoop
	ld a, [hli]
	cp $ff
	ret z
	cp b
	jr nz, .silphCoMapListLoop
	predef GetTileAndCoordsInFrontOfPlayer
	ld a, [wTileInFrontOfPlayer]
	cp $18
	jr z, .cardKeyDoorInFrontOfPlayer
	cp $24
	jr z, .cardKeyDoorInFrontOfPlayer
	ld b, a
	ld a, [W_CURMAP]
	cp SILPH_CO_11F
	ret nz
	ld a, b
	cp $5e
	ret nz
.cardKeyDoorInFrontOfPlayer
	ld b, CARD_KEY
	call IsItemInBag
	jr z, .noCardKey
	call GetCoordsInFrontOfPlayer
	push de
	ld a, $1
	ld [H_DOWNARROWBLINKCNT2], a
	call PrintPredefTextID
	pop de
	srl d
	ld a, d
	ld b, a
	ld [wCardKeyDoorY], a
	srl e
	ld a, e
	ld c, a
	ld [wCardKeyDoorX], a
	ld a, [W_CURMAP]
	cp SILPH_CO_11F
	jr nz, .notSilphCo11F
	ld a, $3
	jr .replaceCardKeyDoorTileBlock
.notSilphCo11F
	ld a, $e
.replaceCardKeyDoorTileBlock
	ld [wd09f], a
	predef ReplaceTileBlock
	ld hl, wd126
	set 5, [hl]
	ld a, (SFX_1f_57 - SFX_Headers_1f) / 3
	jp PlaySound
.noCardKey
	ld a, $2
	ld [H_DOWNARROWBLINKCNT2], a
	jp PrintPredefTextID

SilphCoMapList: ; 526e3 (14:66e3)
	db SILPH_CO_2F
	db SILPH_CO_3F
	db SILPH_CO_4F
	db SILPH_CO_5F
	db SILPH_CO_6F
	db SILPH_CO_7F
	db SILPH_CO_8F
	db SILPH_CO_9F
	db SILPH_CO_10F
	db SILPH_CO_11F
	db $FF

CardKeySuccessText: ; 526ee (14:66ee)
	TX_FAR _CardKeySuccessText1
	db $0b
	TX_FAR _CardKeySuccessText2
	db "@"

CardKeyFailText: ; 526f8 (14:66f8)
	TX_FAR _CardKeyFailText
	db "@"

; d = Y
; e = X
GetCoordsInFrontOfPlayer: ; 526fd (14:66fd)
	ld a, [W_YCOORD]
	ld d, a
	ld a, [W_XCOORD]
	ld e, a
	ld a, [wSpriteStateData1 + 9] ; player's sprite facing direction
	and a
	jr nz, .notFacingDown
; facing down
	inc d
	ret
.notFacingDown
	cp SPRITE_FACING_UP
	jr nz, .notFacingUp
; facing up
	dec d
	ret
.notFacingUp
	cp SPRITE_FACING_LEFT
	jr nz, .notFacingLeft
; facing left
	dec e
	ret
.notFacingLeft
; facing right
	inc e
	ret
