SilphCo7F_Script:
	call SilphCo7F_GateCallbackScript
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo7TrainerHeaders
	ld de, SilphCo7F_ScriptPointers
	ld a, [wSilphCo7FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphCo7FCurScript], a
	ret

SilphCo7F_GateCallbackScript:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	ld hl, .GateCoordinates
	call SilphCo7F_SetCardKeyDoorYScript
	call SilphCo7F_UnlockedDoorEventScript
	CheckEvent EVENT_SILPH_CO_7_UNLOCKED_DOOR1
	jr nz, .unlock_door1
	push af
	ld a, $54
	ld [wNewTileBlockID], a
	lb bc, 3, 5
	predef ReplaceTileBlock
	pop af
.unlock_door1
	CheckEventAfterBranchReuseA EVENT_SILPH_CO_7_UNLOCKED_DOOR2, EVENT_SILPH_CO_7_UNLOCKED_DOOR1
	jr nz, .unlock_door2
	push af
	ld a, $54
	ld [wNewTileBlockID], a
	lb bc, 2, 10
	predef ReplaceTileBlock
	pop af
.unlock_door2
	CheckEventAfterBranchReuseA EVENT_SILPH_CO_7_UNLOCKED_DOOR3, EVENT_SILPH_CO_7_UNLOCKED_DOOR2
	ret nz
	ld a, $54
	ld [wNewTileBlockID], a
	lb bc, 6, 10
	predef_jump ReplaceTileBlock

.GateCoordinates:
	dbmapcoord  5,  3
	dbmapcoord 10,  2
	dbmapcoord 10,  6
	db -1 ; end

SilphCo7F_SetCardKeyDoorYScript:
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

SilphCo7F_UnlockedDoorEventScript:
	EventFlagAddress hl, EVENT_SILPH_CO_7_UNLOCKED_DOOR1
	ldh a, [hUnlockedSilphCoDoors]
	and a
	ret z
	cp $1
	jr nz, .unlock_door1
	SetEventReuseHL EVENT_SILPH_CO_7_UNLOCKED_DOOR1
	ret
.unlock_door1
	cp $2
	jr nz, .unlock_door2
	SetEventAfterBranchReuseHL EVENT_SILPH_CO_7_UNLOCKED_DOOR2, EVENT_SILPH_CO_7_UNLOCKED_DOOR1
	ret
.unlock_door2
	SetEventAfterBranchReuseHL EVENT_SILPH_CO_7_UNLOCKED_DOOR3, EVENT_SILPH_CO_7_UNLOCKED_DOOR1
	ret

SilphCo7FSetDefaultScript:
	xor a
	ld [wJoyIgnore], a

SilphCo7FSetCurScript:
	ld [wSilphCo7FCurScript], a
	ld [wCurMapScript], a
	ret

SilphCo7F_ScriptPointers:
	def_script_pointers
	dw_const SilphCo7FDefaultScript,                SCRIPT_SILPHCO7F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_SILPHCO7F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_SILPHCO7F_END_BATTLE
	dw_const SilphCo7FRivalStartBattleScript,       SCRIPT_SILPHCO7F_RIVAL_START_BATTLE
	dw_const SilphCo7FRivalAfterBattleScript,       SCRIPT_SILPHCO7F_RIVAL_AFTER_BATTLE
	dw_const SilphCo7FRivalExitScript,              SCRIPT_SILPHCO7F_RIVAL_EXIT

