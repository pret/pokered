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
	ResetEventRange ELITE4_EVENTS_START, EVENT_LANCES_ROOM_LOCK_DOOR
	ret

IndigoPlateauLobby_TextPointers:
	dw IndigoHealNurseText
	dw IndigoPlateauLobbyText2
	dw IndigoPlateauLobbyText3
	dw IndigoCashierText
	dw IndigoTradeNurseText

IndigoHealNurseText:
	TX_POKECENTER_NURSE

IndigoPlateauLobbyText2:
	TX_FAR _IndigoPlateauLobbyText2
	db "@"

IndigoPlateauLobbyText3:
	TX_FAR _IndigoPlateauLobbyText3
	db "@"

IndigoTradeNurseText:
	TX_CABLE_CLUB_RECEPTIONIST
