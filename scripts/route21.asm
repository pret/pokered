Route21Script: ; 55eeb (15:5eeb)
	call EnableAutoTextBoxDrawing
	ld hl, Route21TrainerHeaders
	ld de, Route21ScriptPointers
	ld a, [W_ROUTE21CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_ROUTE21CURSCRIPT], a
	ret

Route21ScriptPointers: ; 55efe (15:5efe)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route21TextPointers: ; 55f04 (15:5f04)
	dw Route21Text1
	dw Route21Text2
	dw Route21Text3
	dw Route21Text4
	dw Route21Text5
	dw Route21Text6
	dw Route21Text7
	dw Route21Text8
	dw Route21Text9

Route21TrainerHeaders: ; 55f16 (15:5f16)
Route21TrainerHeader0: ; 55f16 (15:5f16)
	dbEventFlagBit EVENT_BEAT_ROUTE_21_TRAINER_0
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_21_TRAINER_0
	dw Route21BattleText1 ; TextBeforeBattle
	dw Route21AfterBattleText1 ; TextAfterBattle
	dw Route21EndBattleText1 ; TextEndBattle
	dw Route21EndBattleText1 ; TextEndBattle

Route21TrainerHeader1: ; 55f22 (15:5f22)
	dbEventFlagBit EVENT_BEAT_ROUTE_21_TRAINER_1
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_21_TRAINER_1
	dw Route21BattleText2 ; TextBeforeBattle
	dw Route21AfterBattleText2 ; TextAfterBattle
	dw Route21EndBattleText2 ; TextEndBattle
	dw Route21EndBattleText2 ; TextEndBattle

Route21TrainerHeader2: ; 55f2e (15:5f2e)
	dbEventFlagBit EVENT_BEAT_ROUTE_21_TRAINER_2
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_21_TRAINER_2
	dw Route21BattleText3 ; TextBeforeBattle
	dw Route21AfterBattleText3 ; TextAfterBattle
	dw Route21EndBattleText3 ; TextEndBattle
	dw Route21EndBattleText3 ; TextEndBattle

Route21TrainerHeader3: ; 55f3a (15:5f3a)
	dbEventFlagBit EVENT_BEAT_ROUTE_21_TRAINER_3
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_21_TRAINER_3
	dw Route21BattleText4 ; TextBeforeBattle
	dw Route21AfterBattleText4 ; TextAfterBattle
	dw Route21EndBattleText4 ; TextEndBattle
	dw Route21EndBattleText4 ; TextEndBattle

Route21TrainerHeader4: ; 55f46 (15:5f46)
	dbEventFlagBit EVENT_BEAT_ROUTE_21_TRAINER_4
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_21_TRAINER_4
	dw Route21BattleText5 ; TextBeforeBattle
	dw Route21AfterBattleText5 ; TextAfterBattle
	dw Route21EndBattleText5 ; TextEndBattle
	dw Route21EndBattleText5 ; TextEndBattle

Route21TrainerHeader5: ; 55f52 (15:5f52)
	dbEventFlagBit EVENT_BEAT_ROUTE_21_TRAINER_5
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_21_TRAINER_5
	dw Route21BattleText6 ; TextBeforeBattle
	dw Route21AfterBattleText6 ; TextAfterBattle
	dw Route21EndBattleText6 ; TextEndBattle
	dw Route21EndBattleText6 ; TextEndBattle

Route21TrainerHeader6: ; 55f5e (15:5f5e)
	dbEventFlagBit EVENT_BEAT_ROUTE_21_TRAINER_6
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_21_TRAINER_6
	dw Route21BattleText7 ; TextBeforeBattle
	dw Route21AfterBattleText7 ; TextAfterBattle
	dw Route21EndBattleText7 ; TextEndBattle
	dw Route21EndBattleText7 ; TextEndBattle

Route21TrainerHeader7: ; 55f6a (15:5f6a)
	dbEventFlagBit EVENT_BEAT_ROUTE_21_TRAINER_7, 1
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_21_TRAINER_7, 1
	dw Route21BattleText8 ; TextBeforeBattle
	dw Route21AfterBattleText8 ; TextAfterBattle
	dw Route21EndBattleText8 ; TextEndBattle
	dw Route21EndBattleText8 ; TextEndBattle

Route21TrainerHeader8: ; 55f76 (15:5f76)
	dbEventFlagBit EVENT_BEAT_ROUTE_21_TRAINER_8, 1
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_21_TRAINER_8, 1
	dw Route21BattleText9 ; TextBeforeBattle
	dw Route21AfterBattleText9 ; TextAfterBattle
	dw Route21EndBattleText9 ; TextEndBattle
	dw Route21EndBattleText9 ; TextEndBattle

	db $ff

