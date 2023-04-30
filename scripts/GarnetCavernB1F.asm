GarnetCavernB1F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, GarnetCavernB1FTrainerHeaders
	ld de, GarnetCavernB1F_ScriptPointers
	ld a, [wGarnetCavernB1FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wGarnetCavernB1FCurScript], a
	ret

GarnetCavernB1F_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

GarnetCavernB1F_TextPointers:
	dw ArticunoGText
	;dw PickUpItemText soon
	;dw PickUpItemText

GarnetCavernB1FTrainerHeaders:
	def_trainers
ArticunoGTrainerHeader:
	trainer EVENT_BEAT_ARTICUNO_G, 0, ArticunoGBattleText, ArticunoGBattleText, ArticunoGBattleText
	db -1 ; end

ArticunoGText:
	text_asm
	ld hl, ArticunoGTrainerHeader
	call TalkToTrainer
	jp TextScriptEnd

ArticunoGBattleText:
	text_far _ArticunoGBattleText
	text_asm
	ld a, ARTICUNO_G
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

