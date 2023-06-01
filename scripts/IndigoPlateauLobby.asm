IndigoPlateauLobby_Script:
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
	dw IndigoPlateauLobbyText2
	dw IndigoPlateauLobbyText3
	dw CandyJarGuy
	dw IndigoCashierText
	dw IndigoTradeNurseText
	dw ExeggutorTrade
	dw IndigoPlateauLobbyText4

IndigoHealNurseText:
	script_pokecenter_nurse

IndigoPlateauLobbyText2:
	text_far _IndigoPlateauLobbyText2
	text_end

IndigoPlateauLobbyText3:
	text_far _IndigoPlateauLobbyText3
	text_end

IndigoTradeNurseText:
	script_cable_club_receptionist

IndigoCashierText::
	script_mart ULTRA_BALL, GREAT_BALL, FULL_RESTORE, MAX_POTION, FULL_HEAL, REVIVE, MAX_REPEL

ExeggutorTrade:
	text_asm
	ld a, TRADE_FOR_EXEGGUTOR_A
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	jp TextScriptEnd

IndigoPlateauLobbyText4:
	text_asm
	callfar PokecenterChanseyText
	jp TextScriptEnd

CandyJarGuy:
	text_asm
	CheckEvent EVENT_GOT_CANDY_JAR
	jr nz, .got_item
	ld hl, CandyJarPreReceiveText
	call PrintText
	lb bc, CANDY_JAR, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, ReceivedCandyJarText
	call PrintText
	SetEvent EVENT_GOT_CANDY_JAR
	jr .done
.bag_full
	ld hl, CandyJarNoRoomText
	call PrintText
	jr .done
.got_item
	ld hl, CandyJarExplanationText
	call PrintText
.done
	jp TextScriptEnd

CandyJarPreReceiveText:
	text_far _CandyJarPreReceiveText
	text_end

ReceivedCandyJarText:
	text_far _ReceivedCandyJarText
	sound_get_item_1
	text_end

CandyJarExplanationText:
	text_far _CandyJarExplanationText
	text_end

CandyJarNoRoomText:
	text_far _CandyJarNoRoomText
	text_end
