GainExperience: ; 5524f (15:524f)
	ld a, [W_ISLINKBATTLE] ; W_ISLINKBATTLE
	cp $4
	ret z
	call Func_5546c
	ld hl, W_PARTYMON1_NUM ; W_PARTYMON1_NUM (aliases: W_PARTYMON1DATA)
	xor a
	ld [wWhichPokemon], a ; wWhichPokemon

Func_5525f: ; 5525f (15:525f)
	inc hl
	ld a, [hli]
	or [hl]
	jp z, Func_55436
	push hl
	ld hl, W_PLAYERMONSALIVEFLAGS
	ld a, [wWhichPokemon] ; wWhichPokemon
	ld c, a
	ld b, $2
	ld a, $10 ; FlagActionPredef
	call Predef
	ld a, c
	and a
	pop hl
	jp z, Func_55436
	ld de, $10
	add hl, de
	ld d, h
	ld e, l
	ld hl, wd002
	ld c, $5
.asm_55285
	ld a, [hli]
	ld b, a
	ld a, [de]
	add b
	ld [de], a
	jr nc, .asm_5529a
	dec de
	ld a, [de]
	inc a
	jr z, .asm_55295
	ld [de], a
	inc de
	jr .asm_5529a
.asm_55295
	ld a, $ff
	ld [de], a
	inc de
	ld [de], a
.asm_5529a
	dec c
	jr z, .asm_552a1
	inc de
	inc de
	jr .asm_55285
.asm_552a1
	xor a
	ld [H_NUMTOPRINT], a ; $ff96 (aliases: H_MULTIPLICAND)
	ld [$ff97], a
	ld a, [wd008]
	ld [$ff98], a
	ld a, [W_ENEMYMONLEVEL] ; W_ENEMYMONLEVEL
	ld [H_REMAINDER], a ; $ff99 (aliases: H_DIVISOR, H_MULTIPLIER, H_POWEROFTEN)
	call Multiply
	ld a, $7
	ld [H_REMAINDER], a ; $ff99 (aliases: H_DIVISOR, H_MULTIPLIER, H_POWEROFTEN)
	ld b, $4
	call Divide
	ld hl, $fff2
	add hl, de
	ld b, [hl]
	inc hl
	ld a, [wPlayerID] ; wPlayerID
	cp b
	jr nz, .asm_552d1
	ld b, [hl]
	ld a, [wPlayerID + 1] ; wd35a
	cp b
	ld a, $0
	jr z, .asm_552d6
.asm_552d1
	call Func_5549f
	ld a, $1
.asm_552d6
	ld [wcf4d], a
	ld a, [W_ISINBATTLE] ; W_ISINBATTLE
	dec a
	call nz, Func_5549f
	inc hl
	inc hl
	inc hl
	ld b, [hl]
	ld a, [$ff98]
	ld [wcf4c], a
	add b
	ld [hld], a
	ld b, [hl]
	ld a, [$ff97]
	ld [wcf4b], a
	adc b
	ld [hl], a
	jr nc, .asm_552f8
	dec hl
	inc [hl]
	inc hl
.asm_552f8
	inc hl
	push hl
	ld a, [wWhichPokemon] ; wWhichPokemon
	ld c, a
	ld b, $0
	ld hl, W_PARTYMON1 ; W_PARTYMON1
	add hl, bc
	ld a, [hl]
	ld [wd0b5], a
	call GetMonHeader
	ld d, MAX_LEVEL
	callab CalcExperience
	ld a, [H_NUMTOPRINT] ; $ff96 (aliases: H_MULTIPLICAND)
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
	jr c, .asm_5532e
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, d
	ld [hld], a
	dec hl