SilphCo7FDefaultScript:
	CheckEvent EVENT_BEAT_SILPH_CO_RIVAL
	jp nz, CheckFightingMapTrainers
	ld hl, .RivalEncounterCoordinates
	call ArePlayerCoordsInArray
	jp nc, CheckFightingMapTrainers
	xor a
	ldh [hJoyHeld], a
	ld a, PAD_RIGHT | PAD_LEFT | PAD_UP | PAD_DOWN
	ld [wJoyIgnore], a
	ld a, PLAYER_DIR_DOWN
	ld [wPlayerMovingDirection], a
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	call PlaySound
	ld c, BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	ld a, TEXT_SILPHCO7F_RIVAL
	ldh [hTextID], a
	call DisplayTextID
	ld a, SILPHCO7F_RIVAL
	ldh [hSpriteIndex], a
	call SetSpriteMovementBytesToFF
	ld de, .RivalMovementUp
	ld a, [wCoordIndex]
	ld [wSavedCoordIndex], a
	cp 1 ; index of second, lower entry in .RivalEncounterCoordinates
	jr z, .full_rival_movement
	inc de
.full_rival_movement
	ld a, SILPHCO7F_RIVAL
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, SCRIPT_SILPHCO7F_RIVAL_START_BATTLE
	jp SilphCo7FSetCurScript

.RivalEncounterCoordinates:
	dbmapcoord  3,  2
	dbmapcoord  3,  3
	db -1 ; end

.RivalMovementUp:
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db -1 ; end

SilphCo7FRivalStartBattleScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, TEXT_SILPHCO7F_RIVAL_WAITED_HERE
	ldh [hTextID], a
	call DisplayTextID
	call Delay3
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, SilphCo7FRivalDefeatedText
	ld de, SilphCo7FRivalVictoryText
	call SaveEndBattleTextPointers
	ld a, OPP_RIVAL2
	ld [wCurOpponent], a
	ld a, [wRivalStarter]
	cp STARTER2
	jr nz, .not_starter_2
	ld a, $7
	jr .set_trainer_no
.not_starter_2
	cp STARTER3
	jr nz, .no_starter_3
	ld a, $8
	jr .set_trainer_no
.no_starter_3
	ld a, $9
.set_trainer_no
	ld [wTrainerNo], a
	ld a, SCRIPT_SILPHCO7F_RIVAL_AFTER_BATTLE
	jp SilphCo7FSetCurScript

SilphCo7FRivalAfterBattleScript:
	ld a, [wIsInBattle]
	cp $ff
	jp z, SilphCo7FSetDefaultScript
	ld a, PAD_RIGHT | PAD_LEFT | PAD_UP | PAD_DOWN
	ld [wJoyIgnore], a
	SetEvent EVENT_BEAT_SILPH_CO_RIVAL
	ld a, PLAYER_DIR_DOWN
	ld [wPlayerMovingDirection], a
	ld a, SILPHCO7F_RIVAL
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_UP
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, TEXT_SILPHCO7F_RIVAL_GOOD_LUCK_TO_YOU
	ldh [hTextID], a
	call DisplayTextID
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	call PlaySound
	farcall Music_RivalAlternateStart
	ld de, .RivalWalkAroundPlayerMovement
	ld a, [wSavedCoordIndex]
	cp 1 ; index of second, lower entry in SilphCo7FDefaultScript.RivalEncounterCoordinates
	jr nz, .walk_around_player
	ld de, .RivalExitRightMovement
.walk_around_player
	ld a, SILPHCO7F_RIVAL
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, SCRIPT_SILPHCO7F_RIVAL_EXIT
	jp SilphCo7FSetCurScript

.RivalExitRightMovement:
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db -1 ; end

.RivalWalkAroundPlayerMovement:
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db -1 ; end

SilphCo7FRivalExitScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, HS_SILPH_CO_7F_RIVAL
	ld [wMissableObjectIndex], a
	predef HideObject
	call PlayDefaultMusic
	xor a
	ld [wJoyIgnore], a
	jp SilphCo7FSetCurScript

