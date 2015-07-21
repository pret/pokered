Route6Script: ; 590b0 (16:50b0)
	call EnableAutoTextBoxDrawing
	ld hl, Route6TrainerHeaders
	ld de, Route6ScriptPointers
	ld a, [W_ROUTE6CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_ROUTE6CURSCRIPT], a
	ret

Route6ScriptPointers: ; 590c3 (16:50c3)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route6TextPointers: ; 590c9 (16:50c9)
	dw Route6Text1
	dw Route6Text2
	dw Route6Text3
	dw Route6Text4
	dw Route6Text5
	dw Route6Text6
	dw Route6Text7

Route6TrainerHeaders: ; 590d7 (16:50d7)
Route6TrainerHeader0: ; 590d7 (16:50d7)
	dbEventFlagBit EVENT_BEAT_ROUTE_6_TRAINER_0
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_6_TRAINER_0
	dw Route6BattleText1 ; TextBeforeBattle
	dw Route6AfterBattleText1 ; TextAfterBattle
	dw Route6EndBattleText1 ; TextEndBattle
	dw Route6EndBattleText1 ; TextEndBattle

Route6TrainerHeader1: ; 590e3 (16:50e3)
	dbEventFlagBit EVENT_BEAT_ROUTE_6_TRAINER_1
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_6_TRAINER_1
	dw Route6BattleText2 ; TextBeforeBattle
	dw Route6AfterBattleText1 ; TextAfterBattle
	dw Route6EndBattleText2 ; TextEndBattle
	dw Route6EndBattleText2 ; TextEndBattle

Route6TrainerHeader2: ; 590ef (16:50ef)
	dbEventFlagBit EVENT_BEAT_ROUTE_6_TRAINER_2
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_6_TRAINER_2
	dw Route6BattleText3 ; TextBeforeBattle
	dw Route6AfterBattleText3 ; TextAfterBattle
	dw Route6EndBattleText3 ; TextEndBattle
	dw Route6EndBattleText3 ; TextEndBattle

Route6TrainerHeader3: ; 590fb (16:50fb)
	dbEventFlagBit EVENT_BEAT_ROUTE_6_TRAINER_3
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_6_TRAINER_3
	dw Route6BattleText4 ; TextBeforeBattle
	dw Route6AfterBattleText4 ; TextAfterBattle
	dw Route6EndBattleText4 ; TextEndBattle
	dw Route6EndBattleText4 ; TextEndBattle

Route6TrainerHeader4: ; 59107 (16:5107)
	dbEventFlagBit EVENT_BEAT_ROUTE_6_TRAINER_4
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_6_TRAINER_4
	dw Route6BattleText5 ; TextBeforeBattle
	dw Route6AfterBattleText5 ; TextAfterBattle
	dw Route6EndBattleText5 ; TextEndBattle
	dw Route6EndBattleText5 ; TextEndBattle

Route6TrainerHeader5: ; 59113 (16:5113)
	dbEventFlagBit EVENT_BEAT_ROUTE_6_TRAINER_5
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_6_TRAINER_5
	dw Route6BattleText6 ; TextBeforeBattle
	dw Route6AfterBattleText6 ; TextAfterBattle
	dw Route6EndBattleText6 ; TextEndBattle
	dw Route6EndBattleText6 ; TextEndBattle

	db $ff

Route6Text1: ; 59120 (16:5120)
	TX_ASM
	ld hl, Route6TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route6BattleText1: ; 5912a (16:512a)
	TX_FAR _Route6BattleText1
	db "@"

Route6EndBattleText1: ; 5912f (16:512f)
	TX_FAR _Route6EndBattleText1
	db "@"

Route6AfterBattleText1: ; 59134 (16:5134)
	TX_FAR _Route6AfterBattleText1
	db "@"

Route6Text2: ; 59139 (16:5139)
	TX_ASM
	ld hl, Route6TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route6BattleText2: ; 59143 (16:5143)
	TX_FAR _Route6BattleText2
	db "@"

Route6EndBattleText2: ; 59148 (16:5148)
	TX_FAR _Route6EndBattleText2
	db "@"

Route6Text3: ; 5914d (16:514d)
	TX_ASM
	ld hl, Route6TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route6BattleText3: ; 59157 (16:5157)
	TX_FAR _Route6BattleText3
	db "@"

Route6EndBattleText3: ; 5915c (16:515c)
	TX_FAR _Route6EndBattleText3
	db "@"

Route6AfterBattleText3: ; 59161 (16:5161)
	TX_FAR _Route6AfterBattleText3
	db "@"

Route6Text4: ; 59166 (16:5166)
	TX_ASM
	ld hl, Route6TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route6BattleText4: ; 59170 (16:5170)
	TX_FAR _Route6BattleText4
	db "@"

Route6EndBattleText4: ; 59175 (16:5175)
	TX_FAR _Route6EndBattleText4
	db "@"

Route6AfterBattleText4: ; 5917a (16:517a)
	TX_FAR _Route6AfterBattleText4
	db "@"

Route6Text5: ; 5917f (16:517f)
	TX_ASM
	ld hl, Route6TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route6BattleText5: ; 59189 (16:5189)
	TX_FAR _Route6BattleText5
	db "@"

Route6EndBattleText5: ; 5918e (16:518e)
	TX_FAR _Route6EndBattleText5
	db "@"

Route6AfterBattleText5: ; 59193 (16:5193)
	TX_FAR _Route6AfterBattleText5
	db "@"

Route6Text6: ; 59198 (16:5198)
	TX_ASM
	ld hl, Route6TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route6BattleText6: ; 591a2 (16:51a2)
	TX_FAR _Route6BattleText6
	db "@"

Route6EndBattleText6: ; 591a7 (16:51a7)
	TX_FAR _Route6EndBattleText6
	db "@"

Route6AfterBattleText6: ; 591ac (16:51ac)
	TX_FAR _Route6AfterBattleText6
	db "@"

Route6Text7: ; 591b1 (16:51b1)
	TX_FAR _Route6Text7
	db "@"