.asm_5532e
	push hl
	ld a, [wWhichPokemon] ; wWhichPokemon
	ld hl, W_PARTYMON1NAME ; W_PARTYMON1NAME
	call GetPartyMonName
	ld hl, GainedText
	call PrintText
	xor a
	ld [wcc49], a
	call LoadMonData
	pop hl
	ld bc, $13
	add hl, bc
	push hl
	callba Func_58f43
	pop hl
	ld a, [hl]
	cp d
	jp z, Func_55436
	ld a, [W_CURENEMYLVL] ; W_CURENEMYLVL
	push af
	push hl
	ld a, d
	ld [W_CURENEMYLVL], a ; W_CURENEMYLVL
	ld [hl], a
	ld bc, $ffdf
	add hl, bc
	ld a, [hl]
	ld [wd0b5], a
	ld [wd11e], a
	call GetMonHeader
	ld bc, $23
	add hl, bc
	push hl
	ld a, [hld]
	ld c, a
	ld b, [hl]
	push bc
	ld d, h
	ld e, l
	ld bc, $ffee
	add hl, bc
	ld b, $1
	call CalcStats
	pop bc
	pop hl
	ld a, [hld]
	sub c
	ld c, a
	ld a, [hl]
	sbc b
	ld b, a
	ld de, $ffe0
	add hl, de
	ld a, [hl]
	add c
	ld [hld], a
	ld a, [hl]
	adc b
	ld [hl], a
	ld a, [wPlayerMonNumber] ; wPlayerMonNumber
	ld b, a
	ld a, [wWhichPokemon] ; wWhichPokemon
	cp b
	jr nz, .asm_553f7
	ld de, W_PLAYERMONCURHP ; wd015
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ld bc, $1f
	add hl, bc
	push hl
	ld de, W_PLAYERMONLEVEL ; W_PLAYERMONLEVEL
	ld bc, $b
	call CopyData
	pop hl
	ld a, [W_PLAYERBATTSTATUS3] ; W_PLAYERBATTSTATUS3
	bit 3, a
	jr nz, .asm_553c8
	ld de, wcd0f
	ld bc, $b
	call CopyData
.asm_553c8
	xor a
	ld [wd11e], a
	callab Func_3ed99
	callab Func_3ed1a
	callab Func_3ee19
	callab Func_3cd60
	callab Func_3ee94
	call SaveScreenTilesToBuffer1
.asm_553f7
	ld hl, GrewLevelText
	call PrintText
	xor a
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
	ld a, $1a
	call Predef ; indirect jump to Func_3af5b (3af5b (e:6f5b))
	ld hl, wccd3
	ld a, [wWhichPokemon] ; wWhichPokemon
	ld c, a
	ld b, $1
	ld a, $10 ; FlagActionPredef
	call Predef
	pop hl
	pop af
	ld [W_CURENEMYLVL], a ; W_CURENEMYLVL

Func_55436: ; 55436 (15:5436)
	ld a, [W_NUMINPARTY] ; W_NUMINPARTY
	ld b, a
	ld a, [wWhichPokemon] ; wWhichPokemon
	inc a
	cp b
	jr z, .asm_55450
	ld [wWhichPokemon], a ; wWhichPokemon
	ld bc, $2c
	ld hl, W_PARTYMON1_NUM ; W_PARTYMON1_NUM (aliases: W_PARTYMON1DATA)
	call AddNTimes
	jp Func_5525f
.asm_55450
	ld hl, W_PLAYERMONSALIVEFLAGS
	xor a
	ld [hl], a
	ld a, [wPlayerMonNumber] ; wPlayerMonNumber
	ld c, a
	ld b, $1
	push bc
	ld a, $10 ; FlagActionPredef
	call Predef
	ld hl, wccf5
	xor a
	ld [hl], a
	pop bc
	ld a, $10 ; FlagActionPredef
	jp Predef

Func_5546c: ; 5546c (15:546c)
	ld a, [W_PLAYERMONSALIVEFLAGS]
	ld b, a
	xor a
	ld c, $8
	ld d, $0
.asm_55475
	xor a
	srl b
	adc d
	ld d, a
	dec c
	jr nz, .asm_55475
	cp $2
	ret c
	ld [wd11e], a
	ld hl, wd002
	ld c, $7
.asm_55488
	xor a
	ld [H_DIVIDEND], a ; $ff95 (aliases: H_PRODUCT, H_PASTLEADINGZEROES, H_QUOTIENT)
	ld a, [hl]
	ld [H_NUMTOPRINT], a ; $ff96 (aliases: H_MULTIPLICAND)
	ld a, [wd11e]
	ld [H_REMAINDER], a ; $ff99 (aliases: H_DIVISOR, H_MULTIPLIER, H_POWEROFTEN)
	ld b, $2
	call Divide
	ld a, [$ff98]
	ld [hli], a
	dec c
	jr nz, .asm_55488
	ret

Func_5549f: ; 5549f (15:549f)
	ld a, [$ff97]
	ld b, a
	ld a, [$ff98]
	ld c, a
	srl b
	rr c
	add c
	ld [$ff98], a
	ld a, [$ff97]
	adc b
	ld [$ff97], a
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
