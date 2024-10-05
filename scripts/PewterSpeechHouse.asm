PewterSpeechHouse_Script:
	jp EnableAutoTextBoxDrawing

PewterSpeechHouse_TextPointers:
	def_text_pointers
	dw_const PewterSpeechHouseGamblerText,           TEXT_PEWTERSPEECHHOUSE_GAMBLER
	dw_const PewterSpeechHouseYoungsterText,         TEXT_PEWTERSPEECHHOUSE_YOUNGSTER
	dw_const PewterSpeechHouseLostWalletBeautyText,  TEXT_PEWTERSPEECHHOUSE_LOST_WALLET_BEAUTY

PewterSpeechHouseGamblerText:
	text_far _PewterSpeechHouseGamblerText
	text_end

PewterSpeechHouseYoungsterText:
	text_far _PewterSpeechHouseYoungsterText
	text_end

; PureRGBnote: ADDED: new NPC who will give you POCKET ABRA once you return their LOST WALLET
PewterSpeechHouseLostWalletBeautyText: 
	text_asm
		CheckEvent EVENT_RETURNED_LOST_WALLET
		jr nz, .howsAbra
		ld b, LOST_WALLET
		call IsItemInBag
		jr nz, .have_lost_wallet
		ld hl, PewterHouse2Text3Intro
		rst _PrintText
		SetEvent EVENT_MET_POCKET_ABRA_LADY
		rst TextScriptEnd
	.have_lost_wallet
		ld hl, PewterHouse2Text3Found
		rst _PrintText
		ld a, LOST_WALLET
		ldh [hItemToRemoveID], a
		farcall RemoveItemByID
		lb bc, POCKET_ABRA, 1
		call GiveItem ; not possible to have no room for this item because you just gave the LOST WALLET away
		ld hl, ReceivedPocketAbraText
		rst _PrintText
		SetEvent EVENT_RETURNED_LOST_WALLET
		ld a, ABRA
		ld [wCurPartySpecies], a
		ld [wPokedexNum], a
		call PlayCry
		ld a, SFX_GET_ITEM_2
		call PlaySoundWaitForCurrent
		call WaitForSoundToFinish
		ld a, NAME_MON_SCREEN
		ld [wNamingScreenType], a
		ld hl, wPocketAbraNick
		predef AskName
		call DisableWaitingAfterTextDisplay
		rst TextScriptEnd
	.howsAbra
		ld hl, PewterHouse2Text3HowsAbra
		rst _PrintText
		rst TextScriptEnd

PewterHouse2Text3Intro:
	text_far _PewterHouse2Text3Intro
	text_end

PewterHouse2Text3Found:
	text_far _PewterHouse2Text3Found
	text_end

PewterHouse2Text3HowsAbra:
	text_far _PewterHouse2Text3After
	text_end

ReceivedPocketAbraText:
	text_far _ReceivedPocketAbraText
	text_end