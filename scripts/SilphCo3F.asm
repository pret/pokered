SilphCo3F_Script:
	call SilphCo3Script_59f71
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo3TrainerHeaders
	ld de, SilphCo3F_ScriptPointers
	ld a, [wSilphCo3FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphCo3FCurScript], a
	ret

SilphCo3Script_59f71:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld hl, SilphCo3GateCoords
	call SilphCo2Script_59d43
	call SilphCo3Script_59fad
	CheckEvent EVENT_SILPH_CO_3_UNLOCKED_DOOR1
	jr nz, .asm_59f98
	push af
	ld a, $5f
	ld [wNewTileBlockID], a
	lb bc, 4, 4
	predef ReplaceTileBlock
	pop af
.asm_59f98
	CheckEventAfterBranchReuseA EVENT_SILPH_CO_3_UNLOCKED_DOOR2, EVENT_SILPH_CO_3_UNLOCKED_DOOR1
	ret nz
	ld a, $5f
	ld [wNewTileBlockID], a
	lb bc, 4, 8
	predef_jump ReplaceTileBlock

SilphCo3GateCoords:
	dbmapcoord  4,  4
	dbmapcoord  8,  4
	db -1 ; end

SilphCo3Script_59fad:
	EventFlagAddress hl, EVENT_SILPH_CO_3_UNLOCKED_DOOR1
	ldh a, [hUnlockedSilphCoDoors]
	and a
	ret z
	cp $1
	jr nz, .next
	SetEventReuseHL EVENT_SILPH_CO_3_UNLOCKED_DOOR1
	ret
.next
	SetEventAfterBranchReuseHL EVENT_SILPH_CO_3_UNLOCKED_DOOR2, EVENT_SILPH_CO_3_UNLOCKED_DOOR1
	ret

SilphCo3F_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

SilphCo3F_TextPointers:
	dw SilphCo3Text1
	dw SilphCo3Text2
	dw SilphCo3Text3
	dw PickUpItemText

SilphCo3TrainerHeaders:
	def_trainers 2
SilphCo3TrainerHeader0:
	trainer EVENT_BEAT_SILPH_CO_3F_TRAINER_0, 2, SilphCo3BattleText1, SilphCo3EndBattleText1, SilphCo3AfterBattleText1
SilphCo3TrainerHeader1:
	trainer EVENT_BEAT_SILPH_CO_3F_TRAINER_1, 3, SilphCo3BattleText2, SilphCo3EndBattleText2, SilphCo3AfterBattleText2
	db -1 ; end

SilphCo3Text1:
	text_asm
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	ld hl, SilphCo3Text_59ffe
	jr nz, .asm_59fee
	ld hl, SilphCo3Text_59ff9
.asm_59fee
	call PrintText
	jp TextScriptEnd

SilphCo3Text_59ff9:
	text_far _SilphCo3Text_59ff9
	text_end

SilphCo3Text_59ffe:
	text_far _SilphCo3Text_59ffe
	text_end

SilphCo3Text2:
	text_asm
	ld hl, SilphCo3TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo3BattleText1:
	text_far _SilphCo3BattleText1
	text_end

SilphCo3EndBattleText1:
	text_far _SilphCo3EndBattleText1
	text_end

SilphCo3AfterBattleText1:
	text_far _SilphCo3AfterBattleText1
	text_end

SilphCo3Text3:
	text_asm
	ld hl, SilphCo3TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SilphCo3BattleText2:
	text_far _SilphCo3BattleText2
	text_end

SilphCo3EndBattleText2:
	text_far _SilphCo3EndBattleText2
	text_end

SilphCo3AfterBattleText2:
	text_far _SilphCo3AfterBattleText2
	text_end
