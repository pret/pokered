RockTunnel1F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, RockTunnel1TrainerHeaders
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

RockTunnel1TrainerHeaders:
	def_trainers
RockTunnel1TrainerHeader0:
	trainer EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_0, 4, RockTunnel1BattleText1, RockTunnel1EndBattleText1, RockTunnel1AfterBattleText1
RockTunnel1TrainerHeader1:
	trainer EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_1, 4, RockTunnel1BattleText2, RockTunnel1EndBattleText2, RockTunnel1AfterBattleText2
RockTunnel1TrainerHeader2:
	trainer EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_2, 3, RockTunnel1BattleText3, RockTunnel1EndBattleText3, RockTunnel1AfterBattleText3
RockTunnel1TrainerHeader3:
	trainer EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_3, 3, RockTunnel1BattleText4, RockTunnel1EndBattleText4, RockTunnel1AfterBattleText4
RockTunnel1TrainerHeader4:
	trainer EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_4, 4, RockTunnel1BattleText5, RockTunnel1EndBattleText5, RockTunnel1AfterBattleText5
RockTunnel1TrainerHeader5:
	trainer EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_5, 4, RockTunnel1BattleText6, RockTunnel1EndBattleText6, RockTunnel1AfterBattleText6
RockTunnel1TrainerHeader6:
	trainer EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_6, 4, RockTunnel1BattleText7, RockTunnel1EndBattleText7, RockTunnel1AfterBattleText7
	db -1 ; end

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
