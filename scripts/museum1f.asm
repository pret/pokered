Museum1FScript: ; 5c0f7 (17:40f7)
	ld a, $1
	ld [wAutoTextBoxDrawingControl], a
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, Museum1FScriptPointers
	ld a, [W_MUSEUM1FCURSCRIPT]
	jp CallFunctionInTable

Museum1FScriptPointers: ; 5c109 (17:4109)
	dw Museum1FScript0
	dw Museum1FScript1

Museum1FScript0: ; 5c10d (17:410d)
	ld a, [W_YCOORD]
	cp $4
	ret nz
	ld a, [W_XCOORD]
	cp $9
	jr z, .asm_5c120
	ld a, [W_XCOORD]
	cp $a
	ret nz
.asm_5c120
	xor a
	ld [hJoyHeld], a
	ld a, $1
	ld [hSpriteIndexOrTextID], a
	jp DisplayTextID

Museum1FScript1: ; 5c12a (17:412a)
	ret

Museum1FTextPointers: ; 5c12b (17:412b)
	dw Museum1FText1
	dw Museum1FText2
	dw Museum1FText3
	dw Museum1FText4
	dw Museum1FText5

Museum1FText1: ; 5c135 (17:4135)
	TX_ASM
	ld a, [W_YCOORD]
	cp $4
	jr nz, .asm_8774b
	ld a, [W_XCOORD]
	cp $d
	jp z, Museum1FScript_5c1f9
	jr .asm_b8709
.asm_8774b
	cp $3
	jr nz, .asm_d49e7
	ld a, [W_XCOORD]
	cp $c
	jp z, Museum1FScript_5c1f9
.asm_d49e7
	ld a, [wd754]
	bit 0, a
	jr nz, .asm_31a16
	ld hl, Museum1FText_5c23d
	call PrintText
	jp Museum1FScriptEnd
.asm_b8709
	ld a, [wd754]
	bit 0, a
	jr z, .asm_3ded4
.asm_31a16
	ld hl, Museum1FText_5c242
	call PrintText
	jp Museum1FScriptEnd
.asm_3ded4
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	xor a
	ld [hJoyHeld], a
	ld hl, Museum1FText_5c21f
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_de133
	xor a
	ld [hMoney], a
	ld [hMoney + 1], a
	ld a, $50
	ld [hMoney + 2], a
	call HasEnoughMoney
	jr nc, .asm_0f3e3
	ld hl, Museum1FText_5c229
	call PrintText
	jp .asm_de133
.asm_0f3e3
	ld hl, Museum1FText_5c224
	call PrintText
	ld hl, wd754
	set 0, [hl]
	xor a
	ld [wPriceTemp], a
	ld [wPriceTemp + 1], a
	ld a, $50
	ld [wPriceTemp + 2], a
	ld hl, wPriceTemp + 2
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld a, SFX_PURCHASE
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	jr .asm_0b094
.asm_de133
	ld hl, Museum1FText_5c21a
	call PrintText
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, D_DOWN
	ld [wSimulatedJoypadStatesEnd], a
	call StartSimulatingJoypadStates
	call UpdateSprites
	jr Museum1FScriptEnd
.asm_0b094
	ld a, $1
	ld [W_MUSEUM1FCURSCRIPT], a
	jr Museum1FScriptEnd

Museum1FScript_5c1f9: ; 5c1f9 (17:41f9)
	ld hl, Museum1FText_5c22e
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	cp $0
	jr nz, .asm_d1144
	ld hl, Museum1FText_5c233
	call PrintText
	jr Museum1FScriptEnd
.asm_d1144
	ld hl, Museum1FText_5c238
	call PrintText
Museum1FScriptEnd: ; 5c217 (17:4217)
	jp TextScriptEnd

Museum1FText_5c21a: ; 5c21a (17:421a)
	TX_FAR _Museum1FText_5c21a
	db "@"

Museum1FText_5c21f: ; 5c21f (17:421f)
	TX_FAR _Museum1FText_5c21f
	db "@"

Museum1FText_5c224: ; 5c224 (17:4224)
	TX_FAR _Museum1FText_5c224
	db "@"

Museum1FText_5c229: ; 5c229 (17:4229)
	TX_FAR _Museum1FText_5c229
	db "@"

Museum1FText_5c22e: ; 5c22e (17:422e)
	TX_FAR _Museum1FText_5c22e
	db "@"

Museum1FText_5c233: ; 5c233 (17:4233)
	TX_FAR _Museum1FText_5c233
	db "@"

Museum1FText_5c238: ; 5c238 (17:4238)
	TX_FAR _Museum1FText_5c238
	db "@"

Museum1FText_5c23d: ; 5c23d (17:423d)
	TX_FAR _Museum1FText_5c23d
	db "@"

Museum1FText_5c242: ; 5c242 (17:4242)
	TX_FAR _Museum1FText_5c242
	db "@"

Museum1FText2: ; 5c247 (17:4247)
	TX_ASM
	ld hl, Museum1FText_5c251
	call PrintText
	jp TextScriptEnd

Museum1FText_5c251: ; 5c251 (17:4251)
	TX_FAR _Museum1FText_5c251
	db "@"

Museum1FText3: ; 5c256 (17:4256)
	TX_ASM
	ld a, [wd754]
	bit 1, a
	jr nz, .asm_5c285
	ld hl, Museum1FText_5c28e
	call PrintText
	ld bc, (OLD_AMBER << 8) | 1
	call GiveItem
	jr nc, .BagFull
	ld hl, wd754
	set 1, [hl]
	ld a, HS_OLD_AMBER
	ld [wcc4d], a
	predef HideObject
	ld hl, ReceivedOldAmberText
	jr .asm_5c288
.BagFull
	ld hl, Museum1FText_5c29e
	jr .asm_5c288
.asm_5c285
	ld hl, Museum1FText_5c299
.asm_5c288
	call PrintText
	jp TextScriptEnd

Museum1FText_5c28e: ; 5c28e (17:428e)
	TX_FAR _Museum1FText_5c28e
	db "@"

ReceivedOldAmberText: ; 5c293 (17:4293)
	TX_FAR _ReceivedOldAmberText
	db $0B, "@"

Museum1FText_5c299: ; 5c299 (17:4299)
	TX_FAR _Museum1FText_5c299
	db "@"

Museum1FText_5c29e: ; 5c29e (17:429e)
	TX_FAR _Museum1FText_5c29e
	db "@"

Museum1FText4: ; 5c2a3 (17:42a3)
	TX_ASM
	ld hl, Museum1FText_5c2ad
	call PrintText
	jp TextScriptEnd

Museum1FText_5c2ad: ; 5c2ad (17:42ad)
	TX_FAR _Museum1FText_5c2ad
	db "@"

Museum1FText5: ; 5c2b2 (17:42b2)
	TX_ASM
	ld hl, Museum1FText_5c2bc
	call PrintText
	jp TextScriptEnd

Museum1FText_5c2bc: ; 5c2bc (17:42bc)
	TX_FAR _Museum1FText_5c2bc
	db "@"