SilphCo7F_TextPointers:
	def_text_pointers
	dw_const SilphCo7FSilphWorkerM1Text,      TEXT_SILPHCO7F_SILPH_WORKER_M1
	dw_const SilphCo7FSilphWorkerM2Text,      TEXT_SILPHCO7F_SILPH_WORKER_M2
	dw_const SilphCo7FSilphWorkerM3Text,      TEXT_SILPHCO7F_SILPH_WORKER_M3
	dw_const SilphCo7FSilphWorkerM4Text,      TEXT_SILPHCO7F_SILPH_WORKER_M4
	dw_const SilphCo7FRocket1Text,            TEXT_SILPHCO7F_ROCKET1
	dw_const SilphCo7FScientistText,          TEXT_SILPHCO7F_SCIENTIST
	dw_const SilphCo7FRocket2Text,            TEXT_SILPHCO7F_ROCKET2
	dw_const SilphCo7FRocket3Text,            TEXT_SILPHCO7F_ROCKET3
	dw_const SilphCo7FRivalText,              TEXT_SILPHCO7F_RIVAL
	dw_const PickUpItemText,                  TEXT_SILPHCO7F_CALCIUM
	dw_const PickUpItemText,                  TEXT_SILPHCO7F_TM_SWORDS_DANCE
	dw_const PickUpItemText,                  TEXT_SILPHCO7F_UNREFERENCED_ITEM ; unreferenced
	dw_const SilphCo7FRivalWaitedHereText,    TEXT_SILPHCO7F_RIVAL_WAITED_HERE
	dw_const SilphCo7FRivalDefeatedText,      TEXT_SILPHCO7F_RIVAL_DEFEATED
	dw_const SilphCo7FRivalGoodLuckToYouText, TEXT_SILPHCO7F_RIVAL_GOOD_LUCK_TO_YOU

SilphCo7TrainerHeaders:
	def_trainers 5
SilphCo7TrainerHeader0:
	trainer EVENT_BEAT_SILPH_CO_7F_TRAINER_0, 2, SilphCo7FRocket1BattleText, SilphCo7FRocket1EndBattleText, SilphCo7FRocket1AfterBattleText
SilphCo7TrainerHeader1:
	trainer EVENT_BEAT_SILPH_CO_7F_TRAINER_1, 3, SilphCo7FScientistBattleText, SilphCo7FScientistEndBattleText, SilphCo7FScientistAfterBattleText
SilphCo7TrainerHeader2:
	trainer EVENT_BEAT_SILPH_CO_7F_TRAINER_2, 3, SilphCo7FRocket2BattleText, SilphCo7FRocket2EndBattleText, SilphCo7FRocket2AfterBattleText
SilphCo7TrainerHeader3:
	trainer EVENT_BEAT_SILPH_CO_7F_TRAINER_3, 4, SilphCo7FRocket3BattleText, SilphCo7FRocket3EndBattleText, SilphCo7FRocket3AfterBattleText
	db -1 ; end

SilphCo7FSilphWorkerM1Text:
; lapras guy
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_GOT_LAPRAS, a
	jr z, .give_lapras
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	jr nz, .saved_silph
	ld hl, .IsOurPresidentOkText
	call PrintText
	jr .done
.give_lapras
	ld hl, .HaveThisPokemonText
	call PrintText
	lb bc, LAPRAS, 15
	call GivePokemon
	jr nc, .done
	ld a, [wAddedToParty]
	and a
	call z, WaitForTextScrollButtonPress
	call EnableAutoTextBoxDrawing
	ld hl, .LaprasDescriptionText
	call PrintText
	ld hl, wStatusFlags4
	set BIT_GOT_LAPRAS, [hl]
	jr .done
.saved_silph
	ld hl, .SavedText
	call PrintText
.done
	jp TextScriptEnd

.HaveThisPokemonText
	text_far _SilphCo7FSilphWorkerM1HaveThisPokemonText
	text_end

.LaprasDescriptionText
	text_far _SilphCo7FSilphWorkerM1LaprasDescriptionText
	text_end

.IsOurPresidentOkText
	text_far _SilphCo7FSilphWorkerM1IsOurPresidentOkText
	text_end

.SavedText
	text_far _SilphCo7FSilphWorkerM1SavedText
	text_end

SilphCo7FSilphWorkerM2Text:
	text_asm
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	jr nz, .saved_silph
	ld hl, .AfterTheMasterBallText
	call PrintText
	jr .done
