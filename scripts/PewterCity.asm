PewterCity_Script:
	call EnableAutoTextBoxDrawing
	ld hl, PewterCity_ScriptPointers
	ld a, [wPewterCityCurScript]
	jp CallFunctionInTable

PewterCity_ScriptPointers:
	def_script_pointers
	dw_const PewterCityDefaultScript,                     SCRIPT_PEWTERCITY_DEFAULT
	dw_const PewterCitySuperNerd1ShowsPlayerMuseumScript, SCRIPT_PEWTERCITY_SUPER_NERD1_SHOWS_PLAYER_MUSEUM
	dw_const PewterCityHideSuperNerd1Script,              SCRIPT_PEWTERCITY_HIDE_SUPER_NERD1
	dw_const PewterCityResetSuperNerd1Script,             SCRIPT_PEWTERCITY_RESET_SUPER_NERD1
	dw_const PewterCityYoungsterShowsPlayerGymScript,     SCRIPT_PEWTERCITY_YOUNGSTER_SHOWS_PLAYER_GYM
	dw_const PewterCityHideYoungsterScript,               SCRIPT_PEWTERCITY_HIDE_YOUNGSTER
	dw_const PewterCityResetYoungsterScript,              SCRIPT_PEWTERCITY_RESET_YOUNGSTER

PewterCityDefaultScript:
	xor a
	ld [wMuseum1FCurScript], a
	ResetEvent EVENT_BOUGHT_MUSEUM_TICKET
	call PewterCityCheckPlayerLeavingEastScript
	ret

PewterCityCheckPlayerLeavingEastScript:
	CheckEvent EVENT_BEAT_BROCK
	ret nz
IF DEF(_DEBUG)
	call DebugPressedOrHeldB
	ret nz
ENDC
	ld hl, PewterCityPlayerLeavingEastCoords
	call ArePlayerCoordsInArray
	ret nc
	ld a, D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	ld a, TEXT_PEWTERCITY_YOUNGSTER
	ldh [hTextID], a
	jp DisplayTextID

PewterCityPlayerLeavingEastCoords:
	dbmapcoord 35, 17
	dbmapcoord 36, 17
	dbmapcoord 37, 18
	dbmapcoord 37, 19
	db -1 ; end

PewterCitySuperNerd1ShowsPlayerMuseumScript:
	ld a, [wNPCMovementScriptPointerTableNum]
	and a
	ret nz
	ld a, PEWTERCITY_SUPER_NERD1
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_UP
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, ($3 << 4) | SPRITE_FACING_UP
	ldh [hSpriteImageIndex], a
	call SetSpriteImageIndexAfterSettingFacingDirection
	call PlayDefaultMusic
	ld hl, wMiscFlags
	set BIT_NO_SPRITE_UPDATES, [hl]
	ld a, TEXT_PEWTERCITY_SUPER_NERD1_ITS_RIGHT_HERE
	ldh [hTextID], a
	call DisplayTextID
	ld a, $3c
	ldh [hSpriteScreenYCoord], a
	ld a, $30
	ldh [hSpriteScreenXCoord], a
	ld a, 12
	ldh [hSpriteMapYCoord], a
	ld a, 17
	ldh [hSpriteMapXCoord], a
	ld a, PEWTERCITY_SUPER_NERD1
	ld [wSpriteIndex], a
	call SetSpritePosition1
	ld a, PEWTERCITY_SUPER_NERD1
	ldh [hSpriteIndex], a
	ld de, MovementData_PewterMuseumGuyExit
	call MoveSprite
	ld a, SCRIPT_PEWTERCITY_HIDE_SUPER_NERD1
	ld [wPewterCityCurScript], a
	ret

MovementData_PewterMuseumGuyExit:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1 ; end

PewterCityHideSuperNerd1Script:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, HS_MUSEUM_GUY
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, SCRIPT_PEWTERCITY_RESET_SUPER_NERD1
	ld [wPewterCityCurScript], a
	ret

