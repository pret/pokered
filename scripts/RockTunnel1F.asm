RockTunnel1F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, RockTunnel1TrainerHeader0
	ld de, RockTunnel1F_ScriptPointers
	ld a, [wRockTunnel1FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wRockTunnel1FCurScript], a
	ret

RockTunnel1F_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

RockTunnel1F_TextPointers:
	dw RockTunnel1Text1
	dw RockTunnel1Text2
	dw RockTunnel1Text3
	dw RockTunnel1Text4
	dw RockTunnel1Text5
	dw RockTunnel1Text6
	dw RockTunnel1Text7
	dw RockTunnel1Text8

RockTunnel1TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_0
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_0
	dw RockTunnel1BattleText1 ; TextBeforeBattle
	dw RockTunnel1AfterBattleText1 ; TextAfterBattle
	dw RockTunnel1EndBattleText1 ; TextEndBattle
	dw RockTunnel1EndBattleText1 ; TextEndBattle

RockTunnel1TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_1
	dw RockTunnel1BattleText2 ; TextBeforeBattle
	dw RockTunnel1AfterBattleText2 ; TextAfterBattle
	dw RockTunnel1EndBattleText2 ; TextEndBattle
	dw RockTunnel1EndBattleText2 ; TextEndBattle

RockTunnel1TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_2
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_2
	dw RockTunnel1BattleText3 ; TextBeforeBattle
	dw RockTunnel1AfterBattleText3 ; TextAfterBattle
	dw RockTunnel1EndBattleText3 ; TextEndBattle
	dw RockTunnel1EndBattleText3 ; TextEndBattle

RockTunnel1TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_3
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_3
	dw RockTunnel1BattleText4 ; TextBeforeBattle
	dw RockTunnel1AfterBattleText4 ; TextAfterBattle
	dw RockTunnel1EndBattleText4 ; TextEndBattle
	dw RockTunnel1EndBattleText4 ; TextEndBattle

RockTunnel1TrainerHeader4:
	dbEventFlagBit EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_4
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_4
	dw RockTunnel1BattleText5 ; TextBeforeBattle
	dw RockTunnel1AfterBattleText5 ; TextAfterBattle
	dw RockTunnel1EndBattleText5 ; TextEndBattle
	dw RockTunnel1EndBattleText5 ; TextEndBattle

RockTunnel1TrainerHeader5:
	dbEventFlagBit EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_5
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_5
	dw RockTunnel1BattleText6 ; TextBeforeBattle
	dw RockTunnel1AfterBattleText6 ; TextAfterBattle
	dw RockTunnel1EndBattleText6 ; TextEndBattle
	dw RockTunnel1EndBattleText6 ; TextEndBattle

RockTunnel1TrainerHeader6:
	dbEventFlagBit EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_6
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_6
	dw RockTunnel1BattleText7 ; TextBeforeBattle
	dw RockTunnel1AfterBattleText7 ; TextAfterBattle
	dw RockTunnel1EndBattleText7 ; TextEndBattle
	dw RockTunnel1EndBattleText7 ; TextEndBattle

	db $ff

RockTunnel1Text1:
	text_asm
	ld hl, RockTunnel1TrainerHeader0
	jr RockTunnel1TalkToTrainer

RockTunnel1Text2:
	text_asm
	ld hl, RockTunnel1TrainerHeader1
	jr RockTunnel1TalkToTrainer

RockTunnel1Text3:
	text_asm
	ld hl, RockTunnel1TrainerHeader2
	jr RockTunnel1TalkToTrainer

RockTunnel1Text4:
	text_asm
	ld hl, RockTunnel1TrainerHeader3
	jr RockTunnel1TalkToTrainer

RockTunnel1Text5:
	text_asm
	ld hl, RockTunnel1TrainerHeader4
	jr RockTunnel1TalkToTrainer

RockTunnel1Text6:
	text_asm
	ld hl, RockTunnel1TrainerHeader5
	jr RockTunnel1TalkToTrainer

RockTunnel1Text7:
	text_asm
	ld hl, RockTunnel1TrainerHeader6
RockTunnel1TalkToTrainer:
	call TalkToTrainer
	jp TextScriptEnd

RockTunnel1BattleText1:
	text_far _RockTunnel1BattleText1
	text_end

RockTunnel1EndBattleText1:
	text_far _RockTunnel1EndBattleText1
	text_end

RockTunnel1AfterBattleText1:
	text_far _RockTunnel1AfterBattleText1
	text_end

RockTunnel1BattleText2:
	text_far _RockTunnel1BattleText2
	text_end

RockTunnel1EndBattleText2:
	text_far _RockTunnel1EndBattleText2
	text_end

RockTunnel1AfterBattleText2:
	text_far _RockTunnel1AfterBattleText2
	text_end

RockTunnel1BattleText3:
	text_far _RockTunnel1BattleText3
	text_end

RockTunnel1EndBattleText3:
	text_far _RockTunnel1EndBattleText3
	text_end

RockTunnel1AfterBattleText3:
	text_far _RockTunnel1AfterBattleText3
	text_end

RockTunnel1BattleText4:
	text_far _RockTunnel1BattleText4
	text_end

RockTunnel1EndBattleText4:
	text_far _RockTunnel1EndBattleText4
	text_end

RockTunnel1AfterBattleText4:
	text_far _RockTunnel1AfterBattleText4
	text_end

RockTunnel1BattleText5:
	text_far _RockTunnel1BattleText5
	text_end

RockTunnel1EndBattleText5:
	text_far _RockTunnel1EndBattleText5
	text_end

RockTunnel1AfterBattleText5:
	text_far _RockTunnel1AfterBattleText5
	text_end

RockTunnel1BattleText6:
	text_far _RockTunnel1BattleText6
	text_end

RockTunnel1EndBattleText6:
	text_far _RockTunnel1EndBattleText6
	text_end

RockTunnel1AfterBattleText6:
	text_far _RockTunnel1AfterBattleText6
	text_end

RockTunnel1BattleText7:
	text_far _RockTunnel1BattleText7
	text_end

RockTunnel1EndBattleText7:
	text_far _RockTunnel1EndBattleText7
	text_end

RockTunnel1AfterBattleText7:
	text_far _RockTunnel1AfterBattleText7
	text_end

RockTunnel1Text8:
	text_far _RockTunnel1Text8
	text_end