Route21Text1: ; 55f83 (15:5f83)
	TX_ASM
	ld hl, Route21TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route21Text2: ; 55f8d (15:5f8d)
	TX_ASM
	ld hl, Route21TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route21Text3: ; 55f97 (15:5f97)
	TX_ASM
	ld hl, Route21TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route21Text4: ; 55fa1 (15:5fa1)
	TX_ASM
	ld hl, Route21TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route21Text5: ; 55fab (15:5fab)
	TX_ASM
	ld hl, Route21TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route21Text6: ; 55fb5 (15:5fb5)
	TX_ASM
	ld hl, Route21TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route21Text7: ; 55fbf (15:5fbf)
	TX_ASM
	ld hl, Route21TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route21Text8: ; 55fc9 (15:5fc9)
	TX_ASM
	ld hl, Route21TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route21Text9: ; 55fd3 (15:5fd3)
	TX_ASM
	ld hl, Route21TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route21BattleText1: ; 55fdd (15:5fdd)
	TX_FAR _Route21BattleText1
	db "@"

Route21EndBattleText1: ; 55fe2 (15:5fe2)
	TX_FAR _Route21EndBattleText1
	db "@"

Route21AfterBattleText1: ; 55fe7 (15:5fe7)
	TX_FAR _Route21AfterBattleText1
	db "@"

Route21BattleText2: ; 55fec (15:5fec)
	TX_FAR _Route21BattleText2
	db "@"

Route21EndBattleText2: ; 55ff1 (15:5ff1)
	TX_FAR _Route21EndBattleText2
	db "@"

Route21AfterBattleText2: ; 55ff6 (15:5ff6)
	TX_FAR _Route21AfterBattleText2
	db "@"

Route21BattleText3: ; 55ffb (15:5ffb)
	TX_FAR _Route21BattleText3
	db "@"

Route21EndBattleText3: ; 56000 (15:6000)
	TX_FAR _Route21EndBattleText3
	db "@"

Route21AfterBattleText3: ; 56005 (15:6005)
	TX_FAR _Route21AfterBattleText3
	db "@"

Route21BattleText4: ; 5600a (15:600a)
	TX_FAR _Route21BattleText4
	db "@"

Route21EndBattleText4: ; 5600f (15:600f)
	TX_FAR _Route21EndBattleText4
	db "@"

Route21AfterBattleText4: ; 56014 (15:6014)
	TX_FAR _Route21AfterBattleText4
	db "@"

Route21BattleText5: ; 56019 (15:6019)
	TX_FAR _Route21BattleText5
	db "@"

Route21EndBattleText5: ; 5601e (15:601e)
	TX_FAR _Route21EndBattleText5
	db "@"

Route21AfterBattleText5: ; 56023 (15:6023)
	TX_FAR _Route21AfterBattleText5
	db "@"

Route21BattleText6: ; 56028 (15:6028)
	TX_FAR _Route21BattleText6
	db "@"

Route21EndBattleText6: ; 5602d (15:602d)
	TX_FAR _Route21EndBattleText6
	db "@"

Route21AfterBattleText6: ; 56032 (15:6032)
	TX_FAR _Route21AfterBattleText6
	db "@"

Route21BattleText7: ; 56037 (15:6037)
	TX_FAR _Route21BattleText7
	db "@"

Route21EndBattleText7: ; 5603c (15:603c)
	TX_FAR _Route21EndBattleText7
	db "@"

Route21AfterBattleText7: ; 56041 (15:6041)
	TX_FAR _Route21AfterBattleText7
	db "@"

Route21BattleText8: ; 56046 (15:6046)
	TX_FAR _Route21BattleText8
	db "@"

Route21EndBattleText8: ; 5604b (15:604b)
	TX_FAR _Route21EndBattleText8
	db "@"

Route21AfterBattleText8: ; 56050 (15:6050)
	TX_FAR _Route21AfterBattleText8
	db "@"

Route21BattleText9: ; 56055 (15:6055)
	TX_FAR _Route21BattleText9
	db "@"

Route21EndBattleText9: ; 5605a (15:605a)
	TX_FAR _Route21EndBattleText9
	db "@"

Route21AfterBattleText9: ; 5605f (15:605f)
	TX_FAR _Route21AfterBattleText9
	db "@"
