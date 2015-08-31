RockTunnel1Script: ; 444dc (11:44dc)
	call EnableAutoTextBoxDrawing
	ld hl, RockTunnel1TrainerHeaders
	ld de, RockTunnel1ScriptPointers
	ld a, [wRockTunnel1CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRockTunnel1CurScript], a
	ret

RockTunnel1ScriptPointers: ; 444ef (11:44ef)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

RockTunnel1TextPointers: ; 444f5 (11:44f5)
	dw RockTunnel1Text1
	dw RockTunnel1Text2
	dw RockTunnel1Text3
	dw RockTunnel1Text4
	dw RockTunnel1Text5
	dw RockTunnel1Text6
	dw RockTunnel1Text7
	dw RockTunnel1Text8

RockTunnel1TrainerHeaders: ; 44505 (11:4505)
RockTunnel1TrainerHeader1: ; 44505 (11:4505)
	dbEventFlagBit EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_1
	dw RockTunnel1BattleText1 ; TextBeforeBattle
	dw RockTunnel1AfterBattleText1 ; TextAfterBattle
	dw RockTunnel1EndBattleText1 ; TextEndBattle
	dw RockTunnel1EndBattleText1 ; TextEndBattle

RockTunnel1TrainerHeader2: ; 44511 (11:4511)
	dbEventFlagBit EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_2
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_2
	dw RockTunnel1BattleText2 ; TextBeforeBattle
	dw RockTunnel1AfterBattleText2 ; TextAfterBattle
	dw RockTunnel1EndBattleText2 ; TextEndBattle
	dw RockTunnel1EndBattleText2 ; TextEndBattle

RockTunnel1TrainerHeader3: ; 4451d (11:451d)
	dbEventFlagBit EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_3
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_3
	dw RockTunnel1BattleText3 ; TextBeforeBattle
	dw RockTunnel1AfterBattleText3 ; TextAfterBattle
	dw RockTunnel1EndBattleText3 ; TextEndBattle
	dw RockTunnel1EndBattleText3 ; TextEndBattle

RockTunnel1TrainerHeader4: ; 44529 (11:4529)
	dbEventFlagBit EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_4
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_4
	dw RockTunnel1BattleText4 ; TextBeforeBattle
	dw RockTunnel1AfterBattleText4 ; TextAfterBattle
	dw RockTunnel1EndBattleText4 ; TextEndBattle
	dw RockTunnel1EndBattleText4 ; TextEndBattle

RockTunnel1TrainerHeader5: ; 44535 (11:4535)
	dbEventFlagBit EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_5
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_5
	dw RockTunnel1BattleText5 ; TextBeforeBattle
	dw RockTunnel1AfterBattleText5 ; TextAfterBattle
	dw RockTunnel1EndBattleText5 ; TextEndBattle
	dw RockTunnel1EndBattleText5 ; TextEndBattle

RockTunnel1TrainerHeader6: ; 44541 (11:4541)
	dbEventFlagBit EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_6
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_6
	dw RockTunnel1BattleText6 ; TextBeforeBattle
	dw RockTunnel1AfterBattleText6 ; TextAfterBattle
	dw RockTunnel1EndBattleText6 ; TextEndBattle
	dw RockTunnel1EndBattleText6 ; TextEndBattle

RockTunnel1TrainerHeader7: ; 4454d (11:454d)
	dbEventFlagBit EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_7
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_7
	dw RockTunnel1BattleText7 ; TextBeforeBattle
	dw RockTunnel1AfterBattleText7 ; TextAfterBattle
	dw RockTunnel1EndBattleText7 ; TextEndBattle
	dw RockTunnel1EndBattleText7 ; TextEndBattle

	db $ff

RockTunnel1Text1: ; 4455a (11:455a)
	TX_ASM
	ld hl, RockTunnel1TrainerHeader1
	jr RockTunnel1TalkToTrainer

RockTunnel1Text2: ; 44560 (11:4560)
	TX_ASM
	ld hl, RockTunnel1TrainerHeader2
	jr RockTunnel1TalkToTrainer

