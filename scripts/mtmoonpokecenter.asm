MtMoonPokecenterScript: ; 492cf (12:52cf)
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

MtMoonPokecenterTextPointers: ; 492d5 (12:52d5)
	dw MtMoonPokecenterText1
	dw MtMoonPokecenterText2
	dw MtMoonPokecenterText3
	dw MtMoonPokecenterText4
	dw MtMoonPokecenterText5
	dw MtMoonPokecenterText6

MtMoonPokecenterText1: ; 492e1 (12:52e1)
	db $ff

MtMoonPokecenterText2: ; 492e2 (12:52e2)
	TX_FAR _MtMoonPokecenterText1
	db "@"

MtMoonPokecenterText3: ; 492e7 (12:52e7)
	TX_FAR _MtMoonPokecenterText3
	db "@"

MtMoonPokecenterText4: ; 492ec (12:52ec)
	db $08 ; asm
	ld a, [wd7c6]
	add a
	jp c, .asm_49353
	ld hl, MtMoonPokecenterText_4935c
	call PrintText
	ld a, $13
	ld [wTextBoxID], a
	call DisplayTextBoxID
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jp nz, .asm_4934e
	ldh [$9f], a
	ldh [$a1], a
	ld a, $5
	ldh [$a0], a
	call HasEnoughMoney
	jr nc, .asm_faa09 ; 0x49317
	ld hl, MtMoonPokecenterText_49366
	jr .asm_49356 ; 0x4931c
.asm_faa09 ; 0x4931e
	ld bc,(MAGIKARP << 8) | 5
	call GivePokemon
	jr nc, .asm_49359 ; 0x49324
	xor a
	ld [wWhichTrade], a
	ld [wTrainerFacingDirection], a
	ld a, $5
	ld [wTrainerEngageDistance], a
	ld hl, wTrainerFacingDirection
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
	ld a, $13
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld hl, wd7c6
	set 7, [hl]
	jr .asm_49359 ; 0x4934c
.asm_4934e ; 0x4934e
	ld hl, MtMoonPokecenterText_49361
	jr .asm_49356 ; 0x49351
.asm_49353 ; 0x49353
	ld hl, MtMoonPokecenterText_4936b
.asm_49356 ; 0x49356
	call PrintText
.asm_49359 ; 0x49359
	jp TextScriptEnd

MtMoonPokecenterText_4935c: ; 4935c (12:535c)
	TX_FAR _MtMoonPokecenterText_4935c
	db "@"

MtMoonPokecenterText_49361: ; 49361 (12:5361)
	TX_FAR _MtMoonPokecenterText_49361
	db "@"

MtMoonPokecenterText_49366: ; 49366 (12:5366)
	TX_FAR _MtMoonPokecenterText_49366
	db "@"

MtMoonPokecenterText_4936b: ; 4936b (12:536b)
	TX_FAR _MtMoonPokecenterText_4936b
	db "@"

MtMoonPokecenterText5: ; 49370 (12:5370)
	TX_FAR _MtMoonPokecenterText5
	db "@"

MtMoonPokecenterText6: ; 49375 (12:5375)
	db $f6
