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
	dw WugtrioText

DiglettsCaveTrainerHeaders:
	def_trainers
WugtrioTrainerHeader:
	trainer EVENT_BEAT_WUGTRIO, 0, WugtrioBattleText, WugtrioBattleText, WugtrioBattleText
	db -1 ; end

WugtrioText:
	text_asm
	ld hl, WugtrioTrainerHeader
	call TalkToTrainer
	jp TextScriptEnd

WugtrioBattleText:
	text_far _WugtrioBattleText
	text_asm
	ld a, WUGTRIO
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd
