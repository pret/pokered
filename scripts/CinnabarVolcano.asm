CinnabarVolcano_Script:
	call EnableAutoTextBoxDrawing
	ld hl, CinnabarVolcanoTrainerHeaders
	ld de, CinnabarVolcano_ScriptPointers
	ld a, [wCinnabarVolcanoCurScript]
	call ExecuteCurMapScriptInTable
	ld [wCinnabarVolcanoCurScript], a
	ret

CinnabarVolcano_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

CinnabarVolcano_TextPointers:
	dw MoltresText

CinnabarVolcanoTrainerHeaders:
	def_trainers
MoltresTrainerHeader:
	trainer EVENT_BEAT_MOLTRES, 0, MoltresBattleText, MoltresBattleText, MoltresBattleText
	db -1 ; end

MoltresText:
	text_asm
	ld hl, MoltresTrainerHeader
	call TalkToTrainer
	jp TextScriptEnd

MoltresBattleText:
	text_far _MoltresBattleText
	text_asm
	ld a, MOLTRES
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd
