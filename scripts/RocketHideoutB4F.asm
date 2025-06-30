RocketHideoutB4F_Script:
	call RocketHideoutB4FDoorCallbackScript
	call EnableAutoTextBoxDrawing
	ld hl, RocketHideout4TrainerHeaders
	ld de, RocketHideoutB4F_ScriptPointers
	ld a, [wRocketHideoutB4FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wRocketHideoutB4FCurScript], a
	ret

RocketHideoutB4FDoorCallbackScript:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	CheckEvent EVENT_ROCKET_HIDEOUT_4_DOOR_UNLOCKED
	jr nz, .door_already_unlocked
	CheckBothEventsSet EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_0, EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_1, 1
	jr z, .unlock_door
	ld a, $2d ; Door block
	jr .set_block
.unlock_door
	ld a, SFX_GO_INSIDE
	call PlaySound
	SetEvent EVENT_ROCKET_HIDEOUT_4_DOOR_UNLOCKED
.door_already_unlocked
	ld a, $e ; Floor block
.set_block
	ld [wNewTileBlockID], a
	lb bc, 5, 12
	predef_jump ReplaceTileBlock

RocketHideoutB4FSetDefaultScript:
	xor a
	ld [wJoyIgnore], a
	ld [wRocketHideoutB4FCurScript], a
	ld [wCurMapScript], a
	ret

RocketHideoutB4F_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROCKETHIDEOUTB4F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROCKETHIDEOUTB4F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROCKETHIDEOUTB4F_END_BATTLE
	dw_const RocketHideoutB4FBeatGiovanniScript,    SCRIPT_ROCKETHIDEOUTB4F_BEAT_GIOVANNI

RocketHideoutB4FBeatGiovanniScript:
	ld a, [wIsInBattle]
	cp $ff
	jp z, RocketHideoutB4FSetDefaultScript
	call UpdateSprites
	ld a, PAD_RIGHT | PAD_LEFT | PAD_UP | PAD_DOWN
	ld [wJoyIgnore], a
	SetEvent EVENT_BEAT_ROCKET_HIDEOUT_GIOVANNI
	ld a, TEXT_ROCKETHIDEOUTB4F_GIOVANNI_HOPE_WE_MEET_AGAIN
	ldh [hTextID], a
	call DisplayTextID
	call GBFadeOutToBlack
	ld a, HS_ROCKET_HIDEOUT_B4F_GIOVANNI
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_ROCKET_HIDEOUT_B4F_ITEM_4
	ld [wMissableObjectIndex], a
	predef ShowObject
	call UpdateSprites
	call GBFadeInFromBlack
	xor a
	ld [wJoyIgnore], a
	ld hl, wCurrentMapScriptFlags
	set BIT_CUR_MAP_LOADED_1, [hl]
	ld a, SCRIPT_ROCKETHIDEOUTB4F_DEFAULT
	ld [wRocketHideoutB4FCurScript], a
	ld [wCurMapScript], a
	ret

RocketHideoutB4F_TextPointers:
	def_text_pointers
	dw_const RocketHideoutB4FGiovanniText,                TEXT_ROCKETHIDEOUTB4F_GIOVANNI
	dw_const RocketHideoutB4FRocket1Text,                 TEXT_ROCKETHIDEOUTB4F_ROCKET1
	dw_const RocketHideoutB4FRocket2Text,                 TEXT_ROCKETHIDEOUTB4F_ROCKET2
	dw_const RocketHideoutB4FRocket3Text,                 TEXT_ROCKETHIDEOUTB4F_ROCKET3
	dw_const PickUpItemText,                              TEXT_ROCKETHIDEOUTB4F_HP_UP
	dw_const PickUpItemText,                              TEXT_ROCKETHIDEOUTB4F_TM_RAZOR_WIND
	dw_const PickUpItemText,                              TEXT_ROCKETHIDEOUTB4F_IRON
	dw_const PickUpItemText,                              TEXT_ROCKETHIDEOUTB4F_SILPH_SCOPE
	dw_const PickUpItemText,                              TEXT_ROCKETHIDEOUTB4F_LIFT_KEY
	dw_const RocketHideoutB4FGiovanniHopeWeMeetAgainText, TEXT_ROCKETHIDEOUTB4F_GIOVANNI_HOPE_WE_MEET_AGAIN

