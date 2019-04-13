Museum1F_Script:
	ld a, $1
	ld [wAutoTextBoxDrawingControl], a
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, Museum1F_ScriptPointers
	ld a, [wMuseum1FCurScript]
	jp CallFunctionInTable

Museum1F_ScriptPointers:
	dw Museum1FScript0
	dw Museum1FScript1

Museum1FScript0:
	ld a, [wYCoord]
	cp $4
	ret nz
	ld a, [wXCoord]
	cp $9
	jr z, .asm_5c120
	ld a, [wXCoord]
	cp $a
	ret nz
.asm_5c120
	xor a
	ld [hJoyHeld], a
	ld a, $1
	ld [hSpriteIndexOrTextID], a
	jp DisplayTextID

Museum1FScript1:
	ret

Museum1F_TextPointers:
	dw Museum1FText1
	dw Museum1FText2
	dw Museum1FText3
	dw Museum1FText4
	dw Museum1FText5

Museum1FText1:
	TX_ASM
	ld a, [wYCoord]
	cp $4
	jr nz, .asm_8774b
	ld a, [wXCoord]
	cp $d
	jp z, Museum1FScript_5c1f9
	jr .asm_b8709
.asm_8774b
	cp $3
	jr nz, .asm_d49e7
	ld a, [wXCoord]
	cp $c
	jp z, Museum1FScript_5c1f9
.asm_d49e7
	CheckEvent EVENT_BOUGHT_MUSEUM_TICKET
	jr nz, .asm_31a16
	ld hl, Museum1FText_5c23d
	call PrintText
	jp Museum1FScriptEnd
.asm_b8709
	CheckEvent EVENT_BOUGHT_MUSEUM_TICKET
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
	SetEvent EVENT_BOUGHT_MUSEUM_TICKET
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
	ld [wMuseum1FCurScript], a
	jr Museum1FScriptEnd

Museum1FScript_5c1f9:
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
Museum1FScriptEnd:
	jp TextScriptEnd

Museum1FText_5c21a:
	TX_FAR _Museum1FText_5c21a
	db "@"

Museum1FText_5c21f:
	TX_FAR _Museum1FText_5c21f
	db "@"

Museum1FText_5c224:
	TX_FAR _Museum1FText_5c224
	db "@"

Museum1FText_5c229:
	TX_FAR _Museum1FText_5c229
	db "@"

Museum1FText_5c22e:
	TX_FAR _Museum1FText_5c22e
	db "@"

Museum1FText_5c233:
	TX_FAR _Museum1FText_5c233
	db "@"

Museum1FText_5c238:
	TX_FAR _Museum1FText_5c238
	db "@"

Museum1FText_5c23d:
	TX_FAR _Museum1FText_5c23d
	db "@"

Museum1FText_5c242:
	TX_FAR _Museum1FText_5c242
	db "@"

Museum1FText2:
	TX_ASM
	ld hl, Museum1FText_5c251
	call PrintText
	jp TextScriptEnd

Museum1FText_5c251:
	TX_FAR _Museum1FText_5c251
	db "@"

Museum1FText3:
	TX_ASM
	CheckEvent EVENT_GOT_OLD_AMBER
	jr nz, .asm_5c285
	ld hl, Museum1FText_5c28e
	call PrintText
	lb bc, OLD_AMBER, 1
	call GiveItem
	jr nc, .BagFull
	SetEvent EVENT_GOT_OLD_AMBER
	ld a, HS_OLD_AMBER
	ld [wMissableObjectIndex], a
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

Museum1FText_5c28e:
	TX_FAR _Museum1FText_5c28e
	db "@"

ReceivedOldAmberText:
	TX_FAR _ReceivedOldAmberText
	TX_SFX_ITEM_1
	db "@"

Museum1FText_5c299:
	TX_FAR _Museum1FText_5c299
	db "@"

Museum1FText_5c29e:
	TX_FAR _Museum1FText_5c29e
	db "@"

Museum1FText4:
	TX_ASM
	ld hl, Museum1FText_5c2ad
	call PrintText
	jp TextScriptEnd

Museum1FText_5c2ad:
	TX_FAR _Museum1FText_5c2ad
	db "@"

Museum1FText5:
	TX_ASM
	ld hl, Museum1FText_5c2bc
	call PrintText
	jp TextScriptEnd

Museum1FText_5c2bc:
	TX_FAR _Museum1FText_5c2bc
	db "@"
