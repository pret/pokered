UnknownDungeon3Script: ; 45ef0 (11:5ef0)
	call EnableAutoTextBoxDrawing
	ld hl, UnknownDungeon3TrainerHeaders
	ld de, UnknownDungeon3ScriptPointers
	ld a, [wUnknownDungeon3CurScript]
	call ExecuteCurMapScriptInTable
	ld [wUnknownDungeon3CurScript], a
	ret

UnknownDungeon3ScriptPointers: ; 45f03 (11:5f03)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

UnknownDungeon3TextPointers: ; 45f09 (11:5f09)
	dw UnknownDungeon3Text1
	dw PickUpItemText
	dw PickUpItemText

UnknownDungeon3TrainerHeaders: ; 45f0f (11:5f0f)
UnknownDungeon3TrainerHeader0: ; 45f0f (11:5f0f)
	dbEventFlagBit EVENT_BEAT_UNKNOWN_DUNGEON_3_TRAINER_0
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_UNKNOWN_DUNGEON_3_TRAINER_0
	dw UnknownDungeon3MewtwoText ; TextBeforeBattle
	dw UnknownDungeon3MewtwoText ; TextAfterBattle
	dw UnknownDungeon3MewtwoText ; TextEndBattle
	dw UnknownDungeon3MewtwoText ; TextEndBattle

	db $ff

UnknownDungeon3Text1: ; 45f1c (11:5f1c)
	TX_ASM
	ld hl, UnknownDungeon3TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

UnknownDungeon3MewtwoText: ; 45f26 (11:5f26)
	TX_FAR _UnknownDungeon3MewtwoText
	TX_ASM
	ld a, MEWTWO
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd
