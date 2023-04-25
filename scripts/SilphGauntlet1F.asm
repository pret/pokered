SilphGauntlet1F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, SilphGauntlet1FTrainerHeaders
	ld de, SilphGauntlet1F_ScriptPointers
	ld a, [wSilphGauntlet1FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphGauntlet1FCurScript], a
	ret
	
SilphGauntlet1F_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

SilphGauntlet1F_TextPointers:
	dw SilphGauntlet1FText1
	dw SilphGauntlet1FText2
	dw SilphGauntlet1FText3
	dw SilphGauntlet1FText4
	dw SilphGauntlet1FText5
	dw SilphGauntlet1FText6
	
SilphGauntlet1FTrainerHeaders:
	def_trainers 6
SilphGauntlet1FTrainerHeader0:
	trainer EVENT_BEAT_GAUNTLET_YOUNGSTER, 3, SilphGauntlet1FBattleText1, SilphGauntlet1FEndBattleText1, SilphGauntlet1FAfterBattleText1
SilphGauntlet1FTrainerHeader1:
	trainer EVENT_BEAT_GAUNTLET_BUG_CATCHER, 2, SilphGauntlet1FBattleText2, SilphGauntlet1FEndBattleText2, SilphGauntlet1FAfterBattleText2
SilphGauntlet1FTrainerHeader2:
	trainer EVENT_BEAT_GAUNTLET_STUDENT, 4, SilphGauntlet1FBattleText3, SilphGauntlet1FEndBattleText3, SilphGauntlet1FAfterBattleText3
SilphGauntlet1FTrainerHeader3:
	trainer EVENT_BEAT_GAUNTLET_JR_TRAINER_M, 2, SilphGauntlet1FBattleText4, SilphGauntlet1FEndBattleText4, SilphGauntlet1FAfterBattleText4
SilphGauntlet1FTrainerHeader4:
	trainer EVENT_BEAT_GAUNTLET_JR_TRAINER_F, 2, SilphGauntlet1FBattleText5, SilphGauntlet1FEndBattleText5, SilphGauntlet1FAfterBattleText5
SilphGauntlet1FTrainerHeader5:
	trainer EVENT_BEAT_GAUNTLET_BIRD_KEEPER, 3, SilphGauntlet1FBattleText6, SilphGauntlet1FEndBattleText6, SilphGauntlet1FAfterBattleText6
	db -1 ; end
	
SilphGauntlet1FText1:
	text_asm
	ld hl, SilphGauntlet1FTrainerHeader0
	jr SilphGauntlet1FTalkToTrainer

SilphGauntlet1FText2:
	text_asm
	ld hl, SilphGauntlet1FTrainerHeader1
	jr SilphGauntlet1FTalkToTrainer

SilphGauntlet1FText3:
	text_asm
	ld hl, SilphGauntlet1FTrainerHeader2
	jr SilphGauntlet1FTalkToTrainer

SilphGauntlet1FText4:
	text_asm
	ld hl, SilphGauntlet1FTrainerHeader3
	jr SilphGauntlet1FTalkToTrainer

SilphGauntlet1FText5:
	text_asm
	ld hl, SilphGauntlet1FTrainerHeader4
	jr SilphGauntlet1FTalkToTrainer

SilphGauntlet1FText6:
	text_asm
	ld hl, SilphGauntlet1FTrainerHeader5
	jr SilphGauntlet1FTalkToTrainer
	
SilphGauntlet1FTalkToTrainer:
	call TalkToTrainer
	jp TextScriptEnd

SilphGauntlet1FBattleText1:
	text_far _SilphGauntlet1FBattleText1
	text_end

SilphGauntlet1FEndBattleText1:
	text_far _SilphGauntlet1FEndBattleText1
	text_end

SilphGauntlet1FAfterBattleText1:
	text_far _SilphGauntlet1FAfterBattleText1
	text_end

SilphGauntlet1FBattleText2:
	text_far _SilphGauntlet1FBattleText2
	text_end

SilphGauntlet1FEndBattleText2:
	text_far _SilphGauntlet1FEndBattleText2
	text_end

SilphGauntlet1FAfterBattleText2:
	text_far _SilphGauntlet1FAfterBattleText2
	text_end

SilphGauntlet1FBattleText3:
	text_far _SilphGauntlet1FBattleText3
	text_end

SilphGauntlet1FEndBattleText3:
	text_far _SilphGauntlet1FEndBattleText3
	text_end

SilphGauntlet1FAfterBattleText3:
	text_far _SilphGauntlet1FAfterBattleText3
	text_end

SilphGauntlet1FBattleText4:
	text_far _SilphGauntlet1FBattleText4
	text_end

SilphGauntlet1FEndBattleText4:
	text_far _SilphGauntlet1FEndBattleText4
	text_end

SilphGauntlet1FAfterBattleText4:
	text_far _SilphGauntlet1FAfterBattleText4
	text_end

SilphGauntlet1FBattleText5:
	text_far _SilphGauntlet1FBattleText5
	text_end

SilphGauntlet1FEndBattleText5:
	text_far _SilphGauntlet1FEndBattleText5
	text_end

SilphGauntlet1FAfterBattleText5:
	text_far _SilphGauntlet1FAfterBattleText5
	text_end

SilphGauntlet1FBattleText6:
	text_far _SilphGauntlet1FBattleText6
	text_end

SilphGauntlet1FEndBattleText6:
	text_far _SilphGauntlet1FEndBattleText6
	text_end

SilphGauntlet1FAfterBattleText6:
	text_far _SilphGauntlet1FAfterBattleText6
	text_end

	text_end