ViridianMart_Script:
	call ViridianMartScript_1d47d
	call EnableAutoTextBoxDrawing
	ld hl, ViridianMart_ScriptPointers
	ld a, [wViridianMartCurScript]
	jp CallFunctionInTable

ViridianMartScript_1d47d:
	CheckEvent EVENT_OAK_GOT_PARCEL
	jr nz, .delivered_parcel
	ld hl, ViridianMart_TextPointers
	jr .done
.delivered_parcel
	ld hl, ViridianMart_TextPointers2
.done
	ld a, l
	ld [wMapTextPtr], a
	ld a, h
	ld [wMapTextPtr+1], a
	ret

ViridianMart_ScriptPointers:
	dw ViridianMartScript0
	dw ViridianMartScript1
	dw ViridianMartScript2

ViridianMartScript0:
	call UpdateSprites
	ld a, $5
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld hl, wSimulatedJoypadStatesEnd
	ld de, RLEMovement1d4bb
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, $1
	ld [wViridianMartCurScript], a
	ret

RLEMovement1d4bb:
	db D_LEFT, 1
	db D_UP, 2
	db -1 ; end

ViridianMartScript1:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	ld a, $6
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	lb bc, OAKS_PARCEL, 1
	call GiveItem
	SetEvent EVENT_GOT_OAKS_PARCEL
	ld a, $2
	ld [wViridianMartCurScript], a
	; fallthrough
ViridianMartScript2:
	ret

ViridianMart_TextPointers:
	dw ViridianMartText1
	dw ViridianMartText2
	dw ViridianMartText3
	dw ViridianMartTMKid
	dw ViridianMartText4
	dw ViridianMartText5

ViridianMart_TextPointers2:
	dw ViridianCashierText
	dw ViridianMartText2
	dw ViridianMartText3
	dw ViridianMartTMKid

ViridianMartText1:
	text_far _ViridianMartText1
	text_end

ViridianMartText4:
	text_far _ViridianMartText4
	text_end

ViridianMartText5:
	text_far ViridianMartParcelQuestText
	sound_get_key_item
	text_end

ViridianMartText2:
	text_far _ViridianMartText2
	text_end

ViridianMartText3:
	text_far _ViridianMartText3
	text_end

ViridianMartTMKid:
	text_asm
	CheckEvent EVENT_BEAT_BLAINE
	jr nz, .beforeGiovanni
	CheckEvent EVENT_BEAT_MISTY
	jr nz, .afterMisty
	jr .beforeMisty
.beforeMisty
	ld hl, ViridianMartTMKidBefore
	call PrintText
	jr .done
.tmkidgreet
	ld hl, TMKidGreet8
	call PrintText
	ret
.afterMisty
	call .tmkidgreet
	ld hl, TMKidStockingUp
	call PrintText
	jr .done
.beforeGiovanni
	CheckEvent EVENT_MET_GYM_GUIDE_SON
	jr nz, .afterMisty
	call .tmkidgreet
	ld hl, TMKidBigStockIndigo
	call PrintText
.done
	jp TextScriptEnd

TMKidGreet8:
	text_far _TMKidGreet
	text_end

TMKidStockingUp:
	text_far _TMKidStockingUp
	text_end

TMKidBigStockIndigo:
	text_far _TMKidBigStockIndigo
	text_end

ViridianMartTMKidBefore:
	text_far _ViridianMartTMKid
	text_end
	
ViridianCashierText::
	script_mart POKE_BALL, ANTIDOTE, PARLYZ_HEAL, BURN_HEAL