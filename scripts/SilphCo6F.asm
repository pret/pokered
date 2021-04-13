SilphCo6F_Script:
	call SilphCo6Script_1a1bf
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo6TrainerHeaders
	ld de, SilphCo6F_ScriptPointers
	ld a, [wSilphCo6FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphCo6FCurScript], a
	ret

SilphCo6Script_1a1bf:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld hl, SilphCo6GateCoords
	call SilphCo4Script_19d5d
	call SilphCo6Script_1a1e6
	CheckEvent EVENT_SILPH_CO_6_UNLOCKED_DOOR
	ret nz
	ld a, $5f
	ld [wNewTileBlockID], a
	lb bc, 6, 2
	predef_jump ReplaceTileBlock

SilphCo6GateCoords:
	dbmapcoord  2,  6
	db -1 ; end

SilphCo6Script_1a1e6:
	ldh a, [hUnlockedSilphCoDoors]
	and a
	ret z
	SetEvent EVENT_SILPH_CO_6_UNLOCKED_DOOR
	ret

SilphCo6F_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

SilphCo6F_TextPointers:
	dw SilphCo6Text1
	dw SilphCo6Text2
	dw SilphCo6Text3
	dw SilphCo6Text4
	dw SilphCo6Text5
	dw SilphCo6Text6
	dw SilphCo6Text7
	dw SilphCo6Text8
	dw PickUpItemText
	dw PickUpItemText

SilphCo6TrainerHeaders:
	def_trainers 6
SilphCo6TrainerHeader0:
	trainer EVENT_BEAT_SILPH_CO_6F_TRAINER_0, 2, SilphCo6BattleText2, SilphCo6EndBattleText2, SilphCo6AfterBattleText2
SilphCo6TrainerHeader1:
	trainer EVENT_BEAT_SILPH_CO_6F_TRAINER_1, 3, SilphCo6BattleText3, SilphCo6EndBattleText3, SilphCo6AfterBattleText3
SilphCo6TrainerHeader2:
	trainer EVENT_BEAT_SILPH_CO_6F_TRAINER_2, 2, SilphCo6BattleText4, SilphCo6EndBattleText4, SilphCo6AfterBattleText4
	db -1 ; end

SilphCo6Script_1a22f:
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	jr nz, .asm_1a238
	jr .asm_1a23a
.asm_1a238
	ld h, d
	ld l, e
.asm_1a23a
	jp PrintText

SilphCo6Text1:
	text_asm
	ld hl, SilphCo6Text_1a24a
	ld de, SilphCo6Text_1a24f
	call SilphCo6Script_1a22f
	jp TextScriptEnd

SilphCo6Text_1a24a:
	text_far _SilphCo6Text_1a24a
	text_end

SilphCo6Text_1a24f:
	text_far _SilphCo6Text_1a24f
	text_end

SilphCo6Text2:
	text_asm
	ld hl, SilphCo6Text_1a261
	ld de, SilphCo6Text_1a266
	call SilphCo6Script_1a22f
	jp TextScriptEnd

SilphCo6Text_1a261:
	text_far _SilphCo6Text_1a261
	text_end

SilphCo6Text_1a266:
	text_far _SilphCo6Text_1a266
	text_end

SilphCo6Text3:
	text_asm
	ld hl, SilphCo6Text_1a278
	ld de, SilphCo6Text_1a27d
	call SilphCo6Script_1a22f
	jp TextScriptEnd

SilphCo6Text_1a278:
	text_far _SilphCo6Text_1a278
	text_end

SilphCo6Text_1a27d:
	text_far _SilphCo6Text_1a27d
	text_end

SilphCo6Text4:
	text_asm
	ld hl, SilphCo6Text_1a28f
	ld de, SilphCo6Text_1a294
	call SilphCo6Script_1a22f
	jp TextScriptEnd

SilphCo6Text_1a28f:
	text_far _SilphCo6Text_1a28f
	text_end

SilphCo6Text_1a294:
	text_far _SilphCo6Text_1a294
	text_end

SilphCo6Text5:
	text_asm
	ld hl, SilphCo6Text_1a2a6
	ld de, SilphCo6Text_1a2ab
	call SilphCo6Script_1a22f
	jp TextScriptEnd

SilphCo6Text_1a2a6:
	text_far _SilphCo6Text_1a2a6
	text_end

SilphCo6Text_1a2ab:
	text_far _SilphCo6Text_1a2ab
	text_end

SilphCo6Text6:
	text_asm
	ld hl, SilphCo6TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo6BattleText2:
	text_far _SilphCo6BattleText2
	text_end

SilphCo6EndBattleText2:
	text_far _SilphCo6EndBattleText2
	text_end

SilphCo6AfterBattleText2:
	text_far _SilphCo6AfterBattleText2
	text_end

SilphCo6Text7:
	text_asm
	ld hl, SilphCo6TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SilphCo6BattleText3:
	text_far _SilphCo6BattleText3
	text_end

SilphCo6EndBattleText3:
	text_far _SilphCo6EndBattleText3
	text_end

SilphCo6AfterBattleText3:
	text_far _SilphCo6AfterBattleText3
	text_end

SilphCo6Text8:
	text_asm
	ld hl, SilphCo6TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SilphCo6BattleText4:
	text_far _SilphCo6BattleText4
	text_end

SilphCo6EndBattleText4:
	text_far _SilphCo6EndBattleText4
	text_end

SilphCo6AfterBattleText4:
	text_far _SilphCo6AfterBattleText4
	text_end
