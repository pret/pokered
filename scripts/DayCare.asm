DayCareMScript: ; 5624f (15:624f)
	jp EnableAutoTextBoxDrawing

DayCareMTextPointers: ; 56252 (15:6252)
	dw DayCareMText1

DayCareMText1: ; 56254 (15:6254)
	db $8
	call SaveScreenTilesToBuffer2
	ld a, [W_DAYCARE_IN_USE]
	and a
	jp nz, Func_562e1
	ld hl, UnnamedText_5640f
	call PrintText
	call YesNoChoice
	ld a, [$cc26]
	and a
	ld hl, UnnamedText_5643b
	jp nz, Func_56409
	ld a, [$d163]
	dec a
	ld hl, UnnamedText_56445
	jp z, Func_56409
	ld hl, UnnamedText_56414
	call PrintText
	xor a
	ld [$cfcb], a
	ld [$d07d], a
	ld [$cc35], a
	call DisplayPartyMenu
	push af
	call GBPalWhiteOutWithDelay3
	call Func_3dbe
	call LoadGBPal
	pop af
	ld hl, UnnamedText_56437
	jp c, Func_56409
	ld hl, Func_2171b
	ld b, BANK(Func_2171b)
	call Bankswitch
	ld hl, UnnamedText_5644a
	jp c, Func_56409
	xor a
	ld [$cc2b], a
	ld a, [wWhichPokemon]
	ld hl, $d2b5
	call GetPartyMonName
	ld hl, UnnamedText_56419
	call PrintText
	ld a, $1
	ld [W_DAYCARE_IN_USE], a
	ld a, $3
	ld [$cf95], a
	call Func_3a68
	xor a
	ld [$cf95], a
	call RemovePokemon
	ld a, [$cf91]
	call PlayCry
	ld hl, UnnamedText_5641e
	jp Func_56409

Func_562e1: ; 562e1 (15:62e1)
	xor a
	ld hl, W_DAYCAREMONNAME
	call GetPartyMonName
	ld a, $3
	ld [$cc49], a
	call LoadMonData
	ld hl, Func_58f43
	ld b, BANK(Func_58f43)
	call Bankswitch
	ld a, d
	cp $64
	jr c, .asm_56315
	ld d, $64
	ld hl, CalcExperience
	ld b, BANK(CalcExperience)
	call Bankswitch
	ld hl, $da6d
	ld a, [H_NUMTOPRINT]
	ld [hli], a
	ld a, [$ff97]
	ld [hli], a
	ld a, [$ff98]
	ld [hl], a
	ld d, $64

.asm_56315
	xor a
	ld [wTrainerEngageDistance], a
	ld hl, $da62
	ld a, [hl]
	ld [wTrainerSpriteOffset], a
	cp d
	ld [hl], d
	ld hl, UnnamedText_56432
	jr z, .asm_56333
	ld a, [wTrainerSpriteOffset]
	ld b, a
	ld a, d
	sub b
	ld [wTrainerEngageDistance], a
	ld hl, UnnamedText_56423

.asm_56333
	call PrintText
	ld a, [W_NUMINPARTY]
	cp $6
	ld hl, UnnamedText_56440
	jp z, .asm_56403
	ld de, wTrainerFacingDirection
	xor a
	ld [de], a
	inc de
	ld [de], a
	ld hl, wTrainerScreenX
	ld a, $1
	ld [hli], a
	ld [hl], $0
	ld a, [wTrainerEngageDistance]
	inc a
	ld b, a
	ld c, $2
.asm_56357
	push hl
	push de
	push bc
	ld a, $b
	call Predef
	pop bc
	pop de
	pop hl
	dec b
	jr nz, .asm_56357
	ld hl, UnnamedText_56428
	call PrintText
	ld a, $13
	ld [$d125], a
	call DisplayTextBoxID
	call YesNoChoice
	ld hl, UnnamedText_56437
	ld a, [wCurrentMenuItem]
	and a
	jp nz, .asm_56403
	ld hl, wTrainerFacingDirection
	ld [$ff9f], a
	ld a, [hli]
	ld [$ffa0], a
	ld a, [hl]
	ld [$ffa1], a
	call HasEnoughMoney
	jr nc, .asm_56396
	ld hl, UnnamedText_56454
	jp .asm_56403

.asm_56396
	xor a
	ld [W_DAYCARE_IN_USE], a
	ld hl, wTrainerEngageDistance
	ld [hli], a
	inc hl
	ld de, $d349
	ld c, $3
	ld a, $c
	call Predef
	ld a, $b2
	call PlaySoundWaitForCurrent
	ld a, $13
	ld [$d125], a
	call DisplayTextBoxID
	ld hl, UnnamedText_5644f
	call PrintText
	ld a, $2
	ld [$cf95], a
	call Func_3a68
	ld a, [W_DAYCAREMONDATA]
	ld [$cf91], a
	ld a, [W_NUMINPARTY]
	dec a
	push af
	ld bc, $002c
	push bc
	ld hl, W_PARTYMON1_MOVE1
	call AddNTimes
	ld d, h
	ld e, l
	ld a, $1
	ld [wHPBarMaxHP], a
	ld a, $3e
	call Predef
	pop bc
	pop af
	ld hl, W_PARTYMON1_HP
	call AddNTimes
	ld d, h
	ld e, l
	ld bc, $0021
	add hl, bc
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ld a, [$cf91]
	call PlayCry
	ld hl, UnnamedText_5642d
	jr Func_56409

.asm_56403
	ld a, [wTrainerSpriteOffset]
	ld [$da62], a

Func_56409: ; 56409 (15:6409)
	call PrintText
	jp TextScriptEnd

UnnamedText_5640f: ; 5640f (15:640f)
	TX_FAR _UnnamedText_5640f
	db "@"

UnnamedText_56414: ; 56414 (15:6414)
	TX_FAR _UnnamedText_56414
	db "@"

UnnamedText_56419: ; 56419 (15:6419)
	TX_FAR _UnnamedText_56419
	db "@"

UnnamedText_5641e: ; 5641e (15:641e)
	TX_FAR _UnnamedText_5641e
	db "@"

UnnamedText_56423: ; 56423 (15:6423)
	TX_FAR _UnnamedText_56423
	db "@"

UnnamedText_56428: ; 56428 (15:6428)
	TX_FAR _UnnamedText_56428
	db "@"

UnnamedText_5642d: ; 5642d (15:642d)
	TX_FAR _UnnamedText_5642d
	db "@"

UnnamedText_56432: ; 56432 (15:6432)
	TX_FAR _UnnamedText_56432
	db "@"

UnnamedText_56437: ; 56437 (15:6437)
	TX_FAR _UnnamedText_56437 ; 0x8c000
UnnamedText_5643b: ; 5643b (15:643b)
	TX_FAR _UnnamedText_5643b ; 0x8c013
	db "@"

UnnamedText_56440: ; 56440 (15:6440)
	TX_FAR _UnnamedText_56440
	db "@"

UnnamedText_56445: ; 56445 (15:6445)
	TX_FAR _UnnamedText_56445
	db "@"

UnnamedText_5644a: ; 5644a (15:644a)
	TX_FAR _UnnamedText_5644a
	db "@"

UnnamedText_5644f: ; 5644f (15:644f)
	TX_FAR _UnnamedText_5644f
	db "@"

UnnamedText_56454: ; 56454 (15:6454)
	TX_FAR _UnnamedText_56454
	db "@"
	
