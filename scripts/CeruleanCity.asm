CeruleanCity_Script:
	call EnableAutoTextBoxDrawing
	ld hl, CeruleanCity_ScriptPointers
	ld a, [wCeruleanCityCurScript]
	jp CallFunctionInTable

CeruleanCityClearScripts:
	xor a ; SCRIPT_CERULEANCITY_DEFAULT
	ld [wJoyIgnore], a
	ld [wCeruleanCityCurScript], a
	ld a, HS_CERULEAN_RIVAL
	ld [wMissableObjectIndex], a
	predef_jump HideObject

CeruleanCity_ScriptPointers:
	def_script_pointers
	dw_const CeruleanCityDefaultScript,        SCRIPT_CERULEANCITY_DEFAULT
	dw_const CeruleanCityRivalBattleScript,    SCRIPT_CERULEANCITY_RIVAL_BATTLE
	dw_const CeruleanCityRivalDefeatedScript,  SCRIPT_CERULEANCITY_RIVAL_DEFEATED
	dw_const CeruleanCityRivalCleanupScript,   SCRIPT_CERULEANCITY_RIVAL_CLEANUP
	dw_const CeruleanCityRocketDefeatedScript, SCRIPT_CERULEANCITY_ROCKET_DEFEATED

CeruleanCityRocketDefeatedScript:
	ld a, [wIsInBattle]
	cp $ff
	jp z, CeruleanCityClearScripts
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
	SetEvent EVENT_BEAT_CERULEAN_ROCKET_THIEF
	ld a, TEXT_CERULEANCITY_ROCKET
	ldh [hTextID], a
	call DisplayTextID
	xor a ; SCRIPT_CERULEANCITY_DEFAULT
	ld [wJoyIgnore], a
	ld [wCeruleanCityCurScript], a
	ret

CeruleanCityDefaultScript:
IF DEF(_DEBUG)
	call DebugPressedOrHeldB
	ret nz
ENDC
	CheckEvent EVENT_BEAT_CERULEAN_ROCKET_THIEF
	jr nz, .skipRocketThiefEncounter
	ld hl, CeruleanCityCoords1
	call ArePlayerCoordsInArray
	jr nc, .skipRocketThiefEncounter
	ld a, [wCoordIndex]
	cp $1
	ld a, PLAYER_DIR_UP
	ld b, SPRITE_FACING_DOWN
	jr nz, .playerBelowRocketThief
	ld a, PLAYER_DIR_DOWN
	ld b, SPRITE_FACING_UP
.playerBelowRocketThief
	ld [wPlayerMovingDirection], a
	ld a, b
	ld [wSprite02StateData1FacingDirection], a
	call Delay3
	ld a, TEXT_CERULEANCITY_ROCKET
	ldh [hTextID], a
	jp DisplayTextID
.skipRocketThiefEncounter
	CheckEvent EVENT_BEAT_CERULEAN_RIVAL
	ret nz
	ld hl, CeruleanCityCoords2
	call ArePlayerCoordsInArray
	ret nc
	ld a, [wWalkBikeSurfState]
	and a
	jr z, .walking
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	call PlaySound
.walking
	ld c, BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	xor a
	ldh [hJoyHeld], a
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld a, [wXCoord]
	cp 20 ; is the player standing on the right side of the bridge?
	jr z, .playerOnRightSideOfBridge
	ld a, CERULEANCITY_RIVAL
	ldh [hSpriteIndex], a
	ld a, SPRITESTATEDATA2_MAPX
	ldh [hSpriteDataOffset], a
	call GetPointerWithinSpriteStateData2
	ld [hl], 25
.playerOnRightSideOfBridge
	ld a, HS_CERULEAN_RIVAL
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld de, CeruleanCityMovement1
	ld a, CERULEANCITY_RIVAL
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, SCRIPT_CERULEANCITY_RIVAL_BATTLE
	ld [wCeruleanCityCurScript], a
	ret

CeruleanCityCoords1:
	dbmapcoord 30,  7
	dbmapcoord 30,  9
	db -1 ; end

CeruleanCityCoords2:
	dbmapcoord 20,  6
	dbmapcoord 21,  6
	db -1 ; end

CeruleanCityMovement1:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1 ; end

CeruleanCityFaceRivalScript:
	ld a, CERULEANCITY_RIVAL
	ldh [hSpriteIndex], a
	xor a ; SPRITE_FACING_DOWN
	ldh [hSpriteFacingDirection], a
	jp SetSpriteFacingDirectionAndDelay ; face object

CeruleanCityRivalBattleScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, TEXT_CERULEANCITY_RIVAL
	ldh [hTextID], a
	call DisplayTextID
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, CeruleanCityRivalDefeatedText
	ld de, CeruleanCityRivalVictoryText
	call SaveEndBattleTextPointers
	ld a, OPP_RIVAL1
	ld [wCurOpponent], a

	; select which team to use during the encounter
	ld a, [wRivalStarter]
	cp STARTER2
	jr nz, .NotSquirtle
	ld a, $7
	jr .done
