DayCareMScript: ; 5624f (15:624f)
	jp EnableAutoTextBoxDrawing

DayCareMTextPointers: ; 56252 (15:6252)
	dw DayCareMText1

DayCareMText1: ; 56254 (15:6254)
	db $8
	call SaveScreenTilesToBuffer2
	ld a, [W_DAYCARE_IN_USE]
	and a
	jp nz, DayCareMScript_562e1
	ld hl, DayCareMText_5640f
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, DayCareMText_5643b
	jp nz, DayCareMScript_56409
	ld a, [wPartyCount]
	dec a
	ld hl, DayCareMText_56445
	jp z, DayCareMScript_56409
	ld hl, DayCareMText_56414
	call PrintText
	xor a
	ld [wUpdateSpritesEnabled], a
	ld [wd07d], a
	ld [wMenuItemToSwap], a
	call DisplayPartyMenu
	push af
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call LoadGBPal
	pop af
	ld hl, DayCareMText_56437
	jp c, DayCareMScript_56409
	callab Func_2171b
	ld hl, DayCareMText_5644a
	jp c, DayCareMScript_56409
	xor a
	ld [wcc2b], a
	ld a, [wWhichPokemon]
	ld hl, wPartyMonNicks
	call GetPartyMonName
	ld hl, DayCareMText_56419
	call PrintText
	ld a, $1
	ld [W_DAYCARE_IN_USE], a
	ld a, $3
	ld [wcf95], a
	call Func_3a68
	xor a
	ld [wcf95], a
	call RemovePokemon
	ld a, [wcf91]
	call PlayCry
	ld hl, DayCareMText_5641e
	jp DayCareMScript_56409

DayCareMScript_562e1: ; 562e1 (15:62e1)
	xor a
	ld hl, W_DAYCAREMONNAME
	call GetPartyMonName
	ld a, $3
	ld [wcc49], a
	call LoadMonData
	callab CalcLevelFromExperience
	ld a, d
	cp MAX_LEVEL
	jr c, .asm_56315
	ld d, MAX_LEVEL
	callab CalcExperience
	ld hl, wDayCareMonExp
	ld a, [H_NUMTOPRINT]
	ld [hli], a
	ld a, [$ff97]
	ld [hli], a
	ld a, [$ff98]
	ld [hl], a
	ld d, MAX_LEVEL

.asm_56315
	xor a
	ld [wTrainerEngageDistance], a
	ld hl, wDayCareMonBoxLevel
	ld a, [hl]
	ld [wTrainerSpriteOffset], a
	cp d
	ld [hl], d
	ld hl, DayCareMText_56432
	jr z, .asm_56333
	ld a, [wTrainerSpriteOffset]
	ld b, a
	ld a, d
	sub b
	ld [wTrainerEngageDistance], a
	ld hl, DayCareMText_56423

.asm_56333
	call PrintText
	ld a, [wPartyCount]
	cp PARTY_LENGTH
	ld hl, DayCareMText_56440
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
	predef AddBCDPredef
	pop bc
	pop de
	pop hl
	dec b
	jr nz, .asm_56357
	ld hl, DayCareMText_56428
	call PrintText
	ld a, $13
	ld [wd125], a
	call DisplayTextBoxID
	call YesNoChoice
	ld hl, DayCareMText_56437
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
	ld hl, DayCareMText_56454
	jp .asm_56403

.asm_56396
	xor a
	ld [W_DAYCARE_IN_USE], a
	ld hl, wTrainerEngageDistance
	ld [hli], a
	inc hl
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
	ld a, (SFX_02_5a - SFX_Headers_02) / 3
	call PlaySoundWaitForCurrent
	ld a, $13
	ld [wd125], a
	call DisplayTextBoxID
	ld hl, DayCareMText_5644f
	call PrintText
	ld a, $2
	ld [wcf95], a
	call Func_3a68
	ld a, [wDayCareMonSpecies]
	ld [wcf91], a
	ld a, [wPartyCount]
	dec a
	push af
	ld bc, $002c
	push bc
	ld hl, wPartyMon1Moves
	call AddNTimes
	ld d, h
	ld e, l
	ld a, $1
	ld [wHPBarMaxHP], a
	predef WriteMonMoves
	pop bc
	pop af
	ld hl, wPartyMon1HP
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
	ld a, [wcf91]
	call PlayCry
	ld hl, DayCareMText_5642d
	jr DayCareMScript_56409

.asm_56403
	ld a, [wTrainerSpriteOffset]
	ld [wDayCareMonBoxLevel], a

DayCareMScript_56409: ; 56409 (15:6409)
	call PrintText
	jp TextScriptEnd

DayCareMText_5640f: ; 5640f (15:640f)
	TX_FAR _DayCareMText_5640f
	db "@"

DayCareMText_56414: ; 56414 (15:6414)
	TX_FAR _DayCareMText_56414
	db "@"

DayCareMText_56419: ; 56419 (15:6419)
	TX_FAR _DayCareMText_56419
	db "@"

DayCareMText_5641e: ; 5641e (15:641e)
	TX_FAR _DayCareMText_5641e
	db "@"

DayCareMText_56423: ; 56423 (15:6423)
	TX_FAR _DayCareMText_56423
	db "@"

DayCareMText_56428: ; 56428 (15:6428)
	TX_FAR _DayCareMText_56428
	db "@"

DayCareMText_5642d: ; 5642d (15:642d)
	TX_FAR _DayCareMText_5642d
	db "@"

DayCareMText_56432: ; 56432 (15:6432)
	TX_FAR _DayCareMText_56432
	db "@"

DayCareMText_56437: ; 56437 (15:6437)
	TX_FAR _DayCareMText_56437 ; 0x8c000
DayCareMText_5643b: ; 5643b (15:643b)
	TX_FAR _DayCareMText_5643b ; 0x8c013
	db "@"

DayCareMText_56440: ; 56440 (15:6440)
	TX_FAR _DayCareMText_56440
	db "@"

DayCareMText_56445: ; 56445 (15:6445)
	TX_FAR _DayCareMText_56445
	db "@"

DayCareMText_5644a: ; 5644a (15:644a)
	TX_FAR _DayCareMText_5644a
	db "@"

DayCareMText_5644f: ; 5644f (15:644f)
	TX_FAR _DayCareMText_5644f
	db "@"

DayCareMText_56454: ; 56454 (15:6454)
	TX_FAR _DayCareMText_56454
	db "@"
