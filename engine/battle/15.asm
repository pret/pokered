GainExperience: ; 5524f (15:524f)
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	ret z ; return if link battle
	call DivideExpDataByNumMonsGainingExp
	ld hl, wPartyMon1
	xor a
	ld [wWhichPokemon], a
.partyMonLoop ; loop over each mon and add gained exp
	inc hl
	ld a, [hli]
	or [hl] ; is mon's HP 0?
	jp z, .nextMon ; if so, go to next mon
	push hl
	ld hl, wPartyGainExpFlags
	ld a, [wWhichPokemon]
	ld c, a
	ld b, $2
	predef FlagActionPredef
	ld a, c
	and a ; is mon's gain exp flag set?
	pop hl
	jp z, .nextMon ; if mon's gain exp flag not set, go to next mon
	ld de, (wPartyMon1HPExp + 1) - (wPartyMon1HP + 1)
	add hl, de
	ld d, h
	ld e, l
	ld hl, wEnemyMonBaseStats
	ld c, $5
.gainStatExpLoop
	ld a, [hli]
	ld b, a ; enemy mon base stat
	ld a, [de] ; stat exp
	add b ; add enemy mon base state to stat exp
	ld [de], a
	jr nc, .nextBaseStat
; if there was a carry, increment the upper byte
	dec de
	ld a, [de]
	inc a
	jr z, .maxStatExp ; jump if the value overflowed
	ld [de], a
	inc de
	jr .nextBaseStat
.maxStatExp ; if the upper byte also overflowed, then we have hit the max stat exp
	ld a, $ff
	ld [de], a
	inc de
	ld [de], a
.nextBaseStat
	dec c
	jr z, .asm_552a1
	inc de
	inc de
	jr .gainStatExpLoop
.asm_552a1
	xor a
	ld [H_MULTIPLICAND], a
	ld [H_MULTIPLICAND + 1], a
	ld a, [wEnemyMonBaseExp]
	ld [H_MULTIPLICAND + 2], a
	ld a, [wEnemyMonLevel]
	ld [H_MULTIPLIER], a
	call Multiply
	ld a, 7
	ld [H_DIVISOR], a
	ld b, 4
	call Divide
	ld hl, -((wPartyMon1HPExp + 1) - wPartyMon1OTID + 4 * 2)
	add hl, de
	ld b, [hl] ; party mon OTID
	inc hl
	ld a, [wPlayerID]
	cp b
	jr nz, .tradedMon
	ld b, [hl]
	ld a, [wPlayerID + 1]
	cp b
	ld a, $0
	jr z, .next
.tradedMon
	call BoostExp ; traded mon exp boost
	ld a, $1
.next
	ld [wcf4d], a
	ld a, [W_ISINBATTLE]
	dec a ; is it a trainer battle?
	call nz, BoostExp ; if so, boost exp
	inc hl
	inc hl
	inc hl
; add the gained exp to the party mon's exp
	ld b, [hl]
	ld a, [H_QUOTIENT + 3]
	ld [wcf4c], a
	add b
	ld [hld], a
	ld b, [hl]
	ld a, [H_QUOTIENT + 2]
	ld [wcf4b], a
	adc b
	ld [hl], a
	jr nc, .noCarry
	dec hl
	inc [hl]
	inc hl
.noCarry
; calculate exp for the mon at max level, and cap the exp at that value
	inc hl
	push hl
	ld a, [wWhichPokemon]
	ld c, a
	ld b, 0
	ld hl, wPartySpecies
	add hl, bc
	ld a, [hl] ; species
	ld [wd0b5], a
	call GetMonHeader
	ld d, MAX_LEVEL
	callab CalcExperience ; get max exp
; compare max exp with current exp
	ld a, [$ff96]
	ld b, a
	ld a, [$ff97]
	ld c, a
	ld a, [$ff98]
	ld d, a
	pop hl
	ld a, [hld]
	sub d
	ld a, [hld]
	sbc c
	ld a, [hl]
	sbc b
	jr c, .next2
; the mon's exp is greater than the max exp, so overwrite it with the max exp
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, d
	ld [hld], a
	dec hl
.next2
	push hl
	ld a, [wWhichPokemon]
	ld hl, wPartyMonNicks
	call GetPartyMonName
	ld hl, GainedText
	call PrintText
	xor a ; party mon data
	ld [wcc49], a
	call LoadMonData
	pop hl
	ld bc, wPartyMon1Level - wPartyMon1Exp
	add hl, bc
	push hl
	callba CalcLevelFromExperience
	pop hl
	ld a, [hl] ; current level
	cp d
	jp z, .nextMon ; if level didn't change, go to next mon
	ld a, [W_CURENEMYLVL]
	push af
	push hl
	ld a, d
	ld [W_CURENEMYLVL], a
	ld [hl], a
	ld bc, wPartyMon1Species - wPartyMon1Level
	add hl, bc
	ld a, [hl] ; species
	ld [wd0b5], a
	ld [wd11e], a
	call GetMonHeader
	ld bc, (wPartyMon1MaxHP + 1) - wPartyMon1Species
	add hl, bc
	push hl
	ld a, [hld]
	ld c, a
	ld b, [hl]
	push bc ; push max HP (from before levelling up)
	ld d, h
	ld e, l
	ld bc, (wPartyMon1HPExp - 1) - wPartyMon1MaxHP
	add hl, bc
	ld b, $1 ; consider stat exp when calculating stats
	call CalcStats
	pop bc ; pop max HP (from before levelling up)
	pop hl
	ld a, [hld]
	sub c
	ld c, a
	ld a, [hl]
	sbc b
	ld b, a ; bc = difference between old max HP and new max HP after levelling
	ld de, (wPartyMon1HP + 1) - wPartyMon1MaxHP
	add hl, de
