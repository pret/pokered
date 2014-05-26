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
	ld a, [W_ENEMYMONID]
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
	ld a, [W_ENEMYMONID]
	ld [wcf91], a
	cp MAROWAK
	jr z, .isMarowak
	ld a, b
	and a
	jr z, .noSilphScope
	callab Func_3eb01
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
	callab Func_3eb01
	callab Func_708ca
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

SendOutMon: ; 58e59 (16:4e59)
	ld hl, W_ENEMYMONCURHP ; W_ENEMYMONCURHP
	ld a, [hli]
	or [hl]
	ld hl, GoText
	jr z, .printText
	xor a
	ld [H_NUMTOPRINT], a ; $ff96 (aliases: H_MULTIPLICAND)
	ld hl, W_ENEMYMONCURHP ; W_ENEMYMONCURHP
	ld a, [hli]
	ld [wcce3], a
	ld [$ff97], a
	ld a, [hl]
	ld [wcce4], a
	ld [$ff98], a
	ld a, $19
	ld [H_REMAINDER], a ; $ff99 (aliases: H_DIVISOR, H_MULTIPLIER, H_POWEROFTEN)
	call Multiply
	ld hl, W_ENEMYMONMAXHP ; W_ENEMYMONMAXHP
	ld a, [hli]
	ld b, [hl]
	srl a
	rr b
	srl a
	rr b
	ld a, b
	ld b, $4
	ld [H_REMAINDER], a ; $ff99 (aliases: H_DIVISOR, H_MULTIPLIER, H_POWEROFTEN)
	call Divide
	ld a, [$ff98]
	ld hl, GoText
	cp $46
	jr nc, .printText
	ld hl, DoItText
	cp $28
	jr nc, .printText
	ld hl, GetmText
	cp $a
	jr nc, .printText
	ld hl, EnemysWeakText
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
	ld hl, W_ENEMYMONCURHP + 1
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
	ld hl, W_ENEMYMONMAXHP
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
