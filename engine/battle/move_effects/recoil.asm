RecoilEffect_:
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveNum]
	ld hl, wBattleMonMaxHP
	jr z, .recoilEffect
	ld a, [wEnemyMoveNum]
	ld hl, wEnemyMonMaxHP
.recoilEffect
	ld d, a
	ld a, [wDamage]
	ld b, a
	ld a, [wDamage + 1]
	ld c, a
	srl b
	rr c
	ld a, d
	cp STRUGGLE ; struggle deals 50% recoil damage
	jr z, .gotRecoilDamage
	srl b
	rr c
.gotRecoilDamage
	ld a, b
	or c
	jr nz, .updateHP
	inc c ; minimum recoil damage is 1
.updateHP
; subtract HP from user due to the recoil damage
	ld a, [hli]
	ld [wHPBarMaxHP+1], a
	ld a, [hl]
	ld [wHPBarMaxHP], a
	push bc
	ld bc, wBattleMonHP - wBattleMonMaxHP
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
	jr nc, .getHPBarCoords
; if recoil damage is higher than the Pokemon's HP, set its HP to 0
	xor a
	ld [hli], a
	ld [hl], a
	ld hl, wHPBarNewHP
	ld [hli], a
	ld [hl], a
.getHPBarCoords
	hlcoord 10, 9
	ldh a, [hWhoseTurn]
	and a
	ld a, $1
	jr z, .updateHPBar
	hlcoord 2, 2
	xor a
.updateHPBar
	ld [wHPBarType], a
	predef UpdateHPBar2
	ld hl, HitWithRecoilText
	jp PrintText
HitWithRecoilText:
	text_far _HitWithRecoilText
	text_end
