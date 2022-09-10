DiglettsCave_Script:
	call EnableAutoTextBoxDrawing
	ld hl, DiglettsCaveTrainerHeaders
	ld de, DiglettsCave_ScriptPointers
	ld a, [wDiglettsCaveCurScript]
	call ExecuteCurMapScriptInTable
	ld [wDiglettsCaveCurScript], a
	ret

DiglettsCave_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

DiglettsCave_TextPointers:
	dw CrockyText

DiglettsCaveTrainerHeaders:
	def_trainers
CrockyTrainerHeader:
	trainer EVENT_BEAT_CROCKY, 0, CrockyBattleText, CrockyBattleText, CrockyBattleText
	db -1 ; end

CrockyText:
	text_asm
	ld hl, CrockyTrainerHeader
	call TalkToTrainer
	jp TextScriptEnd

CrockyBattleText:
	text_far _CrockyBattleText
	text_asm
	ld a, CROCKY
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd
