SilphCo2F_Script:
	call SilphCo2FGateCallbackScript
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo2TrainerHeaders
	ld de, SilphCo2F_ScriptPointers
	ld a, [wSilphCo2FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphCo2FCurScript], a
	ret

SilphCo2FGateCallbackScript:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	ld hl, .GateCoordinates
	call SilphCo2F_SetCardKeyDoorYScript
	call SilphCo2F_UnlockedDoorEventScript
	CheckEvent EVENT_SILPH_CO_2_UNLOCKED_DOOR1
	jr nz, .unlock_door1
	push af
	ld a, $54
	ld [wNewTileBlockID], a
	lb bc, 2, 2
	predef ReplaceTileBlock
	pop af
.unlock_door1
	CheckEventAfterBranchReuseA EVENT_SILPH_CO_2_UNLOCKED_DOOR2, EVENT_SILPH_CO_2_UNLOCKED_DOOR1
	ret nz
	ld a, $54
	ld [wNewTileBlockID], a
	lb bc, 5, 2
	predef_jump ReplaceTileBlock

.GateCoordinates:
	dbmapcoord  2,  2
	dbmapcoord  2,  5
	db -1 ; end

SilphCo2F_SetCardKeyDoorYScript:
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

SilphCo2F_UnlockedDoorEventScript:
	EventFlagAddress hl, EVENT_SILPH_CO_2_UNLOCKED_DOOR1
	ldh a, [hUnlockedSilphCoDoors]
	and a
	ret z
	cp $1
	jr nz, .unlock_door1
	SetEventReuseHL EVENT_SILPH_CO_2_UNLOCKED_DOOR1
	ret
.unlock_door1
	SetEventAfterBranchReuseHL EVENT_SILPH_CO_2_UNLOCKED_DOOR2, EVENT_SILPH_CO_2_UNLOCKED_DOOR1
	ret

SilphCo2F_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_SILPHCO2F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_SILPHCO2F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_SILPHCO2F_END_BATTLE

SilphCo2F_TextPointers:
	def_text_pointers
	dw_const SilphCo2FSilphWorkerFText, TEXT_SILPHCO2F_SILPH_WORKER_F
	dw_const SilphCo2FScientist1Text,   TEXT_SILPHCO2F_SCIENTIST1
	dw_const SilphCo2FScientist2Text,   TEXT_SILPHCO2F_SCIENTIST2
	dw_const SilphCo2FRocket1Text,      TEXT_SILPHCO2F_ROCKET1
	dw_const SilphCo2FRocket2Text,      TEXT_SILPHCO2F_ROCKET2

SilphCo2TrainerHeaders:
	def_trainers 2
SilphCo2TrainerHeader0:
	trainer EVENT_BEAT_SILPH_CO_2F_TRAINER_0, 3, SilphCo2FScientist1BattleText, SilphCo2FScientist1EndBattleText, SilphCo2FScientist1AfterBattleText
SilphCo2TrainerHeader1:
	trainer EVENT_BEAT_SILPH_CO_2F_TRAINER_1, 4, SilphCo2FScientist2BattleText, SilphCo2FScientist2EndBattleText, SilphCo2FScientist2AfterBattleText
SilphCo2TrainerHeader2:
	trainer EVENT_BEAT_SILPH_CO_2F_TRAINER_2, 3, SilphCo2FRocket1BattleText, SilphCo2FRocket1EndBattleText, SilphCo2FRocket1AfterBattleText
SilphCo2TrainerHeader3:
	trainer EVENT_BEAT_SILPH_CO_2F_TRAINER_3, 3, SilphCo2FRocket2BattleText, SilphCo2FRocket2EndBattleText, SilphCo2FRocket2AfterBattleText
	db -1 ; end

SilphCo2FSilphWorkerFText:
	text_asm
	CheckEvent EVENT_GOT_TM36
	jr nz, .already_have_tm
	ld hl, .PleaseTakeThisText
	call PrintText
	lb bc, TM_SELFDESTRUCT, 1
	call GiveItem
	ld hl, .TM36NoRoomText
	jr nc, .print_text
	SetEvent EVENT_GOT_TM36
	ld hl, .ReceivedTM36Text
	jr .print_text
.already_have_tm
	ld hl, .TM36ExplanationText
.print_text
	call PrintText
	jp TextScriptEnd

.PleaseTakeThisText:
	text_far SilphCo2FSilphWorkerFPleaseTakeThisText
	text_end

.ReceivedTM36Text:
	text_far _SilphCo2FSilphWorkerFReceivedTM36Text
	sound_get_item_1
	text_end

.TM36ExplanationText:
	text_far _SilphCo2FSilphWorkerFTM36ExplanationText
	text_end

.TM36NoRoomText:
	text_far _SilphCo2FSilphWorkerFTM36NoRoomText
	text_end

SilphCo2FScientist1Text:
	text_asm
	ld hl, SilphCo2TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo2FScientist2Text:
	text_asm
	ld hl, SilphCo2TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SilphCo2FRocket1Text:
	text_asm
	ld hl, SilphCo2TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SilphCo2FRocket2Text:
	text_asm
	ld hl, SilphCo2TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SilphCo2FScientist1BattleText:
	text_far _SilphCo2FScientist1BattleText
	text_end

SilphCo2FScientist1EndBattleText:
	text_far _SilphCo2FScientist1EndBattleText
	text_end

SilphCo2FScientist1AfterBattleText:
	text_far _SilphCo2FScientist1AfterBattleText
	text_end

SilphCo2FScientist2BattleText:
	text_far _SilphCo2FScientist2BattleText
	text_end

SilphCo2FScientist2EndBattleText:
	text_far _SilphCo2FScientist2EndBattleText
	text_end

SilphCo2FScientist2AfterBattleText:
	text_far _SilphCo2FScientist2AfterBattleText
	text_end

SilphCo2FRocket1BattleText:
	text_far _SilphCo2FRocket1BattleText
	text_end

SilphCo2FRocket1EndBattleText:
	text_far _SilphCo2FRocket1EndBattleText
	text_end

SilphCo2FRocket1AfterBattleText:
	text_far _SilphCo2FRocket1AfterBattleText
	text_end

SilphCo2FRocket2BattleText:
	text_far _SilphCo2FRocket2BattleText
	text_end

SilphCo2FRocket2EndBattleText:
	text_far _SilphCo2FRocket2EndBattleText
	text_end

SilphCo2FRocket2AfterBattleText:
	text_far _SilphCo2FRocket2AfterBattleText
	text_end
