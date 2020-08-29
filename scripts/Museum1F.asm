Museum1F_Script:
	ld a, TRUE
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
	cp 4
	ret nz
	ld a, [wXCoord]
	cp 9
	jr z, .asm_5c120
	ld a, [wXCoord]
	cp 10
	ret nz
.asm_5c120
	xor a
	ldh [hJoyHeld], a
	ld a, $1
	ldh [hSpriteIndexOrTextID], a
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
	text_asm
	ld a, [wYCoord]
	cp 4
	jr nz, .asm_8774b
	ld a, [wXCoord]
	cp 13
	jp z, Museum1FScript_5c1f9
	jr .asm_b8709
.asm_8774b
	cp $3
	jr nz, .asm_d49e7
	ld a, [wXCoord]
	cp 12
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
	ldh [hJoyHeld], a
	ld hl, Museum1FText_5c21f
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_de133
	xor a
	ldh [hMoney], a
	ldh [hMoney + 1], a
	ld a, $50
	ldh [hMoney + 2], a
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
	text_far _Museum1FText_5c21a
	text_end

Museum1FText_5c21f:
	text_far _Museum1FText_5c21f
	text_end

Museum1FText_5c224:
	text_far _Museum1FText_5c224
	text_end

Museum1FText_5c229:
	text_far _Museum1FText_5c229
	text_end

Museum1FText_5c22e:
	text_far _Museum1FText_5c22e
	text_end

Museum1FText_5c233:
	text_far _Museum1FText_5c233
	text_end

Museum1FText_5c238:
	text_far _Museum1FText_5c238
	text_end

Museum1FText_5c23d:
	text_far _Museum1FText_5c23d
	text_end

Museum1FText_5c242:
	text_far _Museum1FText_5c242
	text_end

Museum1FText2:
	text_asm
	ld hl, Museum1FText_5c251
	call PrintText
	jp TextScriptEnd

Museum1FText_5c251:
	text_far _Museum1FText_5c251
	text_end

Museum1FText3:
	text_asm
	CheckEvent EVENT_GOT_OLD_AMBER
	jr nz, .got_item
	ld hl, Museum1FText_5c28e
	call PrintText
	lb bc, OLD_AMBER, 1
	call GiveItem
	jr nc, .bag_full
	SetEvent EVENT_GOT_OLD_AMBER
	ld a, HS_OLD_AMBER
	ld [wMissableObjectIndex], a
	predef HideObject
	ld hl, ReceivedOldAmberText
	jr .done
.bag_full
	ld hl, Museum1FText_5c29e
	jr .done
.got_item
	ld hl, Museum1FText_5c299
.done
	call PrintText
	jp TextScriptEnd

Museum1FText_5c28e:
	text_far _Museum1FText_5c28e
	text_end

ReceivedOldAmberText:
	text_far _ReceivedOldAmberText
	sound_get_item_1
	text_end

Museum1FText_5c299:
	text_far _Museum1FText_5c299
	text_end

Museum1FText_5c29e:
	text_far _Museum1FText_5c29e
	text_end

Museum1FText4:
	text_asm
	ld hl, Museum1FText_5c2ad
	call PrintText
	jp TextScriptEnd

Museum1FText_5c2ad:
	text_far _Museum1FText_5c2ad
	text_end

Museum1FText5:
	text_asm
	ld hl, Museum1FText_5c2bc
	call PrintText
	jp TextScriptEnd

Museum1FText_5c2bc:
	text_far _Museum1FText_5c2bc
	text_end
