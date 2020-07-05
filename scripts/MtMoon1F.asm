MtMoon1F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, MtMoon1TrainerHeader0
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

MtMoon1TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_MT_MOON_1_TRAINER_0
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_MT_MOON_1_TRAINER_0
	dw MtMoon1BattleText2 ; TextBeforeBattle
	dw MtMoon1AfterBattleText2 ; TextAfterBattle
	dw MtMoon1EndBattleText2 ; TextEndBattle
	dw MtMoon1EndBattleText2 ; TextEndBattle

MtMoon1TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_MT_MOON_1_TRAINER_1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_MT_MOON_1_TRAINER_1
	dw MtMoon1BattleText3 ; TextBeforeBattle
	dw MtMoon1AfterBattleText3 ; TextAfterBattle
	dw MtMoon1EndBattleText3 ; TextEndBattle
	dw MtMoon1EndBattleText3 ; TextEndBattle

MtMoon1TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_MT_MOON_1_TRAINER_2
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_MT_MOON_1_TRAINER_2
	dw MtMoon1BattleText4 ; TextBeforeBattle
	dw MtMoon1AfterBattleText4 ; TextAfterBattle
	dw MtMoon1EndBattleText4 ; TextEndBattle
	dw MtMoon1EndBattleText4 ; TextEndBattle

MtMoon1TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_MT_MOON_1_TRAINER_3
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_MT_MOON_1_TRAINER_3
	dw MtMoon1BattleText5 ; TextBeforeBattle
	dw MtMoon1AfterBattleText5 ; TextAfterBattle
	dw MtMoon1EndBattleText5 ; TextEndBattle
	dw MtMoon1EndBattleText5 ; TextEndBattle

MtMoon1TrainerHeader4:
	dbEventFlagBit EVENT_BEAT_MT_MOON_1_TRAINER_4
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_MT_MOON_1_TRAINER_4
	dw MtMoon1BattleText6 ; TextBeforeBattle
	dw MtMoon1AfterBattleText6 ; TextAfterBattle
	dw MtMoon1EndBattleText6 ; TextEndBattle
	dw MtMoon1EndBattleText6 ; TextEndBattle

MtMoon1TrainerHeader5:
	dbEventFlagBit EVENT_BEAT_MT_MOON_1_TRAINER_5
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_MT_MOON_1_TRAINER_5
	dw MtMoon1BattleText7 ; TextBeforeBattle
	dw MtMoon1AfterBattleText7 ; TextAfterBattle
	dw MtMoon1EndBattleText7 ; TextEndBattle
	dw MtMoon1EndBattleText7 ; TextEndBattle

MtMoon1TrainerHeader6:
	dbEventFlagBit EVENT_BEAT_MT_MOON_1_TRAINER_6
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_MT_MOON_1_TRAINER_6
	dw MtMoon1BattleText8 ; TextBeforeBattle
	dw MtMoon1AfterBattleText8 ; TextAfterBattle
	dw MtMoon1EndBattleText8 ; TextEndBattle
	dw MtMoon1EndBattleText8 ; TextEndBattle

	db $ff

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
