SilphCo9F_Script:
	call SilphCo9FGateCallbackScript
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo9TrainerHeaders
	ld de, SilphCo9F_ScriptPointers
	ld a, [wSilphCo9FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphCo9FCurScript], a
	ret

SilphCo9FGateCallbackScript:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	ld hl, .GateCoordinates
	call SilphCo9F_SetCardKeyDoorYScript
	call SilphCo9F_SetUnlockedSilphCoDoorsScript
	CheckEvent EVENT_SILPH_CO_9_UNLOCKED_DOOR1
	jr nz, .unlock_door1
	push af
	ld a, $5f
	ld [wNewTileBlockID], a
	lb bc, 4, 1
	predef ReplaceTileBlock
	pop af
.unlock_door1
	CheckEventAfterBranchReuseA EVENT_SILPH_CO_9_UNLOCKED_DOOR2, EVENT_SILPH_CO_9_UNLOCKED_DOOR1
	jr nz, .unlock_door2
	push af
	ld a, $54
	ld [wNewTileBlockID], a
	lb bc, 2, 9
	predef ReplaceTileBlock
	pop af
.unlock_door2
	CheckEventAfterBranchReuseA EVENT_SILPH_CO_9_UNLOCKED_DOOR3, EVENT_SILPH_CO_9_UNLOCKED_DOOR2
	jr nz, .unlock_door3
	push af
	ld a, $54
	ld [wNewTileBlockID], a
	lb bc, 5, 9
	predef ReplaceTileBlock
	pop af
.unlock_door3
	CheckEventAfterBranchReuseA EVENT_SILPH_CO_9_UNLOCKED_DOOR4, EVENT_SILPH_CO_9_UNLOCKED_DOOR3
	ret nz
	ld a, $5f
	ld [wNewTileBlockID], a
	lb bc, 6, 5
	predef_jump ReplaceTileBlock

.GateCoordinates:
	dbmapcoord  1,  4
	dbmapcoord  9,  2
	dbmapcoord  9,  5
	dbmapcoord  5,  6
	db -1 ; end

SilphCo9F_SetCardKeyDoorYScript:
	push hl
	ld hl, wCardKeyDoorY
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	xor a
	ldh [hUnlockedSilphCoDoors], a
	pop hl
.loop_card_key_doors
	ld a, [hli]
	cp $ff
	jr z, .exit_loop
	push hl
	ld hl, hUnlockedSilphCoDoors
	inc [hl]
	pop hl
	cp b
	jr z, .check_door
	inc hl
	jr .loop_card_key_doors
.check_door
	ld a, [hli]
	cp c
	jr nz, .loop_card_key_doors
	ld hl, wCardKeyDoorY
	xor a
	ld [hli], a
	ld [hl], a
	ret
.exit_loop
	xor a
	ldh [hUnlockedSilphCoDoors], a
	ret

SilphCo9F_SetUnlockedSilphCoDoorsScript:
	EventFlagAddress hl, EVENT_SILPH_CO_9_UNLOCKED_DOOR1
	ldh a, [hUnlockedSilphCoDoors]
	and a
	ret z
	cp $1
	jr nz, .unlock_door1
	SetEventReuseHL EVENT_SILPH_CO_9_UNLOCKED_DOOR1
	ret
.unlock_door1
	cp $2
	jr nz, .unlock_door2
	SetEventAfterBranchReuseHL EVENT_SILPH_CO_9_UNLOCKED_DOOR2, EVENT_SILPH_CO_9_UNLOCKED_DOOR1
	ret
.unlock_door2
	cp $3
	jr nz, .unlock_door3
	SetEventAfterBranchReuseHL EVENT_SILPH_CO_9_UNLOCKED_DOOR3, EVENT_SILPH_CO_9_UNLOCKED_DOOR1
	ret
.unlock_door3
	cp $4
	ret nz
	SetEventAfterBranchReuseHL EVENT_SILPH_CO_9_UNLOCKED_DOOR4, EVENT_SILPH_CO_9_UNLOCKED_DOOR1
	ret

SilphCo9F_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_SILPHCO9F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_SILPHCO9F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_SILPHCO9F_END_BATTLE

SilphCo9F_TextPointers:
	def_text_pointers
	dw_const SilphCo9FNurseText,     TEXT_SILPHCO9F_NURSE
	dw_const SilphCo9FRocket1Text,   TEXT_SILPHCO9F_ROCKET1
	dw_const SilphCo9FScientistText, TEXT_SILPHCO9F_SCIENTIST
	dw_const SilphCo9FRocket2Text,   TEXT_SILPHCO9F_ROCKET2

SilphCo9TrainerHeaders:
	def_trainers 2
SilphCo9TrainerHeader0:
	trainer EVENT_BEAT_SILPH_CO_9F_TRAINER_0, 4, SilphCo9FRocket1BattleText, SilphCo9FRocket1EndBattleText, SilphCo9FRocket1AfterBattleText
SilphCo9TrainerHeader1:
	trainer EVENT_BEAT_SILPH_CO_9F_TRAINER_1, 2, SilphCo9FScientistBattleText, SilphCo9FScientistEndBattleText, SilphCo9FScientistAfterBattleText
SilphCo9TrainerHeader2:
	trainer EVENT_BEAT_SILPH_CO_9F_TRAINER_2, 4, SilphCo9FRocket2BattleText, SilphCo9FRocket2EndBattleText, SilphCo9FRocket2AfterBattleText
	db -1 ; end

SilphCo9FNurseText:
	text_asm
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	jr nz, .beat_giovanni
	ld hl, .YouLookTiredText
	call PrintText
	predef HealParty
	call GBFadeOutToWhite
	call Delay3
	call GBFadeInFromWhite
	ld hl, .DontGiveUpText
	call PrintText
	jr .text_script_end
.beat_giovanni
	ld hl, .ThankYouText
	call PrintText
.text_script_end
	jp TextScriptEnd

.YouLookTiredText:
	text_far SilphCo9FNurseYouLookTiredText
	text_end

.DontGiveUpText:
	text_far SilphCo9FNurseDontGiveUpText
	text_end

.ThankYouText:
	text_far SilphCo9FNurseThankYouText
	text_end

SilphCo9FRocket1Text:
	text_asm
	ld hl, SilphCo9TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo9FScientistText:
	text_asm
	ld hl, SilphCo9TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SilphCo9FRocket2Text:
	text_asm
	ld hl, SilphCo9TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SilphCo9FRocket1BattleText:
	text_far _SilphCo9FRocket1BattleText
	text_end

SilphCo9FRocket1EndBattleText:
	text_far _SilphCo9FRocket1EndBattleText
	text_end

SilphCo9FRocket1AfterBattleText:
	text_far _SilphCo9FRocket1AfterBattleText
	text_end

SilphCo9FScientistBattleText:
	text_far _SilphCo9FScientistBattleText
	text_end

SilphCo9FScientistEndBattleText:
	text_far _SilphCo9FScientistEndBattleText
	text_end

SilphCo9FScientistAfterBattleText:
	text_far _SilphCo9FScientistAfterBattleText
	text_end

SilphCo9FRocket2BattleText:
	text_far _SilphCo9FRocket2BattleText
	text_end

SilphCo9FRocket2EndBattleText:
	text_far _SilphCo9FRocket2EndBattleText
	text_end

SilphCo9FRocket2AfterBattleText:
	text_far _SilphCo9FRocket2AfterBattleText
	text_end
