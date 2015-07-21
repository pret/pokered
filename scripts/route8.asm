Route8Script: ; 591b6 (16:51b6)
	call EnableAutoTextBoxDrawing
	ld hl, Route8TrainerHeaders
	ld de, Route8ScriptPointers
	ld a, [W_ROUTE8CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_ROUTE8CURSCRIPT], a
	ret

Route8ScriptPointers: ; 591c9 (16:51c9)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route8TextPointers: ; 591cf (16:51cf)
	dw Route8Text1
	dw Route8Text2
	dw Route8Text3
	dw Route8Text4
	dw Route8Text5
	dw Route8Text6
	dw Route8Text7
	dw Route8Text8
	dw Route8Text9
	dw Route8Text10

Route8TrainerHeaders: ; 591e3 (16:51e3)
Route8TrainerHeader0: ; 591e3 (16:51e3)
	dbEventFlagBit EVENT_BEAT_ROUTE_8_TRAINER_0
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_8_TRAINER_0
	dw Route8BattleText1 ; TextBeforeBattle
	dw Route8AfterBattleText1 ; TextAfterBattle
	dw Route8EndBattleText1 ; TextEndBattle
	dw Route8EndBattleText1 ; TextEndBattle

Route8TrainerHeader1: ; 591ef (16:51ef)
	dbEventFlagBit EVENT_BEAT_ROUTE_8_TRAINER_1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_8_TRAINER_1
	dw Route8BattleText2 ; TextBeforeBattle
	dw Route8AfterBattleText2 ; TextAfterBattle
	dw Route8EndBattleText2 ; TextEndBattle
	dw Route8EndBattleText2 ; TextEndBattle

Route8TrainerHeader2: ; 591fb (16:51fb)
	dbEventFlagBit EVENT_BEAT_ROUTE_8_TRAINER_2
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_8_TRAINER_2
	dw Route8BattleText3 ; TextBeforeBattle
	dw Route8AfterBattleText3 ; TextAfterBattle
	dw Route8EndBattleText3 ; TextEndBattle
	dw Route8EndBattleText3 ; TextEndBattle

Route8TrainerHeader3: ; 59207 (16:5207)
	dbEventFlagBit EVENT_BEAT_ROUTE_8_TRAINER_3
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_8_TRAINER_3
	dw Route8BattleText4 ; TextBeforeBattle
	dw Route8AfterBattleText4 ; TextAfterBattle
	dw Route8EndBattleText4 ; TextEndBattle
	dw Route8EndBattleText4 ; TextEndBattle

Route8TrainerHeader4: ; 59213 (16:5213)
	dbEventFlagBit EVENT_BEAT_ROUTE_8_TRAINER_4
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_8_TRAINER_4
	dw Route8BattleText5 ; TextBeforeBattle
	dw Route8AfterBattleText5 ; TextAfterBattle
	dw Route8EndBattleText5 ; TextEndBattle
	dw Route8EndBattleText5 ; TextEndBattle

Route8TrainerHeader5: ; 5921f (16:521f)
	dbEventFlagBit EVENT_BEAT_ROUTE_8_TRAINER_5
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_8_TRAINER_5
	dw Route8BattleText6 ; TextBeforeBattle
	dw Route8AfterBattleText6 ; TextAfterBattle
	dw Route8EndBattleText6 ; TextEndBattle
	dw Route8EndBattleText6 ; TextEndBattle

Route8TrainerHeader6: ; 5922b (16:522b)
	dbEventFlagBit EVENT_BEAT_ROUTE_8_TRAINER_6
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_8_TRAINER_6
	dw Route8BattleText7 ; TextBeforeBattle
	dw Route8AfterBattleText7 ; TextAfterBattle
	dw Route8EndBattleText7 ; TextEndBattle
	dw Route8EndBattleText7 ; TextEndBattle

Route8TrainerHeader7: ; 59237 (16:5237)
	dbEventFlagBit EVENT_BEAT_ROUTE_8_TRAINER_7, 1
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_8_TRAINER_7, 1
	dw Route8BattleText8 ; TextBeforeBattle
	dw Route8AfterBattleText8 ; TextAfterBattle
	dw Route8EndBattleText8 ; TextEndBattle
	dw Route8EndBattleText8 ; TextEndBattle

