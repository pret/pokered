MtMoon1F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, MtMoon1TrainerHeaders
	ld de, MtMoon1F_ScriptPointers
	ld a, [wMtMoon1FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wMtMoon1FCurScript], a
	ret

MtMoon1F_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_MTMOON1F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_MTMOON1F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_MTMOON1F_END_BATTLE

MtMoon1F_TextPointers:
	def_text_pointers
	dw_const MtMoon1FHikerText,         TEXT_MTMOON1F_HIKER
	dw_const MtMoon1FYoungster1Text,    TEXT_MTMOON1F_YOUNGSTER1
	dw_const MtMoon1FCooltrainerF1Text, TEXT_MTMOON1F_COOLTRAINER_F1
	dw_const MtMoon1FSuperNerdText,     TEXT_MTMOON1F_SUPER_NERD
	dw_const MtMoon1FCooltrainerF2Text, TEXT_MTMOON1F_COOLTRAINER_F2
	dw_const MtMoon1FYoungster2Text,    TEXT_MTMOON1F_YOUNGSTER2
	dw_const MtMoon1FYoungster3Text,    TEXT_MTMOON1F_YOUNGSTER3
	dw_const PickUpItemText,            TEXT_MTMOON1F_POTION1
	dw_const PickUpItemText,            TEXT_MTMOON1F_MOON_STONE
	dw_const PickUpItemText,            TEXT_MTMOON1F_RARE_CANDY
	dw_const PickUpItemText,            TEXT_MTMOON1F_ESCAPE_ROPE
	dw_const PickUpItemText,            TEXT_MTMOON1F_POTION2
	dw_const PickUpItemText,            TEXT_MTMOON1F_TM_WATER_GUN
	dw_const MtMoon1FBewareZubatSign,   TEXT_MTMOON1F_BEWARE_ZUBAT_SIGN

MtMoon1TrainerHeaders:
	def_trainers
MtMoon1TrainerHeader0:
	trainer EVENT_BEAT_MT_MOON_1_TRAINER_0, 2, MtMoon1FHikerBattleText, MtMoon1FHikerEndBattleText, MtMoon1FHikerAfterBattleText
MtMoon1TrainerHeader1:
	trainer EVENT_BEAT_MT_MOON_1_TRAINER_1, 3, MtMoon1FYoungster1BattleText, MtMoon1FYoungster1EndBattleText, MtMoon1FYoungster1AfterBattleText
MtMoon1TrainerHeader2:
	trainer EVENT_BEAT_MT_MOON_1_TRAINER_2, 3, MtMoon1FCooltrainerF1BattleText, MtMoon1FCooltrainerF1EndBattleText, MtMoon1FCooltrainerF1AfterBattleText
MtMoon1TrainerHeader3:
	trainer EVENT_BEAT_MT_MOON_1_TRAINER_3, 3, MtMoon1FSuperNerdBattleText, MtMoon1FSuperNerdEndBattleText, MtMoon1FSuperNerdAfterBattleText
MtMoon1TrainerHeader4:
	trainer EVENT_BEAT_MT_MOON_1_TRAINER_4, 3, MtMoon1FCooltrainerF2BattleText, MtMoon1FCooltrainerF2EndBattleText, MtMoon1FCooltrainerF2AfterBattleText
MtMoon1TrainerHeader5:
	trainer EVENT_BEAT_MT_MOON_1_TRAINER_5, 3, MtMoon1FYoungster2BattleText, MtMoon1FYoungster2EndBattleText, MtMoon1FYoungster2AfterBattleText
MtMoon1TrainerHeader6:
	trainer EVENT_BEAT_MT_MOON_1_TRAINER_6, 3, MtMoon1FYoungster3BattleText, MtMoon1FYoungster3EndBattleText, MtMoon1FYoungster3AfterBattleText
	db -1 ; end

MtMoon1FHikerText:
	text_asm
	ld hl, MtMoon1TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

MtMoon1FYoungster1Text:
	text_asm
	ld hl, MtMoon1TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

MtMoon1FCooltrainerF1Text:
	text_asm
	ld hl, MtMoon1TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

MtMoon1FSuperNerdText:
	text_asm
	ld hl, MtMoon1TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

MtMoon1FCooltrainerF2Text:
	text_asm
	ld hl, MtMoon1TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

MtMoon1FYoungster2Text:
	text_asm
	ld hl, MtMoon1TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

MtMoon1FYoungster3Text:
	text_asm
	ld hl, MtMoon1TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

MtMoon1FHikerBattleText:
	text_far _MtMoon1FHikerBattleText
	text_end

MtMoon1FHikerEndBattleText:
	text_far _MtMoon1FHikerEndBattleText
	text_end

MtMoon1FHikerAfterBattleText:
	text_far _MtMoon1FHikerAfterBattleText
	text_end

MtMoon1FYoungster1BattleText:
	text_far _MtMoon1FYoungster1BattleText
	text_end

MtMoon1FYoungster1EndBattleText:
	text_far _MtMoon1FYoungster1EndBattleText
	text_end

MtMoon1FYoungster1AfterBattleText:
	text_far _MtMoon1FYoungster1AfterBattleText
	text_end

MtMoon1FCooltrainerF1BattleText:
	text_far _MtMoon1FCooltrainerF1BattleText
	text_end

MtMoon1FCooltrainerF1EndBattleText:
	text_far _MtMoon1FCooltrainerF1EndBattleText
	text_end

MtMoon1FCooltrainerF1AfterBattleText:
	text_far _MtMoon1FCooltrainerF1AfterBattleText
	text_end

MtMoon1FSuperNerdBattleText:
	text_far _MtMoon1FSuperNerdBattleText
	text_end

MtMoon1FSuperNerdEndBattleText:
	text_far _MtMoon1FSuperNerdEndBattleText
	text_end

MtMoon1FSuperNerdAfterBattleText:
	text_far _MtMoon1FSuperNerdAfterBattleText
	text_end

MtMoon1FCooltrainerF2BattleText:
	text_far _MtMoon1FCooltrainerF2BattleText
	text_end

MtMoon1FCooltrainerF2EndBattleText:
	text_far _MtMoon1FCooltrainerF2EndBattleText
	text_end

MtMoon1FCooltrainerF2AfterBattleText:
	text_far _MtMoon1FCooltrainerF2AfterBattleText
	text_end

MtMoon1FYoungster2BattleText:
	text_far _MtMoon1FYoungster2BattleText
	text_end

MtMoon1FYoungster2EndBattleText:
	text_far _MtMoon1FYoungster2EndBattleText
	text_end

MtMoon1FYoungster2AfterBattleText:
	text_far _MtMoon1FYoungster2AfterBattleText
	text_end

MtMoon1FYoungster3BattleText:
	text_far _MtMoon1FYoungster3BattleText
	text_end

MtMoon1FYoungster3EndBattleText:
	text_far _MtMoon1FYoungster3EndBattleText
	text_end

MtMoon1FYoungster3AfterBattleText:
	text_far _MtMoon1FYoungster3AfterBattleText
	text_end

MtMoon1FBewareZubatSign:
	text_far _MtMoon1FBewareZubatSign
	text_end
