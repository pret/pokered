DrainHPEffect_:
	ld hl, wDamage
	ld a, [hl]
	srl a ; divide damage by 2
	ld [hli], a
	ld a, [hl]
	rr a
	ld [hld], a
	or [hl] ; is damage 0?
	jr nz, .getAttackerHP
; if damage is 0, increase to 1 so that the attacker gains at least 1 HP
	inc hl
	inc [hl]
.getAttackerHP
	ld hl, wBattleMonHP
	ld de, wBattleMonMaxHP
	ldh a, [hWhoseTurn]
	and a
	jp z, .addDamageToAttackerHP
	ld hl, wEnemyMonHP
	ld de, wEnemyMonMaxHP
.addDamageToAttackerHP
	ld bc, wHPBarOldHP+1
; copy current HP to wHPBarOldHP
	ld a, [hli]
	ld [bc], a
	ld a, [hl]
	dec bc
	ld [bc], a
; copy max HP to wHPBarMaxHP
	ld a, [de]
	dec bc
	ld [bc], a
	inc de
	ld a, [de]
	dec bc
	ld [bc], a
; add damage to attacker's HP and copy new HP to wHPBarNewHP
	ld a, [wDamage + 1]
	ld b, [hl]
	add b
	ld [hld], a
	ld [wHPBarNewHP], a
	ld a, [wDamage]
	ld b, [hl]
	adc b
	ld [hli], a
	ld [wHPBarNewHP+1], a
	jr c, .capToMaxHP ; if HP > 65,535, cap to max HP
; compare HP with max HP
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
	jr nc, .next
.capToMaxHP
	ld a, [de]
	ld [hld], a
	ld [wHPBarNewHP], a
	dec de
	ld a, [de]
	ld [hli], a
	ld [wHPBarNewHP+1], a
	inc de
.next
	ldh a, [hWhoseTurn]
	and a
	hlcoord 10, 9
	ld a, $1
	jr z, .next2
	hlcoord 2, 2
	xor a
.next2
	ld [wHPBarType], a
	predef UpdateHPBar2
	predef DrawPlayerHUDAndHPBar
	predef DrawEnemyHUDAndHPBar
	callfar ReadPlayerMonCurHPAndStatus
	ld hl, SuckedHealthText
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveEffect]
	jr z, .next3
	ld a, [wEnemyMoveEffect]
.next3
	cp DREAM_EATER_EFFECT
	jr nz, .printText
	ld hl, DreamWasEatenText
.printText
	jp PrintText

SuckedHealthText:
	text_far _SuckedHealthText
	text_end

DreamWasEatenText:
	text_far _DreamWasEatenText
	text_end
