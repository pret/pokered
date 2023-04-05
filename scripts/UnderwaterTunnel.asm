UnderwaterTunnel_Script:
	call EnableAutoTextBoxDrawing
	ld hl, UnderwaterTunnelTrainerHeaders
	ld de, UnderwaterTunnel_ScriptPointers
	ld a, [wUnderwaterTunnelCurScript]
	call ExecuteCurMapScriptInTable
	ld [wUnderwaterTunnelCurScript], a
	ret

UnderwaterTunnel_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

UnderwaterTunnel_TextPointers:
	dw DragoniteText

UnderwaterTunnelTrainerHeaders:
	def_trainers
DragoniteTrainerHeader:
	trainer EVENT_BEAT_DRAGONITE, 0, DragoniteBattleText, DragoniteBattleText, DragoniteBattleText
	db -1 ; end

DragoniteText:
	text_asm
	ld hl, DragoniteTrainerHeader
	call TalkToTrainer
	jp TextScriptEnd

DragoniteBattleText:
	text_far _DragoniteBattleText
	text_asm
	ld a, DRAGONITE
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd
