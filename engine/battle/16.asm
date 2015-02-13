PrintBeginningBattleText: ; 58d99 (16:4d99)
	ld a, [W_ISINBATTLE] ; W_ISINBATTLE
	dec a
	jr nz, .trainerBattle
	ld a, [W_CURMAP] ; W_CURMAP
	cp POKEMONTOWER_3
	jr c, .notPokemonTower
	cp LAVENDER_HOUSE_1
	jr c, .pokemonTower
.notPokemonTower
	ld a, [wEnemyMonSpecies2]
	call PlayCry
	ld hl, WildMonAppearedText
	ld a, [W_MOVEMISSED] ; W_MOVEMISSED
	and a
	jr z, .notFishing
	ld hl, HookedMonAttackedText
.notFishing
	jr .wildBattle
.trainerBattle
	call .playSFX
	ld c, $14
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
	ld [wc0f1], a
	ld a, $80
	ld [wc0f2], a
	ld a, (SFX_08_77 - SFX_Headers_08) / 3
	call PlaySound
	jp WaitForSoundToFinish
.done
	ret

WildMonAppearedText: ; 58e3b (16:4e3b)
	TX_FAR _WildMonAppearedText
	db "@"

HookedMonAttackedText: ; 58e40 (16:4e40)
	TX_FAR _HookedMonAttackedText
	db "@"

EnemyAppearedText: ; 58e45 (16:4e45)
	TX_FAR _EnemyAppearedText
	db "@"

TrainerWantsToFightText: ; 58e4a (16:4e4a)
	TX_FAR _TrainerWantsToFightText
	db "@"

UnveiledGhostText: ; 58e4f (16:4e4f)
	TX_FAR _UnveiledGhostText
	db "@"

GhostCantBeIDdText: ; 58e54 (16:4e54)
	TX_FAR _GhostCantBeIDdText
	db "@"

PrintSendOutMonMessage: ; 58e59 (16:4e59)
	ld hl, wEnemyMonHP
	ld a, [hli]
	or [hl]
	ld hl, GoText
	jr z, .printText
	xor a
	ld [H_MULTIPLICAND], a
	ld hl, wEnemyMonHP
	ld a, [hli]
	ld [wcce3], a
	ld [H_MULTIPLICAND + 1], a
	ld a, [hl]
	ld [wcce4], a
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
	ld b, $4
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

GoText: ; 58eae (16:4eae)
	TX_FAR _GoText
	db $08 ; asm
	jr PrintPlayerMon1Text

DoItText: ; 58eb5 (16:4eb5)
	TX_FAR _DoItText
	db $08 ; asm
	jr PrintPlayerMon1Text

GetmText: ; 58ebc (16:4ebc)
	TX_FAR _GetmText
	db $08 ; asm
	jr PrintPlayerMon1Text

EnemysWeakText: ; 58ec3 (16:4ec3)
	TX_FAR _EnemysWeakText
	db $08 ; asm

PrintPlayerMon1Text:
	ld hl, PlayerMon1Text
	ret

PlayerMon1Text: ; 58ecc (16:4ecc)
	TX_FAR _PlayerMon1Text
	db "@"

RetreatMon: ; 58ed1 (16:4ed1)
	ld hl, PlayerMon2Text
	jp PrintText

PlayerMon2Text: ; 58ed7 (16:4ed7)
	TX_FAR _PlayerMon2Text
	db $08 ; asm
	push de
	push bc
	ld hl, wEnemyMonHP + 1
	ld de, wcce4
	ld b, [hl]
	dec hl
	ld a, [de]
	sub b
	ld [$ff98], a
	dec de
	ld b, [hl]
	ld a, [de]
	sbc b
	ld [$ff97], a
	ld a, $19
	ld [H_POWEROFTEN], a
	call Multiply
	ld hl, wEnemyMonMaxHP
	ld a, [hli]
	ld b, [hl]
	srl a
	rr b
	srl a
	rr b
	ld a, b
	ld b, $4
	ld [H_POWEROFTEN], a
	call Divide
	pop bc
	pop de
	ld a, [$ff98]
	ld hl, EnoughText
	and a
	ret z
	ld hl, ComeBackText
	cp $1e
	ret c
	ld hl, OKExclamationText
	cp $46
	ret c
	ld hl, GoodText
	ret

EnoughText: ; 58f25 (16:4f25)
	TX_FAR _EnoughText
	db $08 ; asm
	jr PrintComeBackText

OKExclamationText: ; 58f2c (16:4f2c)
	TX_FAR _OKExclamationText
	db $08 ; asm
	jr PrintComeBackText

GoodText: ; 58f33 (16:4f33)
	TX_FAR _GoodText
	db $08 ; asm
	jr PrintComeBackText

PrintComeBackText: ; 58f3a (16:4f3a)
	ld hl, ComeBackText
	ret

ComeBackText: ; 58f3e (16:4f3e)
	TX_FAR _ComeBackText
	db "@"
