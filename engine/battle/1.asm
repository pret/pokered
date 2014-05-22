DrainHPEffect_: ; 783f (1:783f)
	ld hl, W_DAMAGE ; $d0d7
	ld a, [hl]
	srl a ; divide damage by 2
	ld [hli], a
	ld a, [hl]
	rr a
	ld [hld], a
	or [hl]
	jr nz, .asm_784f
	inc hl
	inc [hl]
.asm_784f
	ld hl, W_PLAYERMONCURHP ; $d015
	ld de, W_PLAYERMONMAXHP ; $d023
	ld a, [H_WHOSETURN] ; $fff3
	and a
	jp z, Func_7861
	ld hl, W_ENEMYMONCURHP ; $cfe6
	ld de, W_ENEMYMONMAXHP ; $cff4

Func_7861: ; 7861 (1:7861)
	ld bc, wHPBarOldHP+1
	ld a, [hli]
	ld [bc], a
	ld a, [hl]
	dec bc
	ld [bc], a
	ld a, [de]
	dec bc
	ld [bc], a
	inc de
	ld a, [de]
	dec bc
	ld [bc], a
	ld a, [$d0d8]
	ld b, [hl]
	add b
	ld [hld], a
	ld [wHPBarNewHP], a
	ld a, [W_DAMAGE] ; $d0d7
	ld b, [hl]
	adc b
	ld [hli], a
	ld [wHPBarNewHP+1], a
	jr c, .asm_7890
	ld a, [hld]
	ld b, a
	ld a, [de]
	dec de
	sub b
	ld a, [hli]
	ld b, a
	ld a, [de]
	inc de
	sbc b
	jr nc, .asm_789c
.asm_7890
	ld a, [de]
	ld [hld], a
	ld [wHPBarNewHP], a
	dec de
	ld a, [de]
	ld [hli], a
	ld [wHPBarNewHP+1], a
	inc de
.asm_789c
	ld a, [H_WHOSETURN] ; $fff3
	and a
	FuncCoord 10, 9 ; $c45e
	ld hl, Coord
	ld a, $1
	jr z, .asm_78aa
	FuncCoord 2, 2 ; $c3ca
	ld hl, Coord
	xor a
.asm_78aa
	ld [wListMenuID], a ; $cf94
	ld a, $48
	call Predef ; indirect jump to UpdateHPBar (fa1d (3:7a1d))
	ld a, $0
	call Predef ; indirect jump to Func_3cd60 (3cd60 (f:4d60))
	ld a, $49
	call Predef ; indirect jump to Func_3cdec (3cdec (f:4dec))
	callab ReadPlayerMonCurHPAndStatus
	ld hl, SuckedHealthText ; $78dc
	ld a, [H_WHOSETURN] ; $fff3
	and a
	ld a, [W_PLAYERMOVEEFFECT] ; $cfd3
	jr z, .asm_78d2
	ld a, [W_ENEMYMOVEEFFECT] ; $cfcd
.asm_78d2
	cp DREAM_EATER_EFFECT
	jr nz, .asm_78d9
	ld hl, DreamWasEatenText
.asm_78d9
	jp PrintText

SuckedHealthText: ; 78dc (1:78dc)
	TX_FAR _SuckedHealthText
	db "@"

DreamWasEatenText: ; 78e1 (1:78e1)
	TX_FAR _DreamWasEatenText
	db "@"
