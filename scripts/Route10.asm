Route10_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route10TrainerHeaders
	ld de, Route10_ScriptPointers
	ld a, [wRoute10CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute10CurScript], a
	ret

Route10_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route10_TextPointers:
	dw Route10Text1
	dw Route10Text2
	dw Route10Text3
	dw Route10Text4
	dw Route10Text5
	dw Route10Text6
	dw Route10Text7
	dw PokeCenterSignText
	dw Route10Text9
	dw Route10Text10

Route10TrainerHeaders:
	def_trainers
Route10TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_10_TRAINER_0, 4, Route10BattleText1, Route10EndBattleText1, Route10AfterBattleText1
Route10TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_10_TRAINER_1, 3, Route10BattleText2, Route10EndBattleText2, Route10AfterBattleText2
Route10TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_10_TRAINER_2, 4, Route10BattleText3, Route10EndBattleText3, Route10AfterBattleText3
Route10TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_10_TRAINER_3, 3, Route10BattleText4, Route10EndBattleText4, Route10AfterBattleText4
Route10TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_10_TRAINER_4, 2, Route10BattleText5, Route10EndBattleText5, Route10AfterBattleText5
Route10TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_10_TRAINER_5, 2, Route10BattleText6, Route10EndBattleText6, Route10AfterBattleText6
	db -1 ; end

Route10Text1:
	text_asm
	ld hl, Route10TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route10BattleText1:
	text_far _Route10BattleText1
	text_end

Route10EndBattleText1:
	text_far _Route10EndBattleText1
	text_end

Route10AfterBattleText1:
	text_far _Route10AfterBattleText1
	text_end

Route10Text2:
	text_asm
	ld hl, Route10TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route10BattleText2:
	text_far _Route10BattleText2
	text_end

Route10EndBattleText2:
	text_far _Route10EndBattleText2
	text_end

Route10AfterBattleText2:
	text_far _Route10AfterBattleText2
	text_end

Route10Text3:
	text_asm
	ld hl, Route10TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route10BattleText3:
	text_far _Route10BattleText3
	text_end

Route10EndBattleText3:
	text_far _Route10EndBattleText3
	text_end

Route10AfterBattleText3:
	text_far _Route10AfterBattleText3
	text_end

Route10Text4:
	text_asm
	ld hl, Route10TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route10BattleText4:
	text_far _Route10BattleText4
	text_end

Route10EndBattleText4:
	text_far _Route10EndBattleText4
	text_end

Route10AfterBattleText4:
	text_far _Route10AfterBattleText4
	text_end

Route10Text5:
	text_asm
	ld hl, Route10TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route10BattleText5:
	text_far _Route10BattleText5
	text_end

Route10EndBattleText5:
	text_far _Route10EndBattleText5
	text_end

Route10AfterBattleText5:
	text_far _Route10AfterBattleText5
	text_end

Route10Text6:
	text_asm
	ld hl, Route10TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route10BattleText6:
	text_far _Route10BattleText6
	text_end

Route10EndBattleText6:
	text_far _Route10EndBattleText6
	text_end

Route10AfterBattleText6:
	text_far _Route10AfterBattleText6
	text_end

Route10Text9:
Route10Text7:
	text_far _Route10Text7 ; _Route10Text9
	text_end

Route10Text10:
	text_far _Route10Text10
	text_end
