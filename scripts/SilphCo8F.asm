SilphCo8F_Script:
	call SilphCo8FGateCallbackScript
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo8TrainerHeaders
	ld de, SilphCo8F_ScriptPointers
	ld a, [wSilphCo8FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphCo8FCurScript], a
	ret

SilphCo8FGateCallbackScript:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	ld hl, .GateCoordinates
	call SilphCo8F_SetCardKeyDoorYScript
	call SilphCo8F_UnlockedDoorEventScript
	CheckEvent EVENT_SILPH_CO_8_UNLOCKED_DOOR
	ret nz
	ld a, $5f
	ld [wNewTileBlockID], a
	lb bc, 4, 3
	predef_jump ReplaceTileBlock

.GateCoordinates:
	dbmapcoord  3,  4
	db -1 ; end

SilphCo8F_SetCardKeyDoorYScript:
	push hl
	ld hl, wCardKeyDoorY
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	xor a
	ldh [hUnlockedSilphCoDoors], a
	pop hl
.loop_check_doors
	ld a, [hli]
	cp $ff
	jr z, .exit_loop
	push hl
	ld hl, hUnlockedSilphCoDoors
	inc [hl]
	pop hl
	cp b
	jr z, .check_y_coord
	inc hl
	jr .loop_check_doors
.check_y_coord
	ld a, [hli]
	cp c
	jr nz, .loop_check_doors
	ld hl, wCardKeyDoorY
	xor a
	ld [hli], a
	ld [hl], a
	ret
.exit_loop
	xor a
	ldh [hUnlockedSilphCoDoors], a
	ret

SilphCo8F_UnlockedDoorEventScript:
	ldh a, [hUnlockedSilphCoDoors]
	and a
	ret z
	SetEvent EVENT_SILPH_CO_8_UNLOCKED_DOOR
	ret

SilphCo8F_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_SILPHCO8F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_SILPHCO8F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_SILPHCO8F_END_BATTLE

SilphCo8F_TextPointers:
	def_text_pointers
	dw_const SilphCo8FSilphWorkerMText, TEXT_SILPHCO8F_SILPH_WORKER_M
	dw_const SilphCo8FRocket1Text,      TEXT_SILPHCO8F_ROCKET1
	dw_const SilphCo8FScientistText,    TEXT_SILPHCO8F_SCIENTIST
	dw_const SilphCo8FRocket2Text,      TEXT_SILPHCO8F_ROCKET2

SilphCo8TrainerHeaders:
	def_trainers 2
SilphCo8TrainerHeader0:
	trainer EVENT_BEAT_SILPH_CO_8F_TRAINER_0, 4, SilphCo8FRocket1BattleText, SilphCo8FRocket1EndBattleText, SilphCo8FRocket1AfterBattleText
SilphCo8TrainerHeader1:
	trainer EVENT_BEAT_SILPH_CO_8F_TRAINER_1, 4, SilphCo8FScientistBattleText, SilphCo8FScientistEndBattleText, SilphCo8FScientistAfterBattleText
SilphCo8TrainerHeader2:
	trainer EVENT_BEAT_SILPH_CO_8F_TRAINER_2, 4, SilphCo8FRocket2BattleText, SilphCo8FRocket2EndBattleText, SilphCo8FRocket2AfterBattleText
	db -1 ; end

SilphCo8FSilphWorkerMText:
	text_asm
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	ld hl, .ThanksForSavingUsText
	jr nz, .beat_giovanni
	ld hl, .SilphIsFinishedText
.beat_giovanni
	call PrintText
	jp TextScriptEnd

.SilphIsFinishedText:
	text_far __SilphCo8FSilphWorkerMThanksForSavingUsText
	text_end

.ThanksForSavingUsText:
	text_far _SilphCo8FSilphWorkerMThanksForSavingUsText
	text_end

SilphCo8FRocket1Text:
	text_asm
	ld hl, SilphCo8TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo8FScientistText:
	text_asm
	ld hl, SilphCo8TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SilphCo8FRocket2Text:
	text_asm
	ld hl, SilphCo8TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SilphCo8FRocket1BattleText:
	text_far _SilphCo8FRocket1BattleText
	text_end

SilphCo8FRocket1EndBattleText:
	text_far _SilphCo8FRocket1EndBattleText
	text_end

SilphCo8FRocket1AfterBattleText:
	text_far _SilphCo8FRocket1AfterBattleText
	text_end

SilphCo8FScientistBattleText:
	text_far _SilphCo8FScientistBattleText
	text_end

SilphCo8FScientistEndBattleText:
	text_far _SilphCo8FScientistEndBattleText
	text_end

SilphCo8FScientistAfterBattleText:
	text_far _SilphCo8FScientistAfterBattleText
	text_end

SilphCo8FRocket2BattleText:
	text_far _SilphCo8FRocket2BattleText
	text_end

SilphCo8FRocket2EndBattleText:
	text_far _SilphCo8FRocket2EndBattleText
	text_end

SilphCo8FRocket2AfterBattleText:
	text_far _SilphCo8FRocket2AfterBattleText
	text_end
