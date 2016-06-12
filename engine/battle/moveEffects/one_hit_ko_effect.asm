OneHitKOEffect_:
	ld hl, wDamage
	xor a
	ld [hli], a
	ld [hl], a ; set the damage output to zero
	dec a
	ld [wCriticalHitOrOHKO], a
	ld hl, wBattleMonSpeed + 1
	ld de, wEnemyMonSpeed + 1
	ld a, [H_WHOSETURN]
	and a
	jr z, .compareSpeed
	ld hl, wEnemyMonSpeed + 1
	ld de, wBattleMonSpeed + 1
.compareSpeed
; set damage to 65535 and OHKO flag is the user's current speed is higher than the target's
	ld a, [de]
	dec de
	ld b, a
	ld a, [hld]
	sub b
	ld a, [de]
	ld b, a
	ld a, [hl]
	sbc b
	jr c, .userIsSlower
	ld hl, wDamage
	ld a, $ff
	ld [hli], a
	ld [hl], a
	ld a, $2
	ld [wCriticalHitOrOHKO], a
	ret
.userIsSlower
; keep damage at 0 and set move missed flag if target's current speed is higher instead
	ld a, $1
	ld [wMoveMissed], a
	ret
