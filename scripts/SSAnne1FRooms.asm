SSAnne1FRooms_Script:
	call EnableAutoTextBoxDrawing
	ld hl, SSAnne8TrainerHeaders
	ld de, SSAnne1FRooms_ScriptPointers
	ld a, [wSSAnne1FRoomsCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSSAnne1FRoomsCurScript], a
	ret

SSAnne1FRooms_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

SSAnne1FRooms_TextPointers:
	dw SSAnne8Text1
	dw SSAnne8Text2
	dw SSAnne8Text3
	dw SSAnne8Text4
	dw SSAnne8Text5
	dw SSAnne8Text6
	dw SSAnne8Text7
	dw SSAnne8Text8
	dw SSAnne8Text9
	dw PickUpItemText
	dw SSAnne8Text11

SSAnne8TrainerHeaders:
	def_trainers
SSAnne8TrainerHeader0:
	trainer EVENT_BEAT_SS_ANNE_8_TRAINER_0, 2, SSAnne8BattleText1, SSAnne8EndBattleText1, SSAnne8AfterBattleText1
SSAnne8TrainerHeader1:
	trainer EVENT_BEAT_SS_ANNE_8_TRAINER_1, 3, SSAnne8BattleText2, SSAnne8EndBattleText2, SSAnne8AfterBattleText2
SSAnne8TrainerHeader2:
	trainer EVENT_BEAT_SS_ANNE_8_TRAINER_2, 2, SSAnne8BattleText3, SSAnne8EndBattleText3, SSAnne8AfterBattleText3
SSAnne8TrainerHeader3:
	trainer EVENT_BEAT_SS_ANNE_8_TRAINER_3, 2, SSAnne8BattleText4, SSAnne8EndBattleText4, SSAnne8AfterBattleText4
	db -1 ; end

SSAnne8Text1:
	text_asm
	ld hl, SSAnne8TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SSAnne8Text2:
	text_asm
	ld hl, SSAnne8TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SSAnne8Text3:
	text_asm
	ld hl, SSAnne8TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SSAnne8Text4:
	text_asm
	ld hl, SSAnne8TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SSAnne8Text8:
	text_far _SSAnne8Text8
	text_asm
	ld a, WIGGLYTUFF
	call PlayCry
	jp TextScriptEnd

SSAnne8BattleText1:
	text_far _SSAnne8BattleText1
	text_end

SSAnne8EndBattleText1:
	text_far _SSAnne8EndBattleText1
	text_end

SSAnne8AfterBattleText1:
	text_far _SSAnne8AfterBattleText1
	text_end

SSAnne8BattleText2:
	text_far _SSAnne8BattleText2
	text_end

SSAnne8EndBattleText2:
	text_far _SSAnne8EndBattleText2
	text_end

SSAnne8AfterBattleText2:
	text_far _SSAnne8AfterBattleText2
	text_end

SSAnne8BattleText3:
	text_far _SSAnne8BattleText3
	text_end

SSAnne8EndBattleText3:
	text_far _SSAnne8EndBattleText3
	text_end

SSAnne8AfterBattleText3:
	text_far _SSAnne8AfterBattleText3
	text_end

SSAnne8BattleText4:
	text_far _SSAnne8BattleText4
	text_end

SSAnne8EndBattleText4:
	text_far _SSAnne8EndBattleText4
	text_end

SSAnne8AfterBattleText4:
	text_far _SSAnne8AfterBattleText4
	text_end

SSAnne8Text5:
	text_far _SSAnne8Text5
	text_end

SSAnne8Text6:
	text_far _SSAnne8Text6
	text_end

SSAnne8Text7:
	text_far _SSAnne8Text7
	text_end

SSAnne8Text9:
	text_far _SSAnne8Text9
	text_end

SSAnne8Text11:
	text_far _SSAnne8Text11
	text_end
