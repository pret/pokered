MtMoon1F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, MtMoon1TrainerHeaders
	ld de, MtMoon1F_ScriptPointers
	ld a, [wMtMoon1FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wMtMoon1FCurScript], a
	ret

MtMoon1F_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

MtMoon1F_TextPointers:
	dw MtMoon1Text1
	dw MtMoon1Text2
	dw MtMoon1Text3
	dw MtMoon1Text4
	dw MtMoon1Text5
	dw MtMoon1Text6
	dw MtMoon1Text7
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw MtMoon1Text14

MtMoon1TrainerHeaders:
	def_trainers
MtMoon1TrainerHeader0:
	trainer EVENT_BEAT_MT_MOON_1_TRAINER_0, 2, MtMoon1BattleText2, MtMoon1EndBattleText2, MtMoon1AfterBattleText2
MtMoon1TrainerHeader1:
	trainer EVENT_BEAT_MT_MOON_1_TRAINER_1, 3, MtMoon1BattleText3, MtMoon1EndBattleText3, MtMoon1AfterBattleText3
MtMoon1TrainerHeader2:
	trainer EVENT_BEAT_MT_MOON_1_TRAINER_2, 3, MtMoon1BattleText4, MtMoon1EndBattleText4, MtMoon1AfterBattleText4
MtMoon1TrainerHeader3:
	trainer EVENT_BEAT_MT_MOON_1_TRAINER_3, 3, MtMoon1BattleText5, MtMoon1EndBattleText5, MtMoon1AfterBattleText5
MtMoon1TrainerHeader4:
	trainer EVENT_BEAT_MT_MOON_1_TRAINER_4, 3, MtMoon1BattleText6, MtMoon1EndBattleText6, MtMoon1AfterBattleText6
MtMoon1TrainerHeader5:
	trainer EVENT_BEAT_MT_MOON_1_TRAINER_5, 3, MtMoon1BattleText7, MtMoon1EndBattleText7, MtMoon1AfterBattleText7
MtMoon1TrainerHeader6:
	trainer EVENT_BEAT_MT_MOON_1_TRAINER_6, 3, MtMoon1BattleText8, MtMoon1EndBattleText8, MtMoon1AfterBattleText8
	db -1 ; end

MtMoon1Text1:
	text_asm
	ld hl, MtMoon1TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

MtMoon1Text2:
	text_asm
	ld hl, MtMoon1TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

MtMoon1Text3:
	text_asm
	ld hl, MtMoon1TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

MtMoon1Text4:
	text_asm
	ld hl, MtMoon1TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

MtMoon1Text5:
	text_asm
	ld hl, MtMoon1TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

MtMoon1Text6:
	text_asm
	ld hl, MtMoon1TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

MtMoon1Text7:
	text_asm
	ld hl, MtMoon1TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

MtMoon1BattleText2:
	text_far _MtMoon1BattleText2
	text_end

MtMoon1EndBattleText2:
	text_far _MtMoon1EndBattleText2
	text_end

MtMoon1AfterBattleText2:
	text_far _MtMoon1AfterBattleText2
	text_end

MtMoon1BattleText3:
	text_far _MtMoon1BattleText3
	text_end

MtMoon1EndBattleText3:
	text_far _MtMoon1EndBattleText3
	text_end

MtMoon1AfterBattleText3:
	text_far _MtMoon1AfterBattleText3
	text_end

MtMoon1BattleText4:
	text_far _MtMoon1BattleText4
	text_end

MtMoon1EndBattleText4:
	text_far _MtMoon1EndBattleText4
	text_end

MtMoon1AfterBattleText4:
	text_far _MtMoon1AfterBattleText4
	text_end

MtMoon1BattleText5:
	text_far _MtMoon1BattleText5
	text_end

MtMoon1EndBattleText5:
	text_far _MtMoon1EndBattleText5
	text_end

MtMoon1AfterBattleText5:
	text_far _MtMoon1AfterBattleText5
	text_end

MtMoon1BattleText6:
	text_far _MtMoon1BattleText6
	text_end

MtMoon1EndBattleText6:
	text_far _MtMoon1EndBattleText6
	text_end

MtMoon1AfterBattleText6:
	text_far _MtMoon1AfterBattleText6
	text_end

MtMoon1BattleText7:
	text_far _MtMoon1BattleText7
	text_end

MtMoon1EndBattleText7:
	text_far _MtMoon1EndBattleText7
	text_end

MtMoon1AfterBattleText7:
	text_far _MtMoon1AfterBattleText7
	text_end

MtMoon1BattleText8:
	text_far _MtMoon1BattleText8
	text_end

MtMoon1EndBattleText8:
	text_far _MtMoon1EndBattleText8
	text_end

MtMoon1AfterBattleText8:
	text_far _MtMoon1AfterBattleText8
	text_end

MtMoon1Text14:
	text_far _MtMoon1Text14
	text_end
