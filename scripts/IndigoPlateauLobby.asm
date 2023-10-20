IndigoPlateauLobby_Script:
	call SetLastBlackoutMap ; PureRGBnote: ADDED: set blackout map on entering pokemon center
	call Serial_TryEstablishingExternallyClockedConnection
	call EnableAutoTextBoxDrawing
	call CheckArenaAssistantWalking
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
	def_text_pointers
	dw_const IndigoPlateauLobbyNurseText,            TEXT_INDIGOPLATEAULOBBY_NURSE
	dw_const IndigoPlateauLobbyGymGuideText,         TEXT_INDIGOPLATEAULOBBY_GYM_GUIDE
	dw_const IndigoPlateauLobbyCooltrainerFText,     TEXT_INDIGOPLATEAULOBBY_COOLTRAINER_F
	dw_const IndigoPlateauLobbyClerkText,            TEXT_INDIGOPLATEAULOBBY_CLERK
	dw_const IndigoPlateauLobbyLinkReceptionistText, TEXT_INDIGOPLATEAULOBBY_LINK_RECEPTIONIST
	dw_const IndigoGymGuideSonText,                  TEXT_INDIGOPLATEAULOBBY_TM_KID
	dw_const IndigoPlateauArenaAssistantText,        TEXT_INDIGOPLATEAULOBBY_ARENA_ASSISTANT

IndigoPlateauLobbyNurseText:
	script_pokecenter_nurse

IndigoPlateauLobbyGymGuideText: ; PureRGBnote: ADDED: gym guide sells you apex chips (and a couple items) after becoming champ
	text_asm
	CheckEvent EVENT_BECAME_CHAMP
	jr nz, .afterChamp
	CheckEvent EVENT_GOT_PEWTER_APEX_CHIPS ; have to hear about apex chips to receive them after that
	jr z, .donePrompt
	ld hl, IndigoPlateauLobbyGymGuideText2Prompt
	rst _PrintText
	ld hl, IndigoPlateauApexChipsAfterChamp
	rst _PrintText
	jr .done
.afterChamp
	CheckEvent EVENT_TALKED_GYM_GUIDE_AFTER_CHAMP
	jr nz, .quickGreet
	SetEvent EVENT_TALKED_GYM_GUIDE_AFTER_CHAMP
	CheckEvent EVENT_GOT_PEWTER_APEX_CHIPS ; have to hear about apex chips to receive them after that
	jr z, .donePrompt2
	ld hl, IndigoPlateauGymGuideChampGreetingPrompt
	rst _PrintText
	ld hl, IndigoPlateauGymGuideChampApexChips
	rst _PrintText
	jr .sellChips
.quickGreet
	CheckEvent EVENT_GOT_PEWTER_APEX_CHIPS ; have to hear about apex chips to receive them after that
	jr z, .donePrompt3
	ld hl, IndigoPlateauGymGuideChampAfterGreetPrompt
	rst _PrintText
.sellChips
	ld hl, IndigoGymGuideShop
	call DisplayPokemartNoGreeting
.done
	rst TextScriptEnd
.donePrompt
	ld hl, IndigoPlateauLobbyGymGuideText2
	rst _PrintText
	jr .done
.donePrompt2
	ld hl, IndigoPlateauGymGuideChampGreeting
	rst _PrintText
	jr .done
.donePrompt3
	ld hl, IndigoPlateauGymGuideChampAfterGreet
	rst _PrintText
	jr .done

IndigoGymGuideSonText:  ; PureRGBnote: ADDED: new NPC who will sell TMs - sells all 50 TMs after becoming champ.
	text_asm
	CheckEvent EVENT_BECAME_CHAMP
	jr nz, .afterChamp
	ld hl, IndigoPlateauGymGuideSonText
	rst _PrintText
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
	rst _PrintText
	ret
.noIntroduce
	ld hl, IndigoPlateauGymGuideSonShopStart
	rst _PrintText
	ret
.moreTMs
	CheckEvent EVENT_TALKED_GYM_GUIDE_SON_AFTER_CHAMP
	ret nz
	ld hl, IndigoPlateauGymGuideSonMoreTMs
	rst _PrintText
	ret
.afterChamp
	ld hl, IndigoPlateauGymGuideSonChampText
	rst _PrintText
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
	rst TextScriptEnd

IndigoPlateauLobbyGymGuideText2:
	text_far _IndigoPlateauLobbyGymGuideText
	text_end

IndigoPlateauLobbyGymGuideText2Prompt:
	text_far _IndigoPlateauLobbyGymGuideText
	text_promptbutton
	text_end

IndigoPlateauApexChipsAfterChamp:
	text_far _IndigoPlateauApexChipsAfterChamp
	text_end

IndigoPlateauLobbyCooltrainerFText:
	text_far _IndigoPlateauLobbyCooltrainerFText
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

IndigoPlateauLobbyLinkReceptionistText:
IF DEF(_DEBUG)
	text_asm ;DEBUGMODE
	SetEvent EVENT_BECAME_CHAMP
	rst TextScriptEnd
ELSE
	script_cable_club_receptionist
ENDC

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

IndigoPlateauArenaAssistantText:
	text_asm
	CheckEvent EVENT_BECAME_CHAMP
	jr nz, .becameChamp
	ld hl, .onlyEliteFourAllowed
	rst _PrintText
	rst TextScriptEnd
.becameChamp
	SetEvent EVENT_ARENA_ASSISTANT_WALKING
	; walks into door and leaves
	ld de, AssistantWalksUp
	ld a, INDIGOPLATEAULOBBY_ARENA_ASSISTANT
	ldh [hSpriteIndexOrTextID], a
	call MoveSprite
	xor a
	ld [wJoyIgnore], a
	ld hl, .champAttained
	rst _PrintText
	rst TextScriptEnd
.onlyEliteFourAllowed
	text_far _IndigoPlateauArenaAssistantOnlyEliteFourAllowed
	text_end
.champAttained
	text_far _IndigoPlateauArenaAssistantChampAttained
	text_end

AssistantWalksUp:
	db NPC_MOVEMENT_UP
	db -1

CheckArenaAssistantWalking:
	CheckEvent EVENT_ARENA_ASSISTANT_WALKING
	ret z
	ld a, -1
	ld [wJoyIgnore], a ; ignore all input until she is done walking
	ld a, [wd730]
	bit 0, a
	ret nz
	ResetEvent EVENT_ARENA_ASSISTANT_WALKING
	xor a
	ld [wJoyIgnore], a
	ld a, SFX_GO_OUTSIDE
	rst _PlaySound
	ld a, HS_INDIGO_PLATEAU_LOBBY_CHAMP_ARENA_ASSISTANT
	ld [wMissableObjectIndex], a
	predef_jump HideExtraObject

