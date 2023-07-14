SSAnne1FRooms_Script:
	call EnableAutoTextBoxDrawing
	ld hl, SSAnne8TrainerHeaders
	ld de, SSAnne1FRooms_ScriptPointers
	ld a, [wSSAnne1FRoomsCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSSAnne1FRoomsCurScript], a
	ret

SSAnne1FRooms_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_SSANNE1FROOMS_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_SSANNE1FROOMS_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_SSANNE1FROOMS_END_BATTLE

SSAnne1FRooms_TextPointers:
	def_text_pointers
	dw_const SSAnne1FRoomsGentleman1Text,    TEXT_SSANNE1FROOMS_GENTLEMAN1
	dw_const SSAnne1FRoomsGentleman2Text,    TEXT_SSANNE1FROOMS_GENTLEMAN2
	dw_const SSAnne1FRoomsYoungsterText,     TEXT_SSANNE1FROOMS_YOUNGSTER
	dw_const SSAnne1FRoomsCooltrainerFText,  TEXT_SSANNE1FROOMS_COOLTRAINER_F
	dw_const SSAnne1FRoomsGirl1Text,         TEXT_SSANNE1FROOMS_GIRL1
	dw_const SSAnne1FRoomsMiddleAgedManText, TEXT_SSANNE1FROOMS_MIDDLE_AGED_MAN
	dw_const SSAnne1FRoomsLittleGirlText,    TEXT_SSANNE1FROOMS_LITTLE_GIRL
	dw_const SSAnne1FRoomsWigglytuffText,    TEXT_SSANNE1FROOMS_WIGGLYTUFF
	dw_const SSAnne1FRoomsGirl2Text,         TEXT_SSANNE1FROOMS_GIRL2
	dw_const PickUpItemText,                 TEXT_SSANNE1FROOMS_TM_BODY_SLAM
	dw_const SSAnne1FRoomsGentleman3Text,    TEXT_SSANNE1FROOMS_GENTLEMAN3

SSAnne8TrainerHeaders:
	def_trainers
SSAnne8TrainerHeader0:
	trainer EVENT_BEAT_SS_ANNE_8_TRAINER_0, 2, SSAnne1FRoomsGentleman1BattleText, SSAnne1FRoomsGentleman1EndBattleText, SSAnne1FRoomsGentleman1AfterBattleText
SSAnne8TrainerHeader1:
	trainer EVENT_BEAT_SS_ANNE_8_TRAINER_1, 3, SSAnne1FRoomsGentleman2BattleText, SSAnne1FRoomsGentleman2EndBattleText, SSAnne1FRoomsGentleman2AfterBattleText
SSAnne8TrainerHeader2:
	trainer EVENT_BEAT_SS_ANNE_8_TRAINER_2, 2, SSAnne1FRoomsYoungsterBattleText, SSAnne1FRoomsYoungsterEndBattleText, SSAnne1FRoomsYoungsterAfterBattleText
SSAnne8TrainerHeader3:
	trainer EVENT_BEAT_SS_ANNE_8_TRAINER_3, 2, SSAnne1FRoomsCooltrainerFBattleText, SSAnne1FRoomsCooltrainerFEndBattleText, SSAnne1FRoomsCooltrainerFAfterBattleText
	db -1 ; end

SSAnne1FRoomsGentleman1Text:
	text_asm
	ld hl, SSAnne8TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SSAnne1FRoomsGentleman2Text:
	text_asm
	ld hl, SSAnne8TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SSAnne1FRoomsYoungsterText:
	text_asm
	ld hl, SSAnne8TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SSAnne1FRoomsCooltrainerFText:
	text_asm
	ld hl, SSAnne8TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SSAnne1FRoomsWigglytuffText:
	text_far _SSAnne1FRoomsWigglytuffText
	text_asm
	ld a, WIGGLYTUFF
	call PlayCry
	jp TextScriptEnd

SSAnne1FRoomsGentleman1BattleText:
	text_far _SSAnne1FRoomsGentleman1BattleText
	text_end

SSAnne1FRoomsGentleman1EndBattleText:
	text_far _SSAnne1FRoomsGentleman1EndBattleText
	text_end

SSAnne1FRoomsGentleman1AfterBattleText:
	text_far _SSAnne1FRoomsGentleman1AfterBattleText
	text_end

SSAnne1FRoomsGentleman2BattleText:
	text_far _SSAnne1FRoomsGentleman2BattleText
	text_end

SSAnne1FRoomsGentleman2EndBattleText:
	text_far _SSAnne1FRoomsGentleman2EndBattleText
	text_end

SSAnne1FRoomsGentleman2AfterBattleText:
	text_far _SSAnne1FRoomsGentleman2AfterBattleText
	text_end

SSAnne1FRoomsYoungsterBattleText:
	text_far _SSAnne1FRoomsYoungsterBattleText
	text_end

SSAnne1FRoomsYoungsterEndBattleText:
	text_far _SSAnne1FRoomsYoungsterEndBattleText
	text_end

SSAnne1FRoomsYoungsterAfterBattleText:
	text_far _SSAnne1FRoomsYoungsterAfterBattleText
	text_end

SSAnne1FRoomsCooltrainerFBattleText:
	text_far _SSAnne1FRoomsCooltrainerFBattleText
	text_end

SSAnne1FRoomsCooltrainerFEndBattleText:
	text_far _SSAnne1FRoomsCooltrainerFEndBattleText
	text_end

SSAnne1FRoomsCooltrainerFAfterBattleText:
	text_far _SSAnne1FRoomsCooltrainerFAfterBattleText
	text_end

SSAnne1FRoomsGirl1Text:
	text_far _SSAnne1FRoomsGirl1Text
	text_end

SSAnne1FRoomsMiddleAgedManText:
	text_far _SSAnne1FRoomsMiddleAgedManText
	text_end

SSAnne1FRoomsLittleGirlText:
	text_far _SSAnne1FRoomsLittleGirlText
	text_end

SSAnne1FRoomsGirl2Text:
	text_far _SSAnne1FRoomsGirl2Text
	text_end

SSAnne1FRoomsGentleman3Text:
	text_far _SSAnne1FRoomsGentleman3Text
	text_end
