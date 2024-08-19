; Certain moves get better accuracy, power, or other effects when used by specific pokemon

CheckRemapMoveData::
	call GetMoveRemapData
	push de
	ld hl, RemappableMoves
	ld de, 4
	call IsInArray
	pop de
	ret nc
	inc hl
	ld a, [hl]
	cp -1
	jr z, .donePokemonCheck
	ld a, d
	cp [hl]
	ret nz
.donePokemonCheck
	inc hl
	ld a, [hl]
	cp -2
	jr z, .modifierFunction
	call GetMoveRemapData2
	ld a, [hli]
	cp -1
	jr z, .donePowerCheck
	ld [bc], a
.donePowerCheck
	ld a, [hli]
	and a
	ret z ; no accuracy change
	ld [de], a
	ret
.modifierFunction
	inc hl
	ld a, [hl]
	ld hl, ModifierFuncs
	call GetAddressFromPointerArray
	jp hl

GetMoveRemapData:
	ldh a, [hWhoseTurn]
	and a
	ld a, [wBattleMonSpecies]
	ld d, a
	ld a, [wBattleMonLevel]
	ld e, a
	ld a, [wPlayerMoveNum]
	ret z
	ld a, [wEnemyMonSpecies]
	ld d, a
	ld a, [wEnemyMonLevel]
	ld e, a
	ld a, [wEnemyMoveNum]
	ret

GetMoveRemapData2:
	ldh a, [hWhoseTurn]
	and a
	ld bc, wPlayerMovePower
	ld de, wPlayerMoveAccuracy
	ret z
	ld bc, wEnemyMovePower
	ld de, wEnemyMoveAccuracy
	ret

; byte 1 = move
; byet 2 = required pokemon for modifier or -1 for any pokemon
; byte 4 = modified power or -1 if no change or -2 if the move uses a modifier function
; byte 3 = modified accuracy or 0 if no accuracy change, or which modifier function to use if previous byte was -2
RemappableMoves::
	db SING, -1, -2, 1
	db DOUBLESLAP, -1, -2, 0
	db POISON_STING, BEEDRILL, 45, 0
	db TWINEEDLE, BEEDRILL, 65, 0 
	db DRILL_PECK, FEAROW, 110, 0
	db ROCK_SLIDE, GOLEM, 110, 0
	db HI_JUMP_KICK, HITMONLEE, 160, 0
	db COMET_PUNCH, HITMONCHAN, 90, 0
	db THUNDERPUNCH, ELECTABUZZ, 105, 0
	db FIRE_PUNCH, MAGMAR, 105, 0
	db ICE_PUNCH, JYNX, 105, 0
	db HYPNOSIS, HYPNO, -1, 85 percent
	db DRAGON_RAGE, DRAGONITE, 100, 0
	db WATERFALL, SEAKING, 160, 0
	db DIZZY_PUNCH, KANGASKHAN, 130, 0
	db LICK, LICKITUNG, 70, 0
	db SPIKE_CANNON, OMASTAR, 80, 0
	db -1

ModifierFuncs:
	dw DoubleSlapModifier
	dw SingModifier

CheckIfAsleep::
	ldh a, [hWhoseTurn]
	and a
	ld bc, wEnemyMonStatus
	ld hl, wPlayerMovePower
	jr z, .gotStatus
	ld bc, wBattleMonStatus
	ld hl, wEnemyMovePower
.gotStatus
	ld a, [bc]
	and SLP_MASK
	ret

DoubleSlapModifier::
	call CheckIfAsleep
	ret z
	ld a, [hl]
	sla a
	ld [hl], a ; double doubleslap's power when opponent is asleep
	ret

DoubleSlapModifierPart2::
	call CheckIfAsleep
	ret z
	ld a, [bc]
	and %11111000
	inc a
	ld [bc], a ; 1 turn of sleep left now (needs to be applied separately by the effect so it only triggers if the attack hits)
	ret

SingModifier::
	call GetMoveRemapData
	ld a, d
	cp WIGGLYTUFF
	jr z, .checkLevel
	cp JIGGLYPUFF
	jr z, .checkLevel
	ret
.checkLevel
	ld a, e
	cp 20
	ret c
	call GetMoveRemapData2
	ld a, 85 percent
	ld [de], a ; sing gets 85% accuracy for jigglypuff/wigglytuff if they're past level 20
	ret


