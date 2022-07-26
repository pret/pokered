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
	ld de, 4
	ld b, 40
.loop
	ld [hl], a
	add hl, de
	dec b
	jr nz, .loop
	ret
