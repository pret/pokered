PrintCardKeyText: ; 52673 (14:6673)
	ld hl, SilphCoMapList
	ld a, [W_CURMAP]
	ld b, a
.asm_5267a
	ld a, [hli]
	cp $ff
	ret z
	cp b
	jr nz, .asm_5267a
	predef Func_c586
	ld a, [wcfc6]
	cp $18
	jr z, .asm_5269c
	cp $24
	jr z, .asm_5269c
	ld b, a
	ld a, [W_CURMAP]
	cp SILPH_CO_11F
	ret nz
	ld a, b
	cp $5e
	ret nz
.asm_5269c
	ld b, CARD_KEY
	call IsItemInBag
	jr z, .asm_526dc
	call Func_526fd
	push de
	ld a, $1
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call PrintPredefTextID
	pop de
	srl d
	ld a, d
	ld b, a
	ld [wd73f], a
	srl e
	ld a, e
	ld c, a
	ld [wd740], a
	ld a, [W_CURMAP] ; W_CURMAP
	cp SILPH_CO_11F
	jr nz, .asm_526c8
	ld a, $3
	jr .asm_526ca
.asm_526c8
	ld a, $e
.asm_526ca
	ld [wd09f], a
	predef Func_ee9e
	ld hl, wd126
	set 5, [hl]
	ld a, (SFX_1f_57 - SFX_Headers_1f) / 3
	jp PlaySound
.asm_526dc
	ld a, $2
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
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

Func_526fd: ; 526fd (14:66fd)
	ld a, [W_YCOORD] ; wd361
	ld d, a
	ld a, [W_XCOORD] ; wd362
	ld e, a
	ld a, [wSpriteStateData1 + 9]
	and a
	jr nz, .asm_5270d
	inc d
	ret
.asm_5270d
	cp $4
	jr nz, .asm_52713
	dec d
	ret
.asm_52713
	cp $8
	jr nz, .asm_52719
	dec e
	ret
.asm_52719
	inc e
	ret
