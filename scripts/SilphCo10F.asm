SilphCo10F_Script:
	call SilphCo10Script_5a14f
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo10TrainerHeaders
	ld de, SilphCo10F_ScriptPointers
	ld a, [wSilphCo10FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphCo10FCurScript], a
	ret

SilphCo10Script_5a14f:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld hl, SilphCo10GateCoords
	call SilphCo2Script_59d43
	call SilphCo10Text_5a176
	CheckEvent EVENT_SILPH_CO_10_UNLOCKED_DOOR
	ret nz
	ld a, $54
	ld [wNewTileBlockID], a
	lb bc, 4, 5
	predef_jump ReplaceTileBlock

SilphCo10GateCoords:
	dbmapcoord  5,  4
	db -1 ; end

SilphCo10Text_5a176:
	ldh a, [hUnlockedSilphCoDoors]
	and a
	ret z
	SetEvent EVENT_SILPH_CO_10_UNLOCKED_DOOR
	ret

SilphCo10F_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

SilphCo10F_TextPointers:
	dw SilphCo10Text1
	dw SilphCo10Text2
	dw SilphCo10Text3
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText

SilphCo10TrainerHeaders:
	def_trainers
SilphCo10TrainerHeader0:
	trainer EVENT_BEAT_SILPH_CO_10F_TRAINER_0, 3, SilphCo10BattleText1, SilphCo10EndBattleText1, SilphCo10AfterBattleText1
SilphCo10TrainerHeader1:
	trainer EVENT_BEAT_SILPH_CO_10F_TRAINER_1, 4, SilphCo10BattleText2, SilphCo10EndBattleText2, SilphCo10AfterBattleText2
	db -1 ; end

SilphCo10Text1:
	text_asm
	ld hl, SilphCo10TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo10Text2:
	text_asm
	ld hl, SilphCo10TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SilphCo10Text3:
	text_asm
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	ld hl, SilphCo10Text_5a1d8
	jr nz, .asm_cf85f
	ld hl, SilphCo10Text_5a1d3
.asm_cf85f
	call PrintText
	jp TextScriptEnd

SilphCo10Text_5a1d3:
	text_far _SilphCo10Text_5a1d3
	text_end

SilphCo10Text_5a1d8:
	text_far _SilphCo10Text_5a1d8
	text_end

SilphCo10BattleText1:
	text_far _SilphCo10BattleText1
	text_end

SilphCo10EndBattleText1:
	text_far _SilphCo10EndBattleText1
	text_end

SilphCo10AfterBattleText1:
	text_far _SilphCo10AfterBattleText1
	text_end

SilphCo10BattleText2:
	text_far _SilphCo10BattleText2
	text_end

SilphCo10EndBattleText2:
	text_far _SilphCo10EndBattleText2
	text_end

SilphCo10AfterBattleText2:
	text_far _SilphCo10AfterBattleText2
	text_end
