; PureRGBnote: CHANGED: ADDED: the super nerd who you both get fossils on this floor will now ask to take your fossil right away
; and then meet him in saffron city to receive the revived pokemon. Frees up some space in your items.
MtMoonB2F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, MtMoon3TrainerHeaders
	ld de, MtMoonB2F_ScriptPointers
	ld a, [wMtMoonB2FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wMtMoonB2FCurScript], a
	CheckEvent EVENT_BEAT_MT_MOON_EXIT_SUPER_NERD
	ret z
	ld hl, MtMoonB2FFossilAreaCoords
	call ArePlayerCoordsInArray
	jr nc, .enable_battles
	ld hl, wStatusFlags4
	set BIT_NO_BATTLES, [hl]
	ret
.enable_battles
	ld hl, wStatusFlags4
	res BIT_NO_BATTLES, [hl]
	ret

MtMoonB2FFossilAreaCoords:
	dbmapcoord 11,  5
	dbmapcoord 12,  5
	dbmapcoord 13,  5
	dbmapcoord 14,  5
	dbmapcoord 11,  6
	dbmapcoord 12,  6
	dbmapcoord 13,  6
	dbmapcoord 14,  6
	dbmapcoord 11,  7
	dbmapcoord 12,  7
	dbmapcoord 13,  7
	dbmapcoord 14,  7
	dbmapcoord 11,  8
	dbmapcoord 12,  8
	dbmapcoord 13,  8
	dbmapcoord 14,  8
	db -1 ; end

MtMoonB2FResetScripts:
	xor a ; SCRIPT_MTMOONB2F_DEFAULT
	ld [wJoyIgnore], a
	ld [wMtMoonB2FCurScript], a
	ld [wCurMapScript], a
	ret

MtMoonB2F_ScriptPointers:
	def_script_pointers
	dw_const MtMoonB2FDefaultScript,                   SCRIPT_MTMOONB2F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle,    SCRIPT_MTMOONB2F_START_BATTLE
	dw_const EndTrainerBattle,                         SCRIPT_MTMOONB2F_END_BATTLE
	dw_const MtMoonB2FDefeatedSuperNerdScript,         SCRIPT_MTMOONB2F_DEFEATED_SUPER_NERD
	dw_const MtMoonB2FMoveSuperNerdScript,             SCRIPT_MTMOONB2F_MOVE_SUPER_NERD
	dw_const MtMoonB2FSuperNerdTakesOtherFossilScript, SCRIPT_MTMOONB2F_SUPER_NERD_TAKES_OTHER_FOSSIL

MtMoonB2FDefaultScript:
	CheckEvent EVENT_BEAT_MT_MOON_EXIT_SUPER_NERD
	jp nz, CheckFightingMapTrainers ; PureRGBnote: FIXED: allow trainers to sight player regardless of if you obtained fossils
	ld a, [wYCoord]
	cp 8
	jp nz, CheckFightingMapTrainers ; PureRGBnote: FIXED: allow trainers to sight player regardless of if you obtained fossils
	ld a, [wXCoord]
	cp 13
	jp nz, CheckFightingMapTrainers ; PureRGBnote: FIXED: allow trainers to sight player regardless of if you obtained fossils
	xor a
	ldh [hJoyHeld], a
	ld a, TEXT_MTMOONB2F_SUPER_NERD
	ldh [hTextID], a
	jp DisplayTextID

MtMoonB2FDefeatedSuperNerdScript:
	ld a, [wIsInBattle]
	cp $ff
	jp z, MtMoonB2FResetScripts
	call UpdateSprites
	call Delay3
	SetEvent EVENT_BEAT_MT_MOON_EXIT_SUPER_NERD
	xor a
	ld [wJoyIgnore], a
	ld a, SCRIPT_MTMOONB2F_DEFAULT
	ld [wMtMoonB2FCurScript], a
	ld [wCurMapScript], a
	ret

MtMoonB2FMoveSuperNerdScript:
	ld a, MTMOONB2F_SUPER_NERD
	ldh [hSpriteIndex], a
	call SetSpriteMovementBytesToFF
	ld hl, MtMoonB2FPlayerNearDomeFossilCoords
	call ArePlayerCoordsInArray
	jr c, .player_near_dome_fossil
	ld hl, MtMoonB2FPlayerNearHelixFossilCoords
	call ArePlayerCoordsInArray
	jp nc, CheckFightingMapTrainers
	ld de, MtMoon3FSuperNerdMoveUpMovementData
	jr .continue
.player_near_dome_fossil
	ld de, MtMoon3FSuperNerdMoveRightMovementData
.continue
	ld a, MTMOONB2F_SUPER_NERD
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, SCRIPT_MTMOONB2F_SUPER_NERD_TAKES_OTHER_FOSSIL
	ld [wMtMoonB2FCurScript], a
	ld [wCurMapScript], a
	ret

