DisplayEffectiveness:
;;;;;; PureRGBnote: FIXED: don't display effectiveness again after the first hit of a multiple hit move.
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus1
	jr z, .gotTurn
	ld hl, wEnemyBattleStatus1
.gotTurn
	bit ATTACKING_MULTIPLE_TIMES, [hl]
	ret nz
;;;;;;
	ld a, [wDamageMultipliers]
	and $7F
	cp EFFECTIVE
	ret z
	ld hl, SuperEffectiveText
	jr nc, .done
	ld hl, NotVeryEffectiveText
.done
	jp PrintText

SuperEffectiveText:
	text_far _SuperEffectiveText
	text_end

NotVeryEffectiveText:
	text_far _NotVeryEffectiveText
	text_end
