RockTunnelB1F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, RockTunnel2TrainerHeader0
	ld de, RockTunnelB1F_ScriptPointers
	ld a, [wRockTunnelB1FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wRockTunnelB1FCurScript], a
	ret

RockTunnelB1F_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

RockTunnelB1F_TextPointers:
	dw RockTunnel2Text1
	dw RockTunnel2Text2
	dw RockTunnel2Text3
	dw RockTunnel2Text4
	dw RockTunnel2Text5
	dw RockTunnel2Text6
	dw RockTunnel2Text7
	dw RockTunnel2Text8

RockTunnel2TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_ROCK_TUNNEL_2_TRAINER_0
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROCK_TUNNEL_2_TRAINER_0
	dw RockTunnel2BattleText2 ; TextBeforeBattle
	dw RockTunnel2AfterBattleText2 ; TextAfterBattle
	dw RockTunnel2EndBattleText2 ; TextEndBattle
	dw RockTunnel2EndBattleText2 ; TextEndBattle

RockTunnel2TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_ROCK_TUNNEL_2_TRAINER_1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROCK_TUNNEL_2_TRAINER_1
	dw RockTunnel2BattleText3 ; TextBeforeBattle
	dw RockTunnel2AfterBattleText3 ; TextAfterBattle
	dw RockTunnel2EndBattleText3 ; TextEndBattle
	dw RockTunnel2EndBattleText3 ; TextEndBattle

RockTunnel2TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_ROCK_TUNNEL_2_TRAINER_2
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROCK_TUNNEL_2_TRAINER_2
	dw RockTunnel2BattleText4 ; TextBeforeBattle
	dw RockTunnel2AfterBattleText4 ; TextAfterBattle
	dw RockTunnel2EndBattleText4 ; TextEndBattle
	dw RockTunnel2EndBattleText4 ; TextEndBattle

RockTunnel2TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_ROCK_TUNNEL_2_TRAINER_3
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROCK_TUNNEL_2_TRAINER_3
	dw RockTunnel2BattleText5 ; TextBeforeBattle
	dw RockTunnel2AfterBattleText5 ; TextAfterBattle
	dw RockTunnel2EndBattleText5 ; TextEndBattle
	dw RockTunnel2EndBattleText5 ; TextEndBattle

RockTunnel2TrainerHeader4:
	dbEventFlagBit EVENT_BEAT_ROCK_TUNNEL_2_TRAINER_4
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROCK_TUNNEL_2_TRAINER_4
	dw RockTunnel2BattleText6 ; TextBeforeBattle
	dw RockTunnel2AfterBattleText6 ; TextAfterBattle
	dw RockTunnel2EndBattleText6 ; TextEndBattle
	dw RockTunnel2EndBattleText6 ; TextEndBattle

RockTunnel2TrainerHeader5:
	dbEventFlagBit EVENT_BEAT_ROCK_TUNNEL_2_TRAINER_5
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROCK_TUNNEL_2_TRAINER_5
	dw RockTunnel2BattleText7 ; TextBeforeBattle
	dw RockTunnel2AfterBattleText7 ; TextAfterBattle
	dw RockTunnel2EndBattleText7 ; TextEndBattle
	dw RockTunnel2EndBattleText7 ; TextEndBattle

RockTunnel2TrainerHeader6:
	dbEventFlagBit EVENT_BEAT_ROCK_TUNNEL_2_TRAINER_6
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROCK_TUNNEL_2_TRAINER_6
	dw RockTunnel2BattleText8 ; TextBeforeBattle
	dw RockTunnel2AfterBattleText8 ; TextAfterBattle
	dw RockTunnel2EndBattleText8 ; TextEndBattle
	dw RockTunnel2EndBattleText8 ; TextEndBattle

RockTunnel2TrainerHeader7:
	dbEventFlagBit EVENT_BEAT_ROCK_TUNNEL_2_TRAINER_7, 1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROCK_TUNNEL_2_TRAINER_7, 1
	dw RockTunnel2BattleText9 ; TextBeforeBattle
	dw RockTunnel2AfterBattleText9 ; TextAfterBattle
	dw RockTunnel2EndBattleText9 ; TextEndBattle
	dw RockTunnel2EndBattleText9 ; TextEndBattle

	db $ff

RockTunnel2Text1:
	TX_ASM
	ld hl, RockTunnel2TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

RockTunnel2Text2:
	TX_ASM
	ld hl, RockTunnel2TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

RockTunnel2Text3:
	TX_ASM
	ld hl, RockTunnel2TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

RockTunnel2Text4:
	TX_ASM
	ld hl, RockTunnel2TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

RockTunnel2Text5:
	TX_ASM
	ld hl, RockTunnel2TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

RockTunnel2Text6:
	TX_ASM
	ld hl, RockTunnel2TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

RockTunnel2Text7:
	TX_ASM
	ld hl, RockTunnel2TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

RockTunnel2Text8:
	TX_ASM
	ld hl, RockTunnel2TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

RockTunnel2BattleText2:
	TX_FAR _RockTunnel2BattleText2
	db "@"

RockTunnel2EndBattleText2:
	TX_FAR _RockTunnel2EndBattleText2
	db "@"

RockTunnel2AfterBattleText2:
	TX_FAR _RockTunnel2AfterBattleText2
	db "@"

RockTunnel2BattleText3:
	TX_FAR _RockTunnel2BattleText3
	db "@"

RockTunnel2EndBattleText3:
	TX_FAR _RockTunnel2EndBattleText3
	db "@"

RockTunnel2AfterBattleText3:
	TX_FAR _RockTunnel2AfterBattleText3
	db "@"

RockTunnel2BattleText4:
	TX_FAR _RockTunnel2BattleText4
	db "@"

RockTunnel2EndBattleText4:
	TX_FAR _RockTunnel2EndBattleText4
	db "@"

RockTunnel2AfterBattleText4:
	TX_FAR _RockTunnel2AfterBattleText4
	db "@"

RockTunnel2BattleText5:
	TX_FAR _RockTunnel2BattleText5
	db "@"

RockTunnel2EndBattleText5:
	TX_FAR _RockTunnel2EndBattleText5
	db "@"

RockTunnel2AfterBattleText5:
	TX_FAR _RockTunnel2AfterBattleText5
	db "@"

RockTunnel2BattleText6:
	TX_FAR _RockTunnel2BattleText6
	db "@"

RockTunnel2EndBattleText6:
	TX_FAR _RockTunnel2EndBattleText6
	db "@"

RockTunnel2AfterBattleText6:
	TX_FAR _RockTunnel2AfterBattleText6
	db "@"

RockTunnel2BattleText7:
	TX_FAR _RockTunnel2BattleText7
	db "@"

RockTunnel2EndBattleText7:
	TX_FAR _RockTunnel2EndBattleText7
	db "@"

RockTunnel2AfterBattleText7:
	TX_FAR _RockTunnel2AfterBattleText7
	db "@"

RockTunnel2BattleText8:
	TX_FAR _RockTunnel2BattleText8
	db "@"

RockTunnel2EndBattleText8:
	TX_FAR _RockTunnel2EndBattleText8
	db "@"

RockTunnel2AfterBattleText8:
	TX_FAR _RockTunnel2AfterBattleText8
	db "@"

RockTunnel2BattleText9:
	TX_FAR _RockTunnel2BattleText9
	db "@"

RockTunnel2EndBattleText9:
	TX_FAR _RockTunnel2EndBattleText9
	db "@"

RockTunnel2AfterBattleText9:
	TX_FAR _RockTunnel2AfterBattleText9
	db "@"
