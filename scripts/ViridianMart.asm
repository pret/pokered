ViridianMart_Script:
	call ViridianMartCheckParcelDeliveredScript
	call EnableAutoTextBoxDrawing
	ld hl, ViridianMart_ScriptPointers
	ld a, [wViridianMartCurScript]
	jp CallFunctionInTable

ViridianMartCheckParcelDeliveredScript:
	CheckEvent EVENT_OAK_GOT_PARCEL
	ld hl, ViridianMart_TextPointers2
	jr nz, .delivered_parcel
	ld hl, ViridianMart_TextPointers
.delivered_parcel
	ld a, l
	ld [wCurMapTextPtr], a
	ld a, h
	ld [wCurMapTextPtr+1], a
	ret

ViridianMart_ScriptPointers:
	def_script_pointers
	dw_const ViridianMartDefaultScript,    SCRIPT_VIRIDIANMART_DEFAULT
	dw_const ViridianMartOaksParcelScript, SCRIPT_VIRIDIANMART_OAKS_PARCEL
	dw_const DoRet,                        SCRIPT_VIRIDIANMART_NOOP

ViridianMartDefaultScript:
	call UpdateSprites
	ld a, TEXT_VIRIDIANMART_CLERK_YOU_CAME_FROM_PALLET_TOWN
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld hl, wSimulatedJoypadStatesEnd
	ld de, .PlayerMovement
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_VIRIDIANMART_OAKS_PARCEL
	ld [wViridianMartCurScript], a
	ret

.PlayerMovement:
	db D_LEFT, 1
	db D_UP, 2
	db -1 ; end

ViridianMartOaksParcelScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	ld a, TEXT_VIRIDIANMART_CLERK_PARCEL_QUEST
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	lb bc, OAKS_PARCEL, 1
	call GiveItem
	SetEvent EVENT_GOT_OAKS_PARCEL
	ld a, SCRIPT_VIRIDIANMART_NOOP
	ld [wViridianMartCurScript], a
	ret

ViridianMart_TextPointers:
	dw ViridianMartClerkSayHiToOakText
	dw ViridianMartYoungsterText
	dw ViridianMartCooltrainerMText
	dw ViridianMartTMKid
	const_def 5
	dw_const ViridianMartClerkYouCameFromPalletTownText, TEXT_VIRIDIANMART_CLERK_YOU_CAME_FROM_PALLET_TOWN
	dw_const ViridianMartClerkParcelQuestText,           TEXT_VIRIDIANMART_CLERK_PARCEL_QUEST

ViridianMart_TextPointers2:
	; This becomes the primary text pointers table when Oak's parcel has been delivered.
	def_text_pointers
	dw_const ViridianMartClerkText,        TEXT_VIRIDIANMART_CLERK
	dw_const ViridianMartYoungsterText,    TEXT_VIRIDIANMART_YOUNGSTER
	dw_const ViridianMartCooltrainerMText, TEXT_VIRIDIANMART_COOLTRAINER_M
	dw_const ViridianMartTMKid,            TEXT_VIRIDIANMART_TM_KID

ViridianMartClerkSayHiToOakText:
	text_far _ViridianMartClerkSayHiToOakText
	text_end

ViridianMartClerkYouCameFromPalletTownText:
	text_far _ViridianMartClerkYouCameFromPalletTownText
	text_end

ViridianMartClerkParcelQuestText:
	text_far _ViridianMartClerkParcelQuestText
	sound_get_key_item
	text_end

ViridianMartYoungsterText:
	text_far _ViridianMartYoungsterText
	text_end

ViridianMartCooltrainerMText:
	text_far _ViridianMartCooltrainerMText
	text_end

ViridianMartTMKid: ; PureRGBnote: ADDED: new NPC who will talk about TMs
	text_asm
	CheckEvent EVENT_BEAT_BLAINE
	jr nz, .beforeGiovanni
	CheckEvent EVENT_BEAT_MISTY
	jr nz, .afterMisty
.beforeMisty
	ld hl, ViridianMartTMKidBefore
	rst _PrintText
	rst TextScriptEnd
.tmkidgreet
	ld hl, TMKidGreet8
	rst _PrintText
	ret
.afterMisty
	call .tmkidgreet
	ld hl, TMKidStockingUp
	rst _PrintText
	rst TextScriptEnd
.beforeGiovanni
	CheckEvent EVENT_MET_GYM_GUIDE_SON
	jr nz, .afterMisty
	call .tmkidgreet
	ld hl, TMKidBigStockIndigo
	rst _PrintText
	rst TextScriptEnd

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

INCLUDE "data/items/marts/viridian.asm"
