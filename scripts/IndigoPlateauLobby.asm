IndigoPlateauLobby_Script:
	call SetLastBlackoutMap ; PureRGBnote: ADDED: set blackout map on entering pokemon center
	call Serial_TryEstablishingExternallyClockedConnection
	call EnableAutoTextBoxDrawing
	ld hl, wCurrentMapScriptFlags
	bit 6, [hl]
	res 6, [hl]
	ret z
	ResetEvent EVENT_VICTORY_ROAD_1_BOULDER_ON_SWITCH
	ld hl, wBeatLorelei
	bit 1, [hl]
	res 1, [hl]
	ret z
	; Elite 4 events
	ResetEventRange INDIGO_PLATEAU_EVENTS_START, EVENT_LANCES_ROOM_LOCK_DOOR
	ret

IndigoPlateauLobby_TextPointers:
	dw IndigoHealNurseText
	dw IndigoPlateauGymGuideText
	dw IndigoPlateauLobbyText3
	dw IndigoCashierText
	dw IndigoTradeNurseText
	dw IndigoGymGuideSonText

IndigoHealNurseText:
	script_pokecenter_nurse

IndigoPlateauGymGuideText: ; PureRGBnote: ADDED: gym guide sells you apex chips (and a couple items) after becoming champ
	text_asm
	CheckEvent EVENT_BECAME_CHAMP
	jr nz, .afterChamp
	CheckEvent EVENT_GOT_PEWTER_APEX_CHIPS ; have to hear about apex chips to receive them after that
	jr z, .donePrompt
	ld hl, IndigoPlateauLobbyText2getPrompt
	call PrintText
	ld hl, IndigoPlateauApexChipsAfterChamp
	call PrintText
	jr .done
.afterChamp
	CheckEvent EVENT_TALKED_GYM_GUIDE_AFTER_CHAMP
	jr nz, .quickGreet
	SetEvent EVENT_TALKED_GYM_GUIDE_AFTER_CHAMP
	CheckEvent EVENT_GOT_PEWTER_APEX_CHIPS ; have to hear about apex chips to receive them after that
	jr z, .donePrompt2
	ld hl, IndigoPlateauGymGuideChampGreetingPrompt
	call PrintText
	ld hl, IndigoPlateauGymGuideChampApexChips
	call PrintText
	jr .sellChips
.quickGreet
	CheckEvent EVENT_GOT_PEWTER_APEX_CHIPS ; have to hear about apex chips to receive them after that
	jr z, .donePrompt3
	ld hl, IndigoPlateauGymGuideChampAfterGreetPrompt
	call PrintText
.sellChips
	ld hl, IndigoGymGuideShop
	call DisplayPokemartNoGreeting
.done
	jp TextScriptEnd
.donePrompt
	ld hl, IndigoPlateauLobbyText2get
	call PrintText
	jr .done
.donePrompt2
	ld hl, IndigoPlateauGymGuideChampGreeting
	call PrintText
	jr .done
.donePrompt3
	ld hl, IndigoPlateauGymGuideChampAfterGreet
	call PrintText
	jr .done

IndigoGymGuideSonText:  ; PureRGBnote: ADDED: new NPC who will sell TMs - sells all 50 TMs after becoming champ.
	text_asm
	CheckEvent EVENT_BECAME_CHAMP
	jr nz, .afterChamp
	ld hl, IndigoPlateauGymGuideSonText
	call PrintText
	CheckEvent EVENT_MET_GYM_GUIDE_SON
	call nz, .noIntroduce
	call .checkIntroduce
	jr .shop1
.checkIntroduce
	CheckEvent EVENT_MET_GYM_GUIDE_SON
	call z, .introduce
	ret
.introduce
	ld hl, IndigoPlateauGymGuideSonIntro
	call PrintText
	ret
.noIntroduce
	ld hl, IndigoPlateauGymGuideSonShopStart
	call PrintText
	ret
.moreTMs
	CheckEvent EVENT_TALKED_GYM_GUIDE_SON_AFTER_CHAMP
	ret nz
	ld hl, IndigoPlateauGymGuideSonMoreTMs
	call PrintText
	ret
.afterChamp
	ld hl, IndigoPlateauGymGuideSonChampText
	call PrintText
	call .checkIntroduce
	CheckEvent EVENT_TALKED_GYM_GUIDE_SON_AFTER_CHAMP
	call nz, .noIntroduce 
	CheckEvent EVENT_MET_GYM_GUIDE_SON
	call nz, .moreTMs 
	SetEvent EVENT_TALKED_GYM_GUIDE_SON_AFTER_CHAMP
	jr .shop2
.shop2
	ld hl, IndigoGymGuideSonShop2
	jr .done
.shop1
	ld hl, IndigoGymGuideSonShop1
.done
	call DisplayPokemartNoGreeting
	SetEvent EVENT_MET_GYM_GUIDE_SON
	jp TextScriptEnd

IndigoPlateauLobbyText2get:
	text_far _IndigoPlateauLobbyText2
	text_end

IndigoPlateauLobbyText2getPrompt:
	text_far _IndigoPlateauLobbyText2
	text_promptbutton
	text_end

IndigoPlateauApexChipsAfterChamp:
	text_far _IndigoPlateauApexChipsAfterChamp
	text_end

IndigoPlateauLobbyText3:
	text_far _IndigoPlateauLobbyText3
	text_end

IndigoPlateauGymGuideChampGreeting:
	text_far _IndigoPlateauGymGuideChampGreeting
	text_end

IndigoPlateauGymGuideChampGreetingPrompt:
	text_far _IndigoPlateauGymGuideChampGreeting
	text_promptbutton
	text_end

IndigoPlateauGymGuideChampApexChips:
	text_far _IndigoPlateauGymGuideChampApexChips
	text_end

IndigoPlateauGymGuideChampAfterGreet:
	text_far _IndigoPlateauGymGuideChampAfterGreet
	text_end

IndigoPlateauGymGuideChampAfterGreetPrompt:
	text_far _IndigoPlateauGymGuideChampAfterGreet
	text_promptbutton
	text_end

IndigoTradeNurseText:
	;text_asm ;DEBUGMODE
	;SetEvent EVENT_BECAME_CHAMP
	;jp TextScriptEnd
	script_cable_club_receptionist

IndigoPlateauGymGuideSonText:
	text_far _IndigoPlateauGymGuideSonText
	text_end

IndigoPlateauGymGuideSonChampText:
	text_far _IndigoPlateauGymGuideSonChampText
	text_end

IndigoPlateauGymGuideSonIntro:
	text_far _IndigoPlateauGymGuideSonIntro
	text_end

IndigoPlateauGymGuideSonShopStart:
	text_far _IndigoPlateauGymGuideSonShopStart
	text_end

IndigoPlateauGymGuideSonMoreTMs:
	text_far _IndigoPlateauGymGuideSonMoreTMs
	text_end

INCLUDE "data/items/marts/indigo_plateau.asm"