PewterCityResetSuperNerd1Script:
	ld a, PEWTERCITY_SUPER_NERD1
	ld [wSpriteIndex], a
	call SetSpritePosition2
	ld a, HS_MUSEUM_GUY
	ld [wMissableObjectIndex], a
	predef ShowObject
	xor a
	ld [wJoyIgnore], a
	ld a, SCRIPT_PEWTERCITY_DEFAULT
	ld [wPewterCityCurScript], a
	ret

PewterCityYoungsterShowsPlayerGymScript:
	ld a, [wNPCMovementScriptPointerTableNum]
	and a
	ret nz
	ld a, PEWTERCITY_YOUNGSTER
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_LEFT
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, ($1 << 4) | SPRITE_FACING_LEFT
	ldh [hSpriteImageIndex], a
	call SetSpriteImageIndexAfterSettingFacingDirection
	call PlayDefaultMusic
	ld hl, wMiscFlags
	set BIT_NO_SPRITE_UPDATES, [hl]
	ld a, TEXT_PEWTERCITY_YOUNGSTER_GO_TAKE_ON_BROCK
	ldh [hTextID], a
	call DisplayTextID
	ld a, $3c
	ldh [hSpriteScreenYCoord], a
	ld a, $40
	ldh [hSpriteScreenXCoord], a
	ld a, 22
	ldh [hSpriteMapYCoord], a
	ld a, 16
	ldh [hSpriteMapXCoord], a
	ld a, PEWTERCITY_YOUNGSTER
	ld [wSpriteIndex], a
	call SetSpritePosition1
	ld a, PEWTERCITY_YOUNGSTER
	ldh [hSpriteIndex], a
	ld de, MovementData_PewterGymGuyExit
	call MoveSprite
	ld a, SCRIPT_PEWTERCITY_HIDE_YOUNGSTER
	ld [wPewterCityCurScript], a
	ret

MovementData_PewterGymGuyExit:
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db -1 ; end

PewterCityHideYoungsterScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, HS_GYM_GUY
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, SCRIPT_PEWTERCITY_RESET_YOUNGSTER
	ld [wPewterCityCurScript], a
	ret

PewterCityResetYoungsterScript:
	ld a, PEWTERCITY_YOUNGSTER
	ld [wSpriteIndex], a
	call SetSpritePosition2
	ld a, HS_GYM_GUY
	ld [wMissableObjectIndex], a
	predef ShowObject
	xor a
	ld [wJoyIgnore], a
	ld a, SCRIPT_PEWTERCITY_DEFAULT
	ld [wPewterCityCurScript], a
	ret

PewterCity_TextPointers:
	def_text_pointers
	dw_const PewterCityCooltrainerFText,           TEXT_PEWTERCITY_COOLTRAINER_F
	dw_const PewterCityCooltrainerMText,           TEXT_PEWTERCITY_COOLTRAINER_M
	dw_const PewterCitySuperNerd1Text,             TEXT_PEWTERCITY_SUPER_NERD1
	dw_const PewterCitySuperNerd2Text,             TEXT_PEWTERCITY_SUPER_NERD2
	dw_const PewterCityYoungsterText,              TEXT_PEWTERCITY_YOUNGSTER
	dw_const PewterCityTrainerTipsText,            TEXT_PEWTERCITY_TRAINER_TIPS
	dw_const PewterCityPoliceNoticeSignText,       TEXT_PEWTERCITY_POLICE_NOTICE_SIGN
	dw_const MartSignText,                         TEXT_PEWTERCITY_MART_SIGN
	dw_const PokeCenterSignText,                   TEXT_PEWTERCITY_POKECENTER_SIGN
	dw_const PewterCityMuseumSignText,             TEXT_PEWTERCITY_MUSEUM_SIGN
	dw_const PewterCityGymSignText,                TEXT_PEWTERCITY_GYM_SIGN
	dw_const PewterCitySignText,                   TEXT_PEWTERCITY_SIGN
	dw_const PewterCitySuperNerd1ItsRightHereText, TEXT_PEWTERCITY_SUPER_NERD1_ITS_RIGHT_HERE
	dw_const PewterCityYoungsterGoTakeOnBrockText, TEXT_PEWTERCITY_YOUNGSTER_GO_TAKE_ON_BROCK

