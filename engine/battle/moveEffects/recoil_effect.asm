RecoilEffect_: ; 1392c (4:792c)
	ld a, [H_WHOSETURN]
	and a
	ld a, [W_PLAYERMOVENUM]
	ld hl, wBattleMonMaxHP
	jr z, .asm_1393d
	ld a, [W_ENEMYMOVENUM]
	ld hl, wEnemyMonMaxHP
.asm_1393d
	ld d, a
	ld a, [W_DAMAGE]
	ld b, a
	ld a, [W_DAMAGE + 1]
	ld c, a
	srl b
	rr c
	ld a, d
	cp STRUGGLE
	jr z, .asm_13953
	srl b
	rr c
.asm_13953
	ld a, b
	or c
	jr nz, .asm_13958
	inc c
.asm_13958
	ld a, [hli]
	ld [wHPBarMaxHP+1], a
	ld a, [hl]
	ld [wHPBarMaxHP], a
	push bc
	ld bc, $fff2
	add hl, bc
	pop bc
	ld a, [hl]
	ld [wHPBarOldHP], a
	sub c
	ld [hld], a
	ld [wHPBarNewHP], a
	ld a, [hl]
	ld [wHPBarOldHP+1], a
	sbc b
	ld [hl], a
	ld [wHPBarNewHP+1], a
	jr nc, .asm_13982
	xor a
	ld [hli], a
	ld [hl], a
	ld hl, wHPBarNewHP
	ld [hli], a
	ld [hl], a
.asm_13982
	hlCoord 10, 9
	ld a, [H_WHOSETURN]
	and a
	ld a, $1
	jr z, .asm_13990
	hlCoord 2, 2
	xor a
.asm_13990
	ld [wHPBarType], a
	predef UpdateHPBar2
	ld hl, HitWithRecoilText
	jp PrintText
HitWithRecoilText: ; 1399e (4:799e)
	TX_FAR _HitWithRecoilText
	db "@"