Route8TrainerHeader8: ; 59243 (16:5243)
	dbEventFlagBit EVENT_BEAT_ROUTE_8_TRAINER_8, 1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_8_TRAINER_8, 1
	dw Route8BattleText9 ; TextBeforeBattle
	dw Route8AfterBattleText9 ; TextAfterBattle
	dw Route8EndBattleText9 ; TextEndBattle
	dw Route8EndBattleText9 ; TextEndBattle

	db $ff

Route8Text1: ; 59250 (16:5250)
	TX_ASM
	ld hl, Route8TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText1: ; 5925a (16:525a)
	TX_FAR _Route8BattleText1
	db "@"

Route8EndBattleText1: ; 5925f (16:525f)
	TX_FAR _Route8EndBattleText1
	db "@"

Route8AfterBattleText1: ; 59264 (16:5264)
	TX_FAR _Route8AfterBattleText1
	db "@"

Route8Text2: ; 59269 (16:5269)
	TX_ASM
	ld hl, Route8TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText2: ; 59273 (16:5273)
	TX_FAR _Route8BattleText2
	db "@"

Route8EndBattleText2: ; 59278 (16:5278)
	TX_FAR _Route8EndBattleText2
	db "@"

Route8AfterBattleText2: ; 5927d (16:527d)
	TX_FAR _Route8AfterBattleText2
	db "@"

Route8Text3: ; 59282 (16:5282)
	TX_ASM
	ld hl, Route8TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText3: ; 5928c (16:528c)
	TX_FAR _Route8BattleText3
	db "@"

Route8EndBattleText3: ; 59291 (16:5291)
	TX_FAR _Route8EndBattleText3
	db "@"

Route8AfterBattleText3: ; 59296 (16:5296)
	TX_FAR _Route8AfterBattleText3
	db "@"

Route8Text4: ; 5929b (16:529b)
	TX_ASM
	ld hl, Route8TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText4: ; 592a5 (16:52a5)
	TX_FAR _Route8BattleText4
	db "@"

Route8EndBattleText4: ; 592aa (16:52aa)
	TX_FAR _Route8EndBattleText4
	db "@"

Route8AfterBattleText4: ; 592af (16:52af)
	TX_FAR _Route8AfterBattleText4
	db "@"

Route8Text5: ; 592b4 (16:52b4)
	TX_ASM
	ld hl, Route8TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText5: ; 592be (16:52be)
	TX_FAR _Route8BattleText5
	db "@"

Route8EndBattleText5: ; 592c3 (16:52c3)
	TX_FAR _Route8EndBattleText5
	db "@"

Route8AfterBattleText5: ; 592c8 (16:52c8)
	TX_FAR _Route8AfterBattleText5
	db "@"

Route8Text6: ; 592cd (16:52cd)
	TX_ASM
	ld hl, Route8TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText6: ; 592d7 (16:52d7)
	TX_FAR _Route8BattleText6
	db "@"

Route8EndBattleText6: ; 592dc (16:52dc)
	TX_FAR _Route8EndBattleText6
	db "@"

Route8AfterBattleText6: ; 592e1 (16:52e1)
	TX_FAR _Route8AfterBattleText6
	db "@"

Route8Text7: ; 592e6 (16:52e6)
	TX_ASM
	ld hl, Route8TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText7: ; 592f0 (16:52f0)
	TX_FAR _Route8BattleText7
	db "@"

Route8EndBattleText7: ; 592f5 (16:52f5)
	TX_FAR _Route8EndBattleText7
	db "@"

Route8AfterBattleText7: ; 592fa (16:52fa)
	TX_FAR _Route8AfterBattleText7
	db "@"

Route8Text8: ; 592ff (16:52ff)
	TX_ASM
	ld hl, Route8TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText8: ; 59309 (16:5309)
	TX_FAR _Route8BattleText8
	db "@"

Route8EndBattleText8: ; 5930e (16:530e)
	TX_FAR _Route8EndBattleText8
	db "@"

Route8AfterBattleText8: ; 59313 (16:5313)
	TX_FAR _Route8AfterBattleText8
	db "@"

Route8Text9: ; 59318 (16:5318)
	TX_ASM
	ld hl, Route8TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText9: ; 59322 (16:5322)
	TX_FAR _Route8BattleText9
	db "@"

Route8EndBattleText9: ; 59327 (16:5327)
	TX_FAR _Route8EndBattleText9
	db "@"

Route8AfterBattleText9: ; 5932c (16:532c)
	TX_FAR _Route8AfterBattleText9
	db "@"

Route8Text10: ; 59331 (16:5331)
	TX_FAR _Route8Text10
	db "@"
