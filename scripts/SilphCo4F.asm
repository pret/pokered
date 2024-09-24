SilphCo4F_Script:
	call SilphCo4FGateCallbackScript
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo4TrainerHeaders
	ld de, SilphCo4F_ScriptPointers
	ld a, [wSilphCo4FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphCo4FCurScript], a
	ret

SilphCo4FGateCallbackScript:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	ld hl, .GateCoordinates
	call SilphCo4F_SetCardKeyDoorYScript
	call SilphCo4FUnlockedDoorEventScript
	CheckEvent EVENT_SILPH_CO_4_UNLOCKED_DOOR1
	jr nz, .unlock_door1
	push af
	ld a, $54
	ld [wNewTileBlockID], a
	lb bc, 6, 2
	predef ReplaceTileBlock
	pop af
.unlock_door1
	CheckEventAfterBranchReuseA EVENT_SILPH_CO_4_UNLOCKED_DOOR2, EVENT_SILPH_CO_4_UNLOCKED_DOOR1
	ret nz
	ld a, $54
	ld [wNewTileBlockID], a
	lb bc, 4, 6
	predef_jump ReplaceTileBlock

.GateCoordinates:
	dbmapcoord  2,  6
	dbmapcoord  6,  4
	db -1 ; end

SilphCo4F_SetCardKeyDoorYScript:
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

SilphCo4FUnlockedDoorEventScript:
	EventFlagAddress hl, EVENT_SILPH_CO_4_UNLOCKED_DOOR1
	ldh a, [hUnlockedSilphCoDoors]
	and a
	ret z
	cp $1
	jr nz, .unlock_door1
	SetEventReuseHL EVENT_SILPH_CO_4_UNLOCKED_DOOR1
	ret
.unlock_door1
	SetEventAfterBranchReuseHL EVENT_SILPH_CO_4_UNLOCKED_DOOR2, EVENT_SILPH_CO_4_UNLOCKED_DOOR1
	ret

SilphCo4F_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_SILPHCO4F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_SILPHCO4F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_SILPHCO4F_END_BATTLE

SilphCo4F_TextPointers:
	def_text_pointers
	dw_const SilphCo4FSilphWorkerMText, TEXT_SILPHCO4F_SILPH_WORKER_M
	dw_const SilphCo4FRocket1Text,      TEXT_SILPHCO4F_ROCKET1
	dw_const SilphCo4FScientistText,    TEXT_SILPHCO4F_SCIENTIST
	dw_const SilphCo4FRocket2Text,      TEXT_SILPHCO4F_ROCKET2
	dw_const PickUpItemText,            TEXT_SILPHCO4F_FULL_HEAL
	dw_const PickUpItemText,            TEXT_SILPHCO4F_MAX_REVIVE
	dw_const PickUpItemText,            TEXT_SILPHCO4F_ESCAPE_ROPE

SilphCo4TrainerHeaders:
	def_trainers 2
SilphCo4TrainerHeader0:
	trainer EVENT_BEAT_SILPH_CO_4F_TRAINER_0, 4, SilphCo4FRocket1BattleText, SilphCo4FRocket1EndBattleText, SilphCo4FRocket1AfterBattleText
SilphCo4TrainerHeader1:
	trainer EVENT_BEAT_SILPH_CO_4F_TRAINER_1, 3, SilphCo4FScientistBattleText, SilphCo4FScientistEndBattleText, SilphCo4FScientistAfterBattleText
SilphCo4TrainerHeader2:
	trainer EVENT_BEAT_SILPH_CO_4F_TRAINER_2, 4, SilphCo4FRocket2BattleText, SilphCo4FRocket2EndBattleText, SilphCo4FRocket2AfterBattleText
	db -1 ; end

SilphCo4FSilphWorkerMText:
	text_asm
	ld hl, .ImHidingText
	ld de, .TeamRocketIsGoneText
	call SilphCo6FBeatGiovanniPrintDEOrPrintHLScript
	jp TextScriptEnd

.ImHidingText:
	text_far _SilphCo4FSilphWorkerMImHidingText
	text_end

.TeamRocketIsGoneText:
	text_far _SilphCo4FSilphWorkerMTeamRocketIsGoneText
	text_end

SilphCo4FRocket1Text:
	text_asm
	ld hl, SilphCo4TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo4FRocket1BattleText:
	text_far _SilphCo4FRocket1BattleText
	text_end

SilphCo4FRocket1EndBattleText:
	text_far _SilphCo4FRocket1EndBattleText
	text_end

SilphCo4FRocket1AfterBattleText:
	text_far _SilphCo4FRocket1AfterBattleText
	text_end

SilphCo4FScientistText:
	text_asm
	ld hl, SilphCo4TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SilphCo4FScientistBattleText:
	text_far _SilphCo4FScientistBattleText
	text_end

SilphCo4FScientistEndBattleText:
	text_far _SilphCo4FScientistEndBattleText
	text_end

SilphCo4FScientistAfterBattleText:
	text_far _SilphCo4FScientistAfterBattleText
	text_end

SilphCo4FRocket2Text:
	text_asm
	ld hl, SilphCo4TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SilphCo4FRocket2BattleText:
	text_far _SilphCo4FRocket2BattleText
	text_end

SilphCo4FRocket2EndBattleText:
	text_far _SilphCo4FRocket2EndBattleText
	text_end

SilphCo4FRocket2AfterBattleText:
	text_far _SilphCo4FRocket2AfterBattleText
	text_end
