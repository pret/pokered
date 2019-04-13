PrintBeginningBattleText:
	ld a, [wIsInBattle]
	dec a
	jr nz, .trainerBattle
	ld a, [wCurMap]
	cp POKEMON_TOWER_3F
	jr c, .notPokemonTower
	cp MR_FUJIS_HOUSE
	jr c, .pokemonTower
.notPokemonTower
	ld a, [wEnemyMonSpecies2]
	call PlayCry
	ld hl, WildMonAppearedText
	ld a, [wMoveMissed]
	and a
	jr z, .notFishing
	ld hl, HookedMonAttackedText
.notFishing
	jr .wildBattle
.trainerBattle
	call .playSFX
	ld c, 20
	call DelayFrames
	ld hl, TrainerWantsToFightText
.wildBattle
	push hl
	callab DrawAllPokeballs
	pop hl
	call PrintText
	jr .done
.pokemonTower
	ld b, SILPH_SCOPE
	call IsItemInBag
	ld a, [wEnemyMonSpecies2]
	ld [wcf91], a
	cp MAROWAK
	jr z, .isMarowak
	ld a, b
	and a
	jr z, .noSilphScope
	callab LoadEnemyMonData
	jr .notPokemonTower
.noSilphScope
	ld hl, EnemyAppearedText
	call PrintText
	ld hl, GhostCantBeIDdText
	call PrintText
	jr .done
.isMarowak
	ld a, b
	and a
	jr z, .noSilphScope
	ld hl, EnemyAppearedText
	call PrintText
	ld hl, UnveiledGhostText
	call PrintText
	callab LoadEnemyMonData
	callab MarowakAnim
	ld hl, WildMonAppearedText
	call PrintText

.playSFX
	xor a
	ld [wFrequencyModifier], a
	ld a, $80
	ld [wTempoModifier], a
	ld a, SFX_SILPH_SCOPE
	call PlaySound
	jp WaitForSoundToFinish
.done
	ret

WildMonAppearedText:
	TX_FAR _WildMonAppearedText
	db "@"

HookedMonAttackedText:
	TX_FAR _HookedMonAttackedText
	db "@"

EnemyAppearedText:
	TX_FAR _EnemyAppearedText
	db "@"

TrainerWantsToFightText:
	TX_FAR _TrainerWantsToFightText
	db "@"

UnveiledGhostText:
	TX_FAR _UnveiledGhostText
	db "@"

GhostCantBeIDdText:
	TX_FAR _GhostCantBeIDdText
	db "@"

PrintSendOutMonMessage:
	ld hl, wEnemyMonHP
	ld a, [hli]
	or [hl]
	ld hl, GoText
	jr z, .printText
	xor a
	ld [H_MULTIPLICAND], a
	ld hl, wEnemyMonHP
	ld a, [hli]
	ld [wLastSwitchInEnemyMonHP], a
	ld [H_MULTIPLICAND + 1], a
	ld a, [hl]
	ld [wLastSwitchInEnemyMonHP + 1], a
	ld [H_MULTIPLICAND + 2], a
	ld a, 25
	ld [H_MULTIPLIER], a
	call Multiply
	ld hl, wEnemyMonMaxHP
	ld a, [hli]
	ld b, [hl]
	srl a
	rr b
	srl a
	rr b
	ld a, b
	ld b, 4
	ld [H_DIVISOR], a ; enemy mon max HP divided by 4
	call Divide
	ld a, [H_QUOTIENT + 3] ; a = (enemy mon current HP * 25) / (enemy max HP / 4); this approximates the current percentage of max HP
	ld hl, GoText ; 70% or greater
	cp 70
	jr nc, .printText
	ld hl, DoItText ; 40% - 69%
	cp 40
	jr nc, .printText
	ld hl, GetmText ; 10% - 39%
	cp 10
	jr nc, .printText
	ld hl, EnemysWeakText ; 0% - 9%
.printText
	jp PrintText

GoText:
	TX_FAR _GoText
	TX_ASM
	jr PrintPlayerMon1Text

DoItText:
	TX_FAR _DoItText
	TX_ASM
	jr PrintPlayerMon1Text

GetmText:
	TX_FAR _GetmText
	TX_ASM
	jr PrintPlayerMon1Text

EnemysWeakText:
	TX_FAR _EnemysWeakText
	TX_ASM

PrintPlayerMon1Text:
	ld hl, PlayerMon1Text
	ret

PlayerMon1Text:
	TX_FAR _PlayerMon1Text
	db "@"

RetreatMon:
	ld hl, PlayerMon2Text
	jp PrintText

PlayerMon2Text:
	TX_FAR _PlayerMon2Text
	TX_ASM
	push de
	push bc
	ld hl, wEnemyMonHP + 1
	ld de, wLastSwitchInEnemyMonHP + 1
	ld b, [hl]
	dec hl
	ld a, [de]
	sub b
	ld [H_MULTIPLICAND + 2], a
	dec de
	ld b, [hl]
	ld a, [de]
	sbc b
	ld [H_MULTIPLICAND + 1], a
	ld a, 25
	ld [H_MULTIPLIER], a
	call Multiply
	ld hl, wEnemyMonMaxHP
	ld a, [hli]
	ld b, [hl]
	srl a
	rr b
	srl a
	rr b
	ld a, b
	ld b, 4
	ld [H_DIVISOR], a
	call Divide
	pop bc
	pop de
	ld a, [H_QUOTIENT + 3] ; a = ((LastSwitchInEnemyMonHP - CurrentEnemyMonHP) / 25) / (EnemyMonMaxHP / 4)
; Assuming that the enemy mon hasn't gained HP since the last switch in,
; a approximates the percentage that the enemy mon's total HP has decreased
; since the last switch in.
; If the enemy mon has gained HP, then a is garbage due to wrap-around and
; can fall in any of the ranges below.
	ld hl, EnoughText ; HP stayed the same
	and a
	ret z
	ld hl, ComeBackText ; HP went down 1% - 29%
	cp 30
	ret c
	ld hl, OKExclamationText ; HP went down 30% - 69%
	cp 70
	ret c
	ld hl, GoodText ; HP went down 70% or more
	ret

EnoughText:
	TX_FAR _EnoughText
	TX_ASM
	jr PrintComeBackText

OKExclamationText:
	TX_FAR _OKExclamationText
	TX_ASM
	jr PrintComeBackText

GoodText:
	TX_FAR _GoodText
	TX_ASM
	jr PrintComeBackText

PrintComeBackText:
	ld hl, ComeBackText
	ret

ComeBackText:
	TX_FAR _ComeBackText
	db "@"