MtMoonB2FPlayerNearDomeFossilCoords:
	dbmapcoord 12,  7
	dbmapcoord 11,  6
	dbmapcoord 12,  5
	db -1 ; end

MtMoonB2FPlayerNearHelixFossilCoords:
	dbmapcoord 13,  7
	dbmapcoord 14,  6
	dbmapcoord 14,  5
	db -1 ; end

MtMoon3FSuperNerdMoveRightMovementData:
	db NPC_MOVEMENT_RIGHT
MtMoon3FSuperNerdMoveUpMovementData:
	db NPC_MOVEMENT_UP
	db -1 ; end

MtMoonB2FSuperNerdTakesOtherFossilScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld a, TEXT_MTMOONB2F_SUPER_NERD_THEN_THIS_IS_MINE
	ldh [hTextID], a
	call DisplayTextID
	CheckEvent EVENT_GOT_DOME_FOSSIL
	ld a, HS_MT_MOON_B2F_FOSSIL_1
	jr z, .continue
	ld a, HS_MT_MOON_B2F_FOSSIL_2
.continue
	ld [wMissableObjectIndex], a
	predef HideObject
	; ask the player if they want to give the nerd their fossil right away, and can collect their fossil pokemon in saffron later
	ld a, 1
	ldh [hSpriteIndex], a
	CheckEvent EVENT_GOT_DOME_FOSSIL
	jr z, .right
	; make player face super nerd
	ld a, PLAYER_DIR_RIGHT
	ld [wPlayerMovingDirection], a
	; make super nerd face player
	ld a, SPRITE_FACING_LEFT
	jr .doFacing
.right
	; make player face super nerd
	ld a, PLAYER_DIR_LEFT
	ld [wPlayerMovingDirection], a
	; make super nerd face player
	ld a, SPRITE_FACING_RIGHT
.doFacing
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld [wJoyIgnore], a
	ld a, 11
	ldh [hTextID], a
	call DisplayTextID

;;;;;;;;;; PureRGBnote: ADDED: hide or show the fossil in seafoam islands depending on what you chose
	CheckEvent EVENT_GOT_DOME_FOSSIL
	ld a, HS_SEAFOAM_ISLANDS_B3F_DOME_FOSSIL
	jr nz, .hideObjectSeafoam
	CheckEvent EVENT_GOT_HELIX_FOSSIL
	ld a, HS_SEAFOAM_ISLANDS_B3F_HELIX_FOSSIL
	jr z, .done
.hideObjectSeafoam
	ld [wMissableObjectIndex], a
	predef HideObject
;;;;;;;;;;
.done
	; done
	ld a, SCRIPT_MTMOONB2F_DEFAULT
	ld [wMtMoonB2FCurScript], a
	ld [wCurMapScript], a
	ret

MtMoonB2F_TextPointers:
	def_text_pointers
	dw_const MtMoonB2FSuperNerdText,                 TEXT_MTMOONB2F_SUPER_NERD
	dw_const MtMoonB2FRocket1Text,                   TEXT_MTMOONB2F_ROCKET1
	dw_const MtMoonB2FRocket2Text,                   TEXT_MTMOONB2F_ROCKET2
	dw_const MtMoonB2FRocket3Text,                   TEXT_MTMOONB2F_ROCKET3
	dw_const MtMoonB2FRocket4Text,                   TEXT_MTMOONB2F_ROCKET4
	dw_const MtMoonB2FDomeFossilText,                TEXT_MTMOONB2F_DOME_FOSSIL
	dw_const MtMoonB2FHelixFossilText,               TEXT_MTMOONB2F_HELIX_FOSSIL
	dw_const PickUpItemText,                         TEXT_MTMOONB2F_ITEM1
	dw_const PickUpItemText,                         TEXT_MTMOONB2F_ITEM2
	dw_const MtMoonB2FSuperNerdThenThisIsMineText,   TEXT_MTMOONB2F_SUPER_NERD_THEN_THIS_IS_MINE
	dw_const MtMoonSuperNerdTakeFossilQuestionText,  TEXT_MTMOONB2F_SUPER_NERD_FOSSIL_QUESTION

MtMoon3TrainerHeaders:
	def_trainers 2
MtMoon3TrainerHeader0:
	trainer EVENT_BEAT_MT_MOON_3_TRAINER_0, 4, MtMoonB2FRocket1BattleText, MtMoonB2FRocket1EndBattleText, MtMoonB2FRocket1AfterBattleText
MtMoon3TrainerHeader1:
	trainer EVENT_BEAT_MT_MOON_3_TRAINER_1, 4, MtMoonB2FRocket2BattleText, MtMoonB2FRocket2EndBattleText, MtMoonB2FRocket2AfterBattleText
