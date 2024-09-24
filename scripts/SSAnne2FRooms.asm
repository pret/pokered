SSAnne2FRooms_Script:
	ld a, 1 << BIT_NO_AUTO_TEXT_BOX
	ld [wAutoTextBoxDrawingControl], a
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, SSAnne9TrainerHeaders
	ld de, SSAnne2FRooms_ScriptPointers
	ld a, [wSSAnne2FRoomsCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSSAnne2FRoomsCurScript], a
	ret

SSAnne2FRooms_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_SSANNE2FROOMS_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_SSANNE2FROOMS_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_SSANNE2FROOMS_END_BATTLE

SSAnne2FRooms_TextPointers:
	def_text_pointers
	dw_const SSAnne2FRoomsGentleman1Text,   TEXT_SSANNE2FROOMS_GENTLEMAN1
	dw_const SSAnne2FRoomsFisherText,       TEXT_SSANNE2FROOMS_FISHER
	dw_const SSAnne2FRoomsGentleman2Text,   TEXT_SSANNE2FROOMS_GENTLEMAN2
	dw_const SSAnne2FRoomsCooltrainerFText, TEXT_SSANNE2FROOMS_COOLTRAINER_F
	dw_const SSAnne2FRoomsGentleman3Text,   TEXT_SSANNE2FROOMS_GENTLEMAN3
	dw_const PickUpItemText,                TEXT_SSANNE2FROOMS_MAX_ETHER
	dw_const SSAnne2FRoomsGentleman4Text,   TEXT_SSANNE2FROOMS_GENTLEMAN4
	dw_const SSAnne2FRoomsGrampsText,       TEXT_SSANNE2FROOMS_GRAMPS
	dw_const PickUpItemText,                TEXT_SSANNE2FROOMS_RARE_CANDY
	dw_const SSAnne2FRoomsGentleman5Text,   TEXT_SSANNE2FROOMS_GENTLEMAN5
	dw_const SSAnne2FRoomsLittleBoyText,    TEXT_SSANNE2FROOMS_LITTLE_BOY
	dw_const SSAnne2FRoomsBrunetteGirlText, TEXT_SSANNE2FROOMS_BRUNETTE_GIRL
	dw_const SSAnne2FRoomsBeautyText,       TEXT_SSANNE2FROOMS_BEAUTY

SSAnne9TrainerHeaders:
	def_trainers
SSAnne9TrainerHeader0:
	trainer EVENT_BEAT_SS_ANNE_9_TRAINER_0, 2, SSAnne2FRoomsGentleman1BattleText, SSAnne2FRoomsGentleman1EndBattleText, SSAnne2FRoomsGentleman1AfterBattleText
SSAnne9TrainerHeader1:
	trainer EVENT_BEAT_SS_ANNE_9_TRAINER_1, 3, SSAnne2FRoomsFisherBattleText, SSAnne2FRoomsFisherEndBattleText, SSAnne2FRoomsFisherAfterBattleText
SSAnne9TrainerHeader2:
	trainer EVENT_BEAT_SS_ANNE_9_TRAINER_2, 3, SSAnne2FRoomsGentleman2BattleText, SSAnne2FRoomsGentleman2EndBattleText, SSAnne2FRoomsGentleman2AfterBattleText
SSAnne9TrainerHeader3:
	trainer EVENT_BEAT_SS_ANNE_9_TRAINER_3, 2, SSAnne2FRoomsCooltrainerFBattleText, SSAnne2FRoomsCooltrainerFEndBattleText, SSAnne2FRoomsCooltrainerFAfterBattleText
	db -1 ; end

SSAnne2FRoomsGentleman1Text:
	text_asm
	ld hl, SSAnne9TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SSAnne2FRoomsFisherText:
	text_asm
	ld hl, SSAnne9TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SSAnne2FRoomsGentleman2Text:
	text_asm
	ld hl, SSAnne9TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SSAnne2FRoomsCooltrainerFText:
	text_asm
	ld hl, SSAnne9TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SSAnne2FRoomsGentleman3Text:
	text_asm
	call SaveScreenTilesToBuffer1
	ld hl, .Text
	call PrintText
	call LoadScreenTilesFromBuffer1
	ld a, SNORLAX
	call DisplayPokedex
	jp TextScriptEnd

.Text:
	text_far _SSAnne2FRoomsGentleman3Text
	text_end

SSAnne2FRoomsGentleman4Text:
	text_asm
	ld hl, .Text
	call PrintText
	jp TextScriptEnd

.Text:
	text_far _SSAnne2FRoomsGentleman4Text
	text_end

SSAnne2FRoomsGrampsText:
	text_asm
	ld hl, .Text
	call PrintText
	jp TextScriptEnd

.Text:
	text_far _SSAnne2FRoomsGrampsText
	text_end

SSAnne2FRoomsGentleman5Text:
	text_asm
	ld hl, .Text
	call PrintText
	jp TextScriptEnd

.Text:
	text_far _SSAnne2FRoomsGentleman5Text
	text_end

SSAnne2FRoomsLittleBoyText:
	text_asm
	ld hl, .Text
	call PrintText
	jp TextScriptEnd

.Text:
	text_far _SSAnne2FRoomsLittleBoyText
	text_end

SSAnne2FRoomsBrunetteGirlText:
	text_asm
	ld hl, .Text
	call PrintText
	jp TextScriptEnd

.Text:
	text_far _SSAnne2FRoomsBrunetteGirlText
	text_end

SSAnne2FRoomsBeautyText:
	text_asm
	ld hl, .Text
	call PrintText
	jp TextScriptEnd

.Text:
	text_far _SSAnne2FRoomsBeautyText
	text_end

SSAnne2FRoomsGentleman1BattleText:
	text_far _SSAnne2FRoomsGentleman1BattleText
	text_end

SSAnne2FRoomsGentleman1EndBattleText:
	text_far _SSAnne2FRoomsGentleman1EndBattleText
	text_end

SSAnne2FRoomsGentleman1AfterBattleText:
	text_far _SSAnne2FRoomsGentleman1AfterBattleText
	text_end

SSAnne2FRoomsFisherBattleText:
	text_far _SSAnne2FRoomsFisherBattleText
	text_end

SSAnne2FRoomsFisherEndBattleText:
	text_far _SSAnne2FRoomsFisherEndBattleText
	text_end

SSAnne2FRoomsFisherAfterBattleText:
	text_far _SSAnne2FRoomsFisherAfterBattleText
	text_end

SSAnne2FRoomsGentleman2BattleText:
	text_far _SSAnne2FRoomsGentleman2BattleText
	text_end

SSAnne2FRoomsGentleman2EndBattleText:
	text_far _SSAnne2FRoomsGentleman2EndBattleText
	text_end

SSAnne2FRoomsGentleman2AfterBattleText:
	text_far _SSAnne2FRoomsGentleman2AfterBattleText
	text_end

SSAnne2FRoomsCooltrainerFBattleText:
	text_far _SSAnne2FRoomsCooltrainerFBattleText
	text_end

SSAnne2FRoomsCooltrainerFEndBattleText:
	text_far _SSAnne2FRoomsCooltrainerFEndBattleText
	text_end

SSAnne2FRoomsCooltrainerFAfterBattleText:
	text_far _SSAnne2FRoomsCooltrainerFAfterBattleText
	text_end
