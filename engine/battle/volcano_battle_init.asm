VolcanoBattleInit::
	ld a, [wCurMapTileset]
	cp VOLCANO
	ret nz
	; in the volcano, the player pokemon is burned if it's not FIRE, GROUND or ROCK
	ld a, [wBattleMonType1]
	cp FIRE
	ret z
	cp GROUND
	ret z
	cp ROCK
	ret z
	ld a, [wBattleMonType2]
	cp FIRE
	ret z
	cp GROUND
	ret z
	cp ROCK
	ret z
	ld a, [wBattleMonStatus]
	and a
	ret nz ; don't do anything if already has a status
	ld hl, .volcanoTooHot
	rst _PrintText
	ldh a, [hWhoseTurn]
	push af
	ld a, 1
	ldh [hWhoseTurn], a ; force enemy turn so player's stats are lowered
	ld de, wBattleMonStatus
	callfar AutoBurnEffect
	pop af
	ldh [hWhoseTurn], a
	ret
.volcanoTooHot
	text_far _VolcanoBattleBurnText
	text_end

VolcanoInitMagmarBattle::
	ld a, [wCurMapTileset]
	cp VOLCANO
	ret nz
	CheckEitherEventSet EVENT_BATTLING_VOLCANO_MAGMAR, EVENT_BATTLING_MOLTRES
	ret z ; returns if neither set
	; magmar gets buffs when the battle starts for a little bit more interesting battle
	ld hl, .poweredUp
	rst _PrintText
	ldh a, [hWhoseTurn]
	push af
	xor a
	ld [wAnimationType], a
	inc a
	ldh [hWhoseTurn], a
	ld a, FIRE_PILLAR_ANIM
	ld [wAnimationID], a
	callfar PlayBattleAnimationGotID
	SetFlag FLAG_SKIP_STAT_ANIMATION
	ld a, 3 ; make it really hard to catch so you can't just catch the pokemon to proceed
	ld [wEnemyMonActualCatchRate], a
	; max out its special and defense
	ld a, MAX_STAT_LEVEL - 2
	ld [wEnemyMonSpecialMod], a
	ld a, SPECIAL_UP2_EFFECT
	ld [wEnemyMoveEffect], a
	callfar StatModifierUpEffect
	ld a, MAX_STAT_LEVEL - 2
	ld [wEnemyMonDefenseMod], a
	ld a, DEFENSE_UP2_EFFECT
	ld [wEnemyMoveEffect], a
	callfar StatModifierUpEffect
	ResetFlag FLAG_SKIP_STAT_ANIMATION
	pop af
	ldh [hWhoseTurn], a
	ret	
.poweredUp
	text_far _MagmarBattleInit
	text_end