MtMoon3TrainerHeader2:
	trainer EVENT_BEAT_MT_MOON_3_TRAINER_2, 4, MtMoonB2FRocket3BattleText, MtMoonB2FRocket3EndBattleText, MtMoonB2FRocket3AfterBattleText
MtMoon3TrainerHeader3:
	trainer EVENT_BEAT_MT_MOON_3_TRAINER_3, 4, MtMoonB2FRocket4BattleText, MtMoonB2FRocket4EndBattleText, MtMoonB2FRocket4AfterBattleText
	db -1 ; end

MtMoonB2FSuperNerdText:
	text_asm
	CheckEvent EVENT_BEAT_MT_MOON_EXIT_SUPER_NERD
	jr z, .beat_super_nerd
	CheckEitherEventSet EVENT_GOT_DOME_FOSSIL, EVENT_GOT_HELIX_FOSSIL, 1
	jr nz, .got_a_fossil
	ld hl, MtMoonB2fSuperNerdEachTakeOneText
	rst _PrintText
	jr .done
.beat_super_nerd
	ld hl, MtMoonB2FSuperNerdTheyreBothMineText
	rst _PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, MtMoonB2FSuperNerdOkIllShareText
	ld de, MtMoonB2FSuperNerdOkIllShareText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, SCRIPT_MTMOONB2F_DEFEATED_SUPER_NERD
	ld [wMtMoonB2FCurScript], a
	ld [wCurMapScript], a
	jr .done
.got_a_fossil
	call MtMoonSuperNerdTakeFossilQuestion
.done
	rst TextScriptEnd

MtMoonB2FRocket1Text:
	text_asm
	ld hl, MtMoon3TrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd

MtMoonB2FRocket2Text:
	text_asm
	ld hl, MtMoon3TrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd

MtMoonB2FRocket3Text:
	text_asm
	ld hl, MtMoon3TrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd

MtMoonB2FRocket4Text:
	text_asm
	ld hl, MtMoon3TrainerHeader3
	call TalkToTrainer
	rst TextScriptEnd

MtMoonB2FDomeFossilText:
	text_asm
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, .YouWantText
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .done
	lb bc, DOME_FOSSIL, 1
	call GiveItem
	jp nc, MtMoonB2FYouHaveNoRoomText
	call MtMoonB2FReceivedFossilText
	ld a, HS_MT_MOON_B2F_FOSSIL_1
	ld [wMissableObjectIndex], a
	predef HideObject
	SetEvent EVENT_GOT_DOME_FOSSIL
	ld a, SCRIPT_MTMOONB2F_MOVE_SUPER_NERD
	ld [wMtMoonB2FCurScript], a
	ld [wCurMapScript], a
.done
	rst TextScriptEnd

.YouWantText:
	text_far _MtMoonB2FDomeFossilYouWantText
	text_end

MtMoonB2FHelixFossilText:
	text_asm
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, .YouWantText
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .done
	lb bc, HELIX_FOSSIL, 1
	call GiveItem
	jp nc, MtMoonB2FYouHaveNoRoomText
	call MtMoonB2FReceivedFossilText
	ld a, HS_MT_MOON_B2F_FOSSIL_2
	ld [wMissableObjectIndex], a
	predef HideObject
	SetEvent EVENT_GOT_HELIX_FOSSIL
	ld a, SCRIPT_MTMOONB2F_MOVE_SUPER_NERD
	ld [wMtMoonB2FCurScript], a
	ld [wCurMapScript], a
.done
	rst TextScriptEnd

.YouWantText:
	text_far _MtMoonB2FHelixFossilYouWantText
	text_end

MtMoonB2FReceivedFossilText:
	ld hl, .Text
	jp PrintText

.Text:
	text_far _MtMoonB2FReceivedFossilText
	sound_get_key_item
	text_waitbutton
	text_end

MtMoonB2FYouHaveNoRoomText:
	ld hl, .Text
	rst _PrintText
	rst TextScriptEnd

.Text:
	text_far _MtMoonB2FYouHaveNoRoomText
	text_waitbutton
	text_end

MtMoonB2FSuperNerdTheyreBothMineText:
	text_far _MtMoonB2FSuperNerdTheyreBothMineText
	text_end

MtMoonB2FSuperNerdOkIllShareText:
	text_far _MtMoonB2FSuperNerdOkIllShareText
	text_end

MtMoonB2fSuperNerdEachTakeOneText:
	text_far _MtMoonB2fSuperNerdEachTakeOneText
	text_end

MtMoonB2FSuperNerdTheresAPokemonLabText:
	text_far _MtMoonB2FSuperNerdTheresAPokemonLabText
	text_end

MtMoonB2FSuperNerdThenThisIsMineText:
	text_far _MtMoonB2FSuperNerdThenThisIsMineText
	sound_get_key_item
	text_end