.saved_silph
	ld hl, .CancelledTheMasterBallText
	call PrintText
.done
	jp TextScriptEnd

.AfterTheMasterBallText
	text_far _SilphCo7FSilphWorkerM2AfterTheMasterBallText
	text_end

.CancelledTheMasterBallText
	text_far _SilphCo7FSilphWorkerM2CancelledMasterBallText
	text_end

SilphCo7FSilphWorkerM3Text:
	text_asm
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	jr nz, .saved_silph
	ld hl, .ItWouldBeBadText
	call PrintText
	jr .done
.saved_silph
	ld hl, .YouChasedOffTeamRocketText
	call PrintText
.done
	jp TextScriptEnd

.ItWouldBeBadText
	text_far _SilphCo7FSilphWorkerM3ItWouldBeBadText
	text_end

.YouChasedOffTeamRocketText
	text_far _SilphCo7FSilphWorkerM3YouChasedOffTeamRocketText
	text_end

SilphCo7FSilphWorkerM4Text:
	text_asm
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	jr nz, .saved_silph
	ld hl, .ItsReallyDangerousHereText
	call PrintText
	jr .done
.saved_silph
	ld hl, .SafeAtLastText
	call PrintText
.done
	jp TextScriptEnd

.ItsReallyDangerousHereText
	text_far _SilphCo7FSilphWorkerM4ItsReallyDangerousHereText
	text_end

.SafeAtLastText
	text_far _SilphCo7FSilphWorkerM4SafeAtLastText
	text_end

SilphCo7FRocket1Text:
	text_asm
	ld hl, SilphCo7TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo7FRocket1BattleText:
	text_far _SilphCo7FRocket1BattleText
	text_end

SilphCo7FRocket1EndBattleText:
	text_far _SilphCo7FRocket1EndBattleText
	text_end

SilphCo7FRocket1AfterBattleText:
	text_far _SilphCo7FRocket1AfterBattleText
	text_end

SilphCo7FScientistText:
	text_asm
	ld hl, SilphCo7TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SilphCo7FScientistBattleText:
	text_far _SilphCo7FScientistBattleText
	text_end

SilphCo7FScientistEndBattleText:
	text_far _SilphCo7FScientistEndBattleText
	text_end

SilphCo7FScientistAfterBattleText:
	text_far _SilphCo7FScientistAfterBattleText
	text_end

SilphCo7FRocket2Text:
	text_asm
	ld hl, SilphCo7TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SilphCo7FRocket2BattleText:
	text_far _SilphCo7FRocket2BattleText
	text_end

SilphCo7FRocket2EndBattleText:
	text_far _SilphCo7FRocket2EndBattleText
	text_end

SilphCo7FRocket2AfterBattleText:
	text_far _SilphCo7FRocket2AfterBattleText
	text_end

SilphCo7FRocket3Text:
	text_asm
	ld hl, SilphCo7TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SilphCo7FRocket3BattleText:
	text_far _SilphCo7FRocket3BattleText
	text_end

SilphCo7FRocket3EndBattleText:
	text_far _SilphCo7FRocket3EndBattleText
	text_end

SilphCo7FRocket3AfterBattleText:
	text_far _SilphCo7FRocket3AfterBattleText
	text_end

SilphCo7FRivalText:
	text_asm
	ld hl, .Text
	call PrintText
	jp TextScriptEnd

.Text:
	text_far _SilphCo7FRivalText
	text_end

SilphCo7FRivalWaitedHereText:
	text_far _SilphCo7FRivalWaitedHereText
	text_end

SilphCo7FRivalDefeatedText:
	text_far _SilphCo7FRivalDefeatedText
	text_end

SilphCo7FRivalVictoryText:
	text_far _SilphCo7FRivalVictoryText
	text_end

SilphCo7FRivalGoodLuckToYouText:
	text_far _SilphCo7FRivalGoodLuckToYouText
	text_end