RocketHideout4TrainerHeaders:
	def_trainers 2
RocketHideout4TrainerHeader0:
	trainer EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_0, 0, RocketHideoutB4FRocket1BattleText, RocketHideoutB4FRocket1EndBattleText, RocketHideoutB4FRocket1AfterBattleText
RocketHideout4TrainerHeader1:
	trainer EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_1, 0, RocketHideoutB4FRocket2BattleText, RocketHideoutB4FRocket2EndBattleText, RocketHideoutB4FRocket2AfterBattleText
RocketHideout4TrainerHeader2:
	trainer EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_2, 1, RocketHideoutB4FRocket3BattleText, RocketHideoutB4FRocket3EndBattleText, RocketHideoutB4FRocket3AfterBattleText
	db -1 ; end

RocketHideoutB4FGiovanniText:
	text_asm
	CheckEvent EVENT_BEAT_ROCKET_HIDEOUT_GIOVANNI
	jp nz, .beat_giovanni
	ld hl, .ImpressedYouGotHereText
	call PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, .WhatCannotBeText
	ld de, .WhatCannotBeText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	xor a
	ldh [hJoyHeld], a
	ld a, SCRIPT_ROCKETHIDEOUTB4F_BEAT_GIOVANNI
	ld [wRocketHideoutB4FCurScript], a
	ld [wCurMapScript], a
	jr .done
.beat_giovanni
	ld hl, RocketHideoutB4FGiovanniHopeWeMeetAgainText
	call PrintText
.done
	jp TextScriptEnd

.ImpressedYouGotHereText:
	text_far _RocketHideoutB4FGiovanniImpressedYouGotHereText
	text_end

.WhatCannotBeText:
	text_far _RocketHideoutB4FGiovanniWhatCannotBeText
	text_end

RocketHideoutB4FGiovanniHopeWeMeetAgainText:
	text_far _RocketHideoutB4FGiovanniHopeWeMeetAgainText
	text_end

RocketHideoutB4FRocket1Text:
	text_asm
	ld hl, RocketHideout4TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

RocketHideoutB4FRocket1BattleText:
	text_far _RocketHideoutB4FRocket1BattleText
	text_end

RocketHideoutB4FRocket1EndBattleText:
	text_far _RocketHideoutB4FRocket1EndBattleText
	text_end

RocketHideoutB4FRocket1AfterBattleText:
	text_far _RocketHideoutB4FRocket1AfterBattleText
	text_end

RocketHideoutB4FRocket2Text:
	text_asm
	ld hl, RocketHideout4TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

RocketHideoutB4FRocket2BattleText:
	text_far _RocketHideoutB4FRocket2BattleText
	text_end

RocketHideoutB4FRocket2EndBattleText:
	text_far _RocketHideoutB4FRocket2EndBattleText
	text_end

RocketHideoutB4FRocket2AfterBattleText:
	text_far _RocketHideoutB4FRocket2AfterBattleText
	text_end

RocketHideoutB4FRocket3Text:
	text_asm
	ld hl, RocketHideout4TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

RocketHideoutB4FRocket3BattleText:
	text_far _RocketHideoutB4FRocket3BattleText
	text_end

RocketHideoutB4FRocket3EndBattleText:
	text_far _RocketHideoutB4FRocket3EndBattleText
	text_end

RocketHideoutB4FRocket3AfterBattleText:
	text_asm
	ld hl, .Text
	call PrintText
	CheckAndSetEvent EVENT_ROCKET_DROPPED_LIFT_KEY
	jr nz, .done
	ld a, HS_ROCKET_HIDEOUT_B4F_ITEM_5
	ld [wMissableObjectIndex], a
	predef ShowObject
.done
	jp TextScriptEnd

.Text:
	text_far _RocketHideoutB4FRocket3AfterBattleText
	text_end