.NotSquirtle
	cp STARTER3
	jr nz, .Charmander
	ld a, $8
	jr .done
.Charmander
	ld a, $9
.done
	ld [wTrainerNo], a

	xor a
	ldh [hJoyHeld], a
	call CeruleanCityFaceRivalScript
	ld a, SCRIPT_CERULEANCITY_RIVAL_DEFEATED
	ld [wCeruleanCityCurScript], a
	ret

CeruleanCityRivalDefeatedScript:
	ld a, [wIsInBattle]
	cp $ff
	jp z, CeruleanCityClearScripts
	call CeruleanCityFaceRivalScript
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
	SetEvent EVENT_BEAT_CERULEAN_RIVAL
	ld a, TEXT_CERULEANCITY_RIVAL
	ldh [hTextID], a
	call DisplayTextID
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	call PlaySound
	farcall Music_RivalAlternateStart
	ld a, CERULEANCITY_RIVAL
	ldh [hSpriteIndex], a
	call SetSpriteMovementBytesToFF
	ld a, [wXCoord]
	cp 20 ; is the player standing on the right side of the bridge?
	jr nz, .playerOnRightSideOfBridge
	ld de, CeruleanCityMovement4
	jr .skip
.playerOnRightSideOfBridge
	ld de, CeruleanCityMovement3
.skip
	ld a, CERULEANCITY_RIVAL
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, SCRIPT_CERULEANCITY_RIVAL_CLEANUP
	ld [wCeruleanCityCurScript], a
	ret

CeruleanCityMovement3:
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1 ; end

CeruleanCityMovement4:
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1 ; end

CeruleanCityRivalCleanupScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, HS_CERULEAN_RIVAL
	ld [wMissableObjectIndex], a
	predef HideObject
	xor a
	ld [wJoyIgnore], a
	call PlayDefaultMusic
	ld a, SCRIPT_CERULEANCITY_DEFAULT
	ld [wCeruleanCityCurScript], a
	ret

CeruleanCity_TextPointers:
	def_text_pointers
	dw_const CeruleanCityRivalText,         TEXT_CERULEANCITY_RIVAL
	dw_const CeruleanCityRocketText,        TEXT_CERULEANCITY_ROCKET
	dw_const CeruleanCityCooltrainerMText,  TEXT_CERULEANCITY_COOLTRAINER_M
	dw_const CeruleanCitySuperNerd1Text,    TEXT_CERULEANCITY_SUPER_NERD1
	dw_const CeruleanCitySuperNerd2Text,    TEXT_CERULEANCITY_SUPER_NERD2
	dw_const CeruleanCityGuardText,         TEXT_CERULEANCITY_GUARD1
	dw_const CeruleanCityCooltrainerF1Text, TEXT_CERULEANCITY_COOLTRAINER_F1
	dw_const CeruleanCitySlowbroText,       TEXT_CERULEANCITY_SLOWBRO
	dw_const CeruleanCityCooltrainerF2Text, TEXT_CERULEANCITY_COOLTRAINER_F2
	dw_const CeruleanCitySuperNerd3Text,    TEXT_CERULEANCITY_SUPER_NERD3
	dw_const CeruleanCityGuardText,         TEXT_CERULEANCITY_GUARD2
	dw_const CeruleanCitySignText,          TEXT_CERULEANCITY_SIGN
	dw_const CeruleanCityTrainerTipsText,   TEXT_CERULEANCITY_TRAINER_TIPS
	dw_const MartSignText,                  TEXT_CERULEANCITY_MART_SIGN
	dw_const PokeCenterSignText,            TEXT_CERULEANCITY_POKECENTER_SIGN
	dw_const CeruleanCityBikeShopSign,      TEXT_CERULEANCITY_BIKESHOP_SIGN
	dw_const CeruleanCityGymSign,           TEXT_CERULEANCITY_GYM_SIGN

CeruleanCityRivalText:
	text_asm
	CheckEvent EVENT_BEAT_CERULEAN_RIVAL
	; do pre-battle text
	jr z, .PreBattle
	; or talk about bill
	ld hl, CeruleanCityRivalIWentToBillsText
	call PrintText
	jr .end
.PreBattle
	ld hl, .PreBattleText
	call PrintText
.end
	jp TextScriptEnd

.PreBattleText:
	text_far _CeruleanCityRivalPreBattleText
	text_end

CeruleanCityRivalDefeatedText:
	text_far _CeruleanCityRivalDefeatedText
	text_end

CeruleanCityRivalVictoryText:
	text_far _CeruleanCityRivalVictoryText
	text_end

