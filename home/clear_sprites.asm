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
	ld a, 160
	ld hl, wShadowOAM
	ld de, OBJ_SIZE
	ld b, OAM_COUNT
.loop
	ld [hl], a
	add hl, de
	dec b
	jr nz, .loop
	ret