MtMoonSuperNerdTakeFossilQuestionText:
	text_asm
	call MtMoonSuperNerdTakeFossilQuestion
	rst TextScriptEnd

MtMoonSuperNerdTakeFossilQuestion:
	CheckEvent EVENT_RECEIVED_FOSSIL_PKMN_FROM_SUPER_NERD
	jr nz, .lookingForMoreFossils
	CheckEvent EVENT_GAVE_FOSSIL_TO_SUPER_NERD
	jr nz, .end
	ld hl, MtMoonB2FSuperNerdTheresAPokemonLabText
	rst _PrintText
	ld hl, MtMoon3TextSuperNerdGiveFossil
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .no
.yes
	CheckEvent EVENT_GOT_DOME_FOSSIL
	ld b, DOME_FOSSIL
	jr nz, .isInBag
	ld b, HELIX_FOSSIL
.isInBag
	call IsItemInBag
	jr nz, .haveFossil
.noFossil
	ld hl, MtMoon3TextSuperNerdNoFossil
	rst _PrintText
	ret
.haveFossil
	SetEvent EVENT_GAVE_FOSSIL_TO_SUPER_NERD
	CheckEvent EVENT_GOT_DOME_FOSSIL
	jr nz, .domeRemove
	ld hl, MtMoon3TextSuperNerdGaveHelix
	rst _PrintText
	ld a, HELIX_FOSSIL
	jr .removeItem
.domeRemove
	ld hl, MtMoon3TextSuperNerdGaveDome
	rst _PrintText
	ld a, DOME_FOSSIL
.removeItem
	ldh [hItemToRemoveID], a
	farcall RemoveItemByID
	ld hl, MtMoon3TextSuperNerdGaveFossil
	rst _PrintText
.end
	ld hl, MtMoon3TextSuperNerdGaveFossilEnd
	rst _PrintText
	ret
.lookingForMoreFossils
	ld hl, MtMoon3TextSuperNerdLookingForMoreFossils
	rst _PrintText
	ret
.no
	ld hl, MtMoon3TextSuperNerdKeptFossil
	rst _PrintText
	ret
	
MtMoon3TextSuperNerdNoFossil:
	text_far _MtMoon3TextSuperNerdNoFossil
	text_end

MtMoon3TextSuperNerdGiveFossil:
	text_far _MtMoon3TextSuperNerdGiveFossil
	text_end

MtMoon3TextSuperNerdGaveFossil:
	text_far _MtMoon3TextSuperNerdGaveFossil
	text_end

MtMoon3TextSuperNerdGaveHelix:
	text_far _MtMoon3TextSuperNerdGaveHelix
	sound_get_item_1
	text_end

MtMoon3TextSuperNerdGaveDome:
	text_far _MtMoon3TextSuperNerdGaveDome
	sound_get_item_1
	text_end

MtMoon3TextSuperNerdGaveFossilEnd:
	text_far _MtMoon3TextSuperNerdGaveFossilEnd
	text_end

MtMoon3TextSuperNerdKeptFossil:
	text_far _MtMoon3TextSuperNerdKeptFossil
	text_end

MtMoon3TextSuperNerdLookingForMoreFossils:
	text_far _MtMoon3TextSuperNerdLookingForMoreFossils
	text_end
	
MtMoonB2FRocket1BattleText:
	text_far _MtMoonB2FRocket1BattleText
	text_end

MtMoonB2FRocket1EndBattleText:
	text_far _MtMoonB2FRocket1EndBattleText
	text_end

MtMoonB2FRocket1AfterBattleText:
	text_far _MtMoonB2FRocket1AfterBattleText
	text_end

MtMoonB2FRocket2BattleText:
	text_far _MtMoonB2FRocket2BattleText
	text_end

MtMoonB2FRocket2EndBattleText:
	text_far _MtMoonB2FRocket2EndBattleText
	text_end

MtMoonB2FRocket2AfterBattleText:
	text_far _MtMoonB2FRocket2AfterBattleText
	text_end

MtMoonB2FRocket3BattleText:
	text_far _MtMoonB2FRocket3BattleText
	text_end

MtMoonB2FRocket3EndBattleText:
	text_far _MtMoonB2FRocket3EndBattleText
	text_end

MtMoonB2FRocket3AfterBattleText:
	text_far _MtMoonB2FRocket3AfterBattleText
	text_end

MtMoonB2FRocket4BattleText:
	text_far _MtMoonB2FRocket4BattleText
	text_end

MtMoonB2FRocket4EndBattleText:
	text_far _MtMoonB2FRocket4EndBattleText
	text_end

MtMoonB2FRocket4AfterBattleText:
	text_far _MtMoonB2FRocket4AfterBattleText
	text_end
