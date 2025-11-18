ClearSprites::
	xor a
	ld hl, wShadowOAM
	ld b, wShadowOAMEnd - wShadowOAM
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ret

HideSprites::
	ld a, SCREEN_HEIGHT_PX + OAM_Y_OFS
	ld hl, wShadowOAMSprite00YCoord
	ld de, OBJ_SIZE
	ld b, OAM_COUNT
.loop
	ld [hl], a
	add hl, de
	dec b
	jr nz, .loop
	ret
