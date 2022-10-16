FarawayIslandInside_Script:
	call EnableAutoTextBoxDrawing
	ld hl, FarawayIslandInsideTrainerHeaders
	ld de, FarawayIslandInside_ScriptPointers
	ld a, [wFarawayIslandInsideCurScript]
	call ExecuteCurMapScriptInTable
	ld [wFarawayIslandInsideCurScript], a
	ret

FarawayIslandInside_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

FarawayIslandInside_TextPointers:
	dw FarawayIslandInsideText2

FarawayIslandInsideTrainerHeaders:
	def_trainers
MewTrainerHeader:
	trainer EVENT_BEAT_MEW, 0, MewBattleText, MewBattleText, MewBattleText
	db -1 ; end

FarawayIslandInsideText2:
	text_asm
	ld hl, MewTrainerHeader
	call TalkToTrainer
	jp TextScriptEnd

MewBattleText:
	text_far _MewtwoBattleText ; Mew!
	text_asm
	ld a, MEW
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

	text_end ; unused