RockTunnel1Text3: ; 44566 (11:4566)
	TX_ASM
	ld hl, RockTunnel1TrainerHeader3
	jr RockTunnel1TalkToTrainer

RockTunnel1Text4: ; 4456c (11:456c)
	TX_ASM
	ld hl, RockTunnel1TrainerHeader4
	jr RockTunnel1TalkToTrainer

RockTunnel1Text5: ; 44572 (11:4572)
	TX_ASM
	ld hl, RockTunnel1TrainerHeader5
	jr RockTunnel1TalkToTrainer

RockTunnel1Text6: ; 44578 (11:4578)
	TX_ASM
	ld hl, RockTunnel1TrainerHeader6
	jr RockTunnel1TalkToTrainer

RockTunnel1Text7: ; 4457e (11:457e)
	TX_ASM
	ld hl, RockTunnel1TrainerHeader7
RockTunnel1TalkToTrainer: ; 44582 (11:4582)
	call TalkToTrainer
	jp TextScriptEnd

RockTunnel1BattleText1: ; 44588 (11:4588)
	TX_FAR _RockTunnel1BattleText1
	db "@"

RockTunnel1EndBattleText1: ; 4458d (11:458d)
	TX_FAR _RockTunnel1EndBattleText1
	db "@"

RockTunnel1AfterBattleText1: ; 44592 (11:4592)
	TX_FAR _RockTunnel1AfterBattleText1
	db "@"

RockTunnel1BattleText2: ; 44597 (11:4597)
	TX_FAR _RockTunnel1BattleText2
	db "@"

RockTunnel1EndBattleText2: ; 4459c (11:459c)
	TX_FAR _RockTunnel1EndBattleText2
	db "@"

RockTunnel1AfterBattleText2: ; 445a1 (11:45a1)
	TX_FAR _RockTunnel1AfterBattleText2
	db "@"

RockTunnel1BattleText3: ; 445a6 (11:45a6)
	TX_FAR _RockTunnel1BattleText3
	db "@"

RockTunnel1EndBattleText3: ; 445ab (11:45ab)
	TX_FAR _RockTunnel1EndBattleText3
	db "@"

RockTunnel1AfterBattleText3: ; 445b0 (11:45b0)
	TX_FAR _RockTunnel1AfterBattleText3
	db "@"

RockTunnel1BattleText4: ; 445b5 (11:45b5)
	TX_FAR _RockTunnel1BattleText4
	db "@"

RockTunnel1EndBattleText4: ; 445ba (11:45ba)
	TX_FAR _RockTunnel1EndBattleText4
	db "@"

RockTunnel1AfterBattleText4: ; 445bf (11:45bf)
	TX_FAR _RockTunnel1AfterBattleText4
	db "@"

RockTunnel1BattleText5: ; 445c4 (11:45c4)
	TX_FAR _RockTunnel1BattleText5
	db "@"

RockTunnel1EndBattleText5: ; 445c9 (11:45c9)
	TX_FAR _RockTunnel1EndBattleText5
	db "@"

RockTunnel1AfterBattleText5: ; 445ce (11:45ce)
	TX_FAR _RockTunnel1AfterBattleText5
	db "@"

RockTunnel1BattleText6: ; 445d3 (11:45d3)
	TX_FAR _RockTunnel1BattleText6
	db "@"

RockTunnel1EndBattleText6: ; 445d8 (11:45d8)
	TX_FAR _RockTunnel1EndBattleText6
	db "@"

RockTunnel1AfterBattleText6: ; 445dd (11:45dd)
	TX_FAR _RockTunnel1AfterBattleText6
	db "@"

RockTunnel1BattleText7: ; 445e2 (11:45e2)
	TX_FAR _RockTunnel1BattleText7
	db "@"

RockTunnel1EndBattleText7: ; 445e7 (11:45e7)
	TX_FAR _RockTunnel1EndBattleText7
	db "@"

RockTunnel1AfterBattleText7: ; 445ec (11:45ec)
	TX_FAR _RockTunnel1AfterBattleText7
	db "@"

RockTunnel1Text8: ; 445f1 (11:45f1)
	TX_FAR _RockTunnel1Text8
	db "@"