; add to the current HP the amount of max HP gained when levelling
	ld a, [hl] ; wPartyMon1HP + 1
	add c
	ld [hld], a
	ld a, [hl] ; wPartyMon1HP + 1
	adc b
	ld [hl], a ; wPartyMon1HP
	ld a, [wPlayerMonNumber]
	ld b, a
	ld a, [wWhichPokemon]
	cp b ; is the current mon in battle?
	jr nz, .printGrewLevelText
; current mon is in battle
	ld de, wBattleMonHP
; copy party mon HP to battle mon HP
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
; copy other stats from party mon to battle mon
	ld bc, wPartyMon1Level - (wPartyMon1HP + 1)
	add hl, bc
	push hl
	ld de, wBattleMonLevel
	ld bc, $b ; size of stats
	call CopyData
	pop hl
	ld a, [W_PLAYERBATTSTATUS3]
	bit 3, a ; is the mon transformed?
	jr nz, .recalcStatChanges
; the mon is not transformed, so update the unmodified stats
	ld de, wPlayerMonUnmodifiedLevel
	ld bc, $b
	call CopyData
.recalcStatChanges
	xor a
	ld [wd11e], a
	callab CalculateModifiedStats
	callab ApplyBurnAndParalysisPenaltiesToPlayer
	callab ApplyBadgeStatBoosts
	callab DrawPlayerHUDAndHPBar
	callab PrintEmptyString
	call SaveScreenTilesToBuffer1
.printGrewLevelText
	ld hl, GrewLevelText
	call PrintText
	xor a ; party mon data
	ld [wcc49], a
	call LoadMonData
	ld d, $1
	callab PrintStatsBox
	call WaitForTextScrollButtonPress
	call LoadScreenTilesFromBuffer1
	xor a
	ld [wcc49], a
	ld a, [wd0b5]
	ld [wd11e], a
	predef LearnMoveFromLevelUp
	ld hl, wccd3
	ld a, [wWhichPokemon]
	ld c, a
	ld b, $1
	predef FlagActionPredef
	pop hl
	pop af
	ld [W_CURENEMYLVL], a

.nextMon
	ld a, [wPartyCount]
	ld b, a
	ld a, [wWhichPokemon]
	inc a
	cp b
	jr z, .done
	ld [wWhichPokemon], a
	ld bc, wPartyMon2 - wPartyMon1
	ld hl, wPartyMon1
	call AddNTimes
	jp .partyMonLoop
.done
	ld hl, wPartyGainExpFlags
	xor a
	ld [hl], a ; clear gain exp flags
	ld a, [wPlayerMonNumber]
	ld c, a
	ld b, $1
	push bc
	predef FlagActionPredef ; set the gain exp flag for the mon that is currently out
	ld hl, wPartyFoughtCurrentEnemyFlags
	xor a
	ld [hl], a
	pop bc
	predef_jump FlagActionPredef ; set the fought current enemy flag for the mon that is currently out

; divide enemy base stats, catch rate, and base exp by the number of mons gaining exp
DivideExpDataByNumMonsGainingExp: ; 5546c (15:546c)
	ld a, [wPartyGainExpFlags]
	ld b, a
	xor a
	ld c, $8
	ld d, $0
.countSetBitsLoop ; loop to count set bits in wPartyGainExpFlags
	xor a
	srl b
	adc d
	ld d, a
	dec c
	jr nz, .countSetBitsLoop
	cp $2
	ret c ; return if only one mon is gaining exp
	ld [wd11e], a ; store number of mons gaining exp
	ld hl, wEnemyMonBaseStats
	ld c, $7
.divideLoop
	xor a
	ld [H_DIVIDEND], a
	ld a, [hl]
	ld [H_DIVIDEND + 1], a
	ld a, [wd11e]
	ld [H_DIVISOR], a
	ld b, $2
	call Divide ; divide value by number of mons gaining exp
	ld a, [H_QUOTIENT + 3]
	ld [hli], a
	dec c
	jr nz, .divideLoop
	ret

; multiplies exp by 1.5
BoostExp: ; 5549f (15:549f)
	ld a, [H_QUOTIENT + 2]
	ld b, a
	ld a, [H_QUOTIENT + 3]
	ld c, a
	srl b
	rr c
	add c
	ld [H_QUOTIENT + 3], a
	ld a, [H_QUOTIENT + 2]
	adc b
	ld [H_QUOTIENT + 2], a
	ret

GainedText: ; 554b2 (15:54b2)
	TX_FAR _GainedText
	db $08 ; asm
	ld a, [wcc5b]
	ld hl, WithExpAllText
	and a
	ret nz
	ld hl, ExpPointsText
	ld a, [wcf4d]
	and a
	ret z
	ld hl, BoostedText
	ret

WithExpAllText: ; 554cb (15:54cb)
	TX_FAR _WithExpAllText
	db $08 ; asm
	ld hl, ExpPointsText
	ret

BoostedText: ; 554d4 (15:54d4)
	TX_FAR _BoostedText

ExpPointsText: ; 554d8 (15:54d8)
	TX_FAR _ExpPointsText
	db "@"

GrewLevelText: ; 554dd (15:54dd)
	TX_FAR _GrewLevelText
	db $0b
	db "@"
