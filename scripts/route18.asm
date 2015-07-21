Route18Script: ; 59ac7 (16:5ac7)
	call EnableAutoTextBoxDrawing
	ld hl, Route18TrainerHeaders
	ld de, Route18ScriptPointers
	ld a, [W_ROUTE18CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_ROUTE18CURSCRIPT], a
	ret

Route18ScriptPointers: ; 59ada (16:5ada)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route18TextPointers: ; 59ae0 (16:5ae0)
	dw Route18Text1
	dw Route18Text2
	dw Route18Text3
	dw Route18Text4
	dw Route18Text5

Route18TrainerHeaders: ; 59aea (16:5aea)
Route18TrainerHeader0: ; 59aea (16:5aea)
	dbEventFlagBit EVENT_BEAT_ROUTE_18_TRAINER_0
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_18_TRAINER_0
	dw Route18BattleText1 ; TextBeforeBattle
	dw Route18AfterBattleText1 ; TextAfterBattle
	dw Route18EndBattleText1 ; TextEndBattle
	dw Route18EndBattleText1 ; TextEndBattle

Route18TrainerHeader1: ; 59af6 (16:5af6)
	dbEventFlagBit EVENT_BEAT_ROUTE_18_TRAINER_1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_18_TRAINER_1
	dw Route18BattleText2 ; TextBeforeBattle
	dw Route18AfterBattleText2 ; TextAfterBattle
	dw Route18EndBattleText2 ; TextEndBattle
	dw Route18EndBattleText2 ; TextEndBattle

Route18TrainerHeader2: ; 59b02 (16:5b02)
	dbEventFlagBit EVENT_BEAT_ROUTE_18_TRAINER_2
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_18_TRAINER_2
	dw Route18BattleText3 ; TextBeforeBattle
	dw Route18AfterBattleText3 ; TextAfterBattle
	dw Route18EndBattleText3 ; TextEndBattle
	dw Route18EndBattleText3 ; TextEndBattle

	db $ff

Route18Text1: ; 59b0f (16:5b0f)
	TX_ASM
	ld hl, Route18TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route18BattleText1: ; 59b19 (16:5b19)
	TX_FAR _Route18BattleText1
	db "@"

Route18EndBattleText1: ; 59b1e (16:5b1e)
	TX_FAR _Route18EndBattleText1
	db "@"

Route18AfterBattleText1: ; 59b23 (16:5b23)
	TX_FAR _Route18AfterBattleText1
	db "@"

Route18Text2: ; 59b28 (16:5b28)
	TX_ASM
	ld hl, Route18TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route18BattleText2: ; 59b32 (16:5b32)
	TX_FAR _Route18BattleText2
	db "@"

Route18EndBattleText2: ; 59b37 (16:5b37)
	TX_FAR _Route18EndBattleText2
	db "@"

Route18AfterBattleText2: ; 59b3c (16:5b3c)
	TX_FAR _Route18AfterBattleText2
	db "@"

Route18Text3: ; 59b41 (16:5b41)
	TX_ASM
	ld hl, Route18TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route18BattleText3: ; 59b4b (16:5b4b)
	TX_FAR _Route18BattleText3
	db "@"

Route18EndBattleText3: ; 59b50 (16:5b50)
	TX_FAR _Route18EndBattleText3
	db "@"

Route18AfterBattleText3: ; 59b55 (16:5b55)
	TX_FAR _Route18AfterBattleText3
	db "@"

Route18Text4: ; 59b5a (16:5b5a)
	TX_FAR _Route18Text4
	db "@"

Route18Text5: ; 59b5f (16:5b5f)
	TX_FAR _Route18Text5
	db "@"