CeruleanCityRivalIWentToBillsText:
	text_far _CeruleanCityRivalIWentToBillsText
	text_end

CeruleanCityRocketText:
	text_asm
	CheckEvent EVENT_BEAT_CERULEAN_ROCKET_THIEF
	jr nz, .beatRocketThief
	ld hl, .Text
	call PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, .IGiveUpText
	ld de, .IGiveUpText
	call SaveEndBattleTextPointers
	ldh a, [hTextID]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, SCRIPT_CERULEANCITY_ROCKET_DEFEATED
	ld [wCeruleanCityCurScript], a
	jp TextScriptEnd
.beatRocketThief
	ld hl, .IllReturnTheTMText
	call PrintText
	lb bc, TM_DIG, 1
	call GiveItem
	jr c, .Success
	ld hl, .TM28NoRoomText
	call PrintText
	jr .Done
.Success
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, .ReceivedTM28Text
	call PrintText
	farcall CeruleanHideRocket
.Done
	jp TextScriptEnd

.Text:
	text_far _CeruleanCityRocketText
	text_end

.ReceivedTM28Text:
	text_far _CeruleanCityRocketReceivedTM28Text
	sound_get_item_1
	text_far _CeruleanCityRocketIBetterGetMovingText
	text_waitbutton
	text_end

.TM28NoRoomText:
	text_far _CeruleanCityRocketTM28NoRoomText
	text_end

.IGiveUpText:
	text_far _CeruleanCityRocketIGiveUpText
	text_end

.IllReturnTheTMText:
	text_far _CeruleanCityRocketIllReturnTheTMText
	text_end

CeruleanCityCooltrainerMText:
	text_far _CeruleanCityCooltrainerMText
	text_end

CeruleanCitySuperNerd1Text:
	text_far _CeruleanCitySuperNerd1Text
	text_end

CeruleanCitySuperNerd2Text:
	text_far _CeruleanCitySuperNerd2Text
	text_end

CeruleanCityGuardText:
	text_far _CeruleanCityGuardText
	text_end

CeruleanCityCooltrainerF1Text:
	text_asm
	ldh a, [hRandomAdd]
	cp 180 ; 76/256 chance of 1st dialogue
	jr c, .notFirstText
	ld hl, .SlowbroUseSonicboomText
	call PrintText
	jr .end
.notFirstText
	cp 100 ; 80/256 chance of 2nd dialogue
	jr c, .notSecondText
	ld hl, .SlowbroPunchText
	call PrintText
	jr .end
.notSecondText
	; 100/256 chance of 3rd dialogue
	ld hl, .SlowbroWithdrawText
	call PrintText
.end
	jp TextScriptEnd

.SlowbroUseSonicboomText:
	text_far _CeruleanCityCooltrainerF1SlowbroUseSonicboomText
	text_end

.SlowbroPunchText:
	text_far _CeruleanCityCooltrainerF1SlowbroPunchText
	text_end

.SlowbroWithdrawText:
	text_far _CeruleanCityCooltrainerF1SlowbroWithdrawText
	text_end

CeruleanCitySlowbroText:
	text_asm
	ldh a, [hRandomAdd]
	cp 180 ; 76/256 chance of 1st dialogue
	jr c, .notFirstText
	ld hl, .TookASnoozeText
	call PrintText
	jr .end
.notFirstText
	cp 120 ; 60/256 chance of 2nd dialogue
	jr c, .notSecondText
	ld hl, .IsLoafingAroundText
	call PrintText
	jr .end
.notSecondText
	cp 60 ; 60/256 chance of 3rd dialogue
	jr c, .notThirdText
	ld hl, .TurnedAwayText
	call PrintText
	jr .end
.notThirdText
	; 60/256 chance of 4th dialogue
	ld hl, .IgnoredOrdersText
	call PrintText
.end
	jp TextScriptEnd

.TookASnoozeText:
	text_far _CeruleanCitySlowbroTookASnoozeText
	text_end

.IsLoafingAroundText:
	text_far _CeruleanCitySlowbroIsLoafingAroundText
	text_end

.TurnedAwayText:
	text_far _CeruleanCitySlowbroTurnedAwayText
	text_end

.IgnoredOrdersText:
	text_far _CeruleanCitySlowbroIgnoredOrdersText
	text_end

CeruleanCityCooltrainerF2Text:
	text_far _CeruleanCityCooltrainerF2Text
	text_end

CeruleanCitySuperNerd3Text:
	text_far _CeruleanCitySuperNerd3Text
	text_end

CeruleanCitySignText:
	text_far _CeruleanCitySignText
	text_end

CeruleanCityTrainerTipsText:
	text_far _CeruleanCityTrainerTipsText
	text_end

CeruleanCityBikeShopSign:
	text_far _CeruleanCityBikeShopSign
	text_end

CeruleanCityGymSign:
	text_far _CeruleanCityGymSign
	text_end
