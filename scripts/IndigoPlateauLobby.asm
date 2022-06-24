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
	def_text_pointers
	dw_const IndigoPlateauNurseText,            TEXT_INDIGOPLATEAU_NURSE
	dw_const IndigoPlateauGymGuideText,         TEXT_INDIGOPLATEAU_GYM_GUIDE
	dw_const IndigoPlateauCooltrainerFText,     TEXT_INDIGOPLATEAU_COOLTRAINER_F
	dw_const IndigoPlateauClerkText,            TEXT_INDIGOPLATEAU_CLERK
	dw_const IndigoPlateauLinkReceptionistText, TEXT_INDIGOPLATEAU_LINK_RECEPTIONIST

IndigoPlateauNurseText:
	script_pokecenter_nurse

IndigoPlateauGymGuideText:
	text_far _IndigoPlateauGymGuideText
	text_end

IndigoPlateauCooltrainerFText:
	text_far _IndigoPlateauCooltrainerFText
	text_end

IndigoPlateauLinkReceptionistText:
	script_cable_club_receptionist