PewterCityCooltrainerFText:
	text_far _PewterCityCooltrainerFText
	text_end

PewterCityCooltrainerMText:
	text_far _PewterCityCooltrainerMText
	text_end

PewterCitySuperNerd1Text:
	text_asm
	ld hl, .DidYouCheckOutMuseumText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .playerDidNotGoIntoMuseum
	ld hl, .WerentThoseFossilsAmazingText
	call PrintText
	jr .done
.playerDidNotGoIntoMuseum
	ld hl, .YouHaveToGoText
	call PrintText
	xor a
	ldh [hJoyPressed], a
	ldh [hJoyHeld], a
	ld [wNPCMovementScriptFunctionNum], a
	ld a, $2
	ld [wNPCMovementScriptPointerTableNum], a
	ldh a, [hLoadedROMBank]
	ld [wNPCMovementScriptBank], a
	ld a, PEWTERCITY_SUPER_NERD1
	ld [wSpriteIndex], a
	call GetSpritePosition2
	ld a, SCRIPT_PEWTERCITY_SUPER_NERD1_SHOWS_PLAYER_MUSEUM
	ld [wPewterCityCurScript], a
.done
	jp TextScriptEnd

.DidYouCheckOutMuseumText:
	text_far _PewterCitySuperNerd1DidYouCheckOutMuseumText
	text_end

.WerentThoseFossilsAmazingText:
	text_far _PewterCitySuperNerd1WerentThoseFossilsAmazingText
	text_end

.YouHaveToGoText:
	text_far _PewterCitySuperNerd1YouHaveToGoText
	text_end

PewterCitySuperNerd1ItsRightHereText:
	text_far _PewterCitySuperNerd1ItsRightHereText
	text_end

PewterCitySuperNerd2Text:
	text_asm
	ld hl, .DoYouKnowWhatImDoingText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	cp $0
	jr nz, .playerDoesNotKnow
	ld hl, .ThatsRightText
	call PrintText
	jr .done
.playerDoesNotKnow
	ld hl, .ImSprayingRepelText
	call PrintText
.done
	jp TextScriptEnd

.DoYouKnowWhatImDoingText:
	text_far _PewterCitySuperNerd2DoYouKnowWhatImDoingText
	text_end

.ThatsRightText:
	text_far _PewterCitySuperNerd2ThatsRightText
	text_end

.ImSprayingRepelText:
	text_far _PewterCitySuperNerd2ImSprayingRepelText
	text_end

PewterCityYoungsterText:
	text_asm
	ld hl, .YoureATrainerFollowMeText
	call PrintText
	xor a
	ldh [hJoyHeld], a
	ld [wNPCMovementScriptFunctionNum], a
	ld a, $3
	ld [wNPCMovementScriptPointerTableNum], a
	ldh a, [hLoadedROMBank]
	ld [wNPCMovementScriptBank], a
	ld a, PEWTERCITY_YOUNGSTER
	ld [wSpriteIndex], a
	call GetSpritePosition2
	ld a, SCRIPT_PEWTERCITY_YOUNGSTER_SHOWS_PLAYER_GYM
	ld [wPewterCityCurScript], a
	jp TextScriptEnd

.YoureATrainerFollowMeText:
	text_far _PewterCityYoungsterYoureATrainerFollowMeText
	text_end

PewterCityYoungsterGoTakeOnBrockText:
	text_far _PewterCityYoungsterGoTakeOnBrockText
	text_end

PewterCityTrainerTipsText:
	text_far _PewterCityTrainerTipsText
	text_end

PewterCityPoliceNoticeSignText:
	text_far _PewterCityPoliceNoticeSignText
	text_end

PewterCityMuseumSignText:
	text_far _PewterCityMuseumSignText
	text_end

PewterCityGymSignText:
	text_far _PewterCityGymSignText
	text_end

PewterCitySignText:
	text_far _PewterCitySignText
	text_end
