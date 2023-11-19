CeruleanCity_Script:
	call CeruleanCityReplaceCutTile
	call EnableAutoTextBoxDrawing
	ld hl, CeruleanCity_ScriptPointers
	ld a, [wCeruleanCityCurScript]
	jp CallFunctionInTable

; PureRGBnote: ADDED: function that will remove the cut tree if we deleted it with the tree deleter
CeruleanCityReplaceCutTile:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	jr nz, .replaceTile
	bit 4, [hl]
	res 4, [hl]
	jr nz, .replaceTileNoRedraw
	ret
.replaceTile
	CheckEvent EVENT_DELETED_CERULEAN_TREE
	ret z
	call .loadTile
	predef_jump ReplaceTileBlock
.replaceTileNoRedraw
	CheckEvent EVENT_DELETED_CERULEAN_TREE
	ret z
	; this avoids redrawing the map because when going between areas these tiles are offscreen.
	call .loadTile
	predef_jump ReplaceTileBlockNoRedraw
.loadTile
	lb bc, 14, 9
	ld a, $6D
	ld [wNewTileBlockID], a
	ret

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
	ld hl, wCurrentMapScriptFlags
	res 3, [hl]
	call GBFadeInFromWhite ; PureRGBnote: ADDED: since trainer instantly talks to us after battle we need to fade back in here
	ld a, [wIsInBattle]
	cp $ff
	jp z, CeruleanCityClearScripts
	ld a, D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	SetEvent EVENT_BEAT_CERULEAN_ROCKET_THIEF
	ld a, TEXT_CERULEANCITY_ROCKET
	ldh [hSpriteIndexOrTextID], a
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
	ldh [hSpriteIndexOrTextID], a
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
	rst _PlaySound
.walking
	ld c, BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	xor a
	ldh [hJoyHeld], a
	ld a, D_RIGHT | D_LEFT | D_UP | D_DOWN
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
	ld a, [wd730]
	bit 0, a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, TEXT_CERULEANCITY_RIVAL
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
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
	ld hl, wCurrentMapScriptFlags
	res 3, [hl]
	call GBFadeInFromWhite ; PureRGBnote: ADDED: since trainer instantly talks to us after battle we need to fade back in here
	ld a, [wIsInBattle]
	cp $ff
	jp z, CeruleanCityClearScripts
	call CeruleanCityFaceRivalScript
	ld a, D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	SetEvent EVENT_BEAT_CERULEAN_RIVAL
	ld a, TEXT_CERULEANCITY_RIVAL
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	rst _PlaySound
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
	ld a, [wd730]
	bit 0, a
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
	dw_const PickUp5ItemText,               TEXT_CERULEANCITY_ITEM1 ; PureRGBnote: ADDED: new item location
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
	rst _PrintText
	jr .end
.PreBattle
	ld hl, .PreBattleText
	rst _PrintText
.end
	rst TextScriptEnd

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
	rst _PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, .IGiveUpText
	ld de, .IGiveUpText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndexOrTextID]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, SCRIPT_CERULEANCITY_ROCKET_DEFEATED
	ld [wCeruleanCityCurScript], a
	rst TextScriptEnd
.beatRocketThief
	ld hl, .IllReturnTheTMText
	rst _PrintText
	lb bc, TM_CERULEAN_ROCKET_TM_THIEF, 1
	call GiveItem
	jr c, .Success
	ld hl, .TM28NoRoomText
	rst _PrintText
	jr .Done
.Success
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, .ReceivedTM28Text
	rst _PrintText
	farcall CeruleanHideRocket
.Done
	rst TextScriptEnd

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
	text_asm
	CheckEvent EVENT_DELETED_CERULEAN_TREE ; PureRGBnote: ADDED: this NPC won't talk about the cut tree if it was deleted permanently
	jr nz, .deletedTree
	ld hl, .CeruleanCitySuperNerd1_BeforeTreeDelete
	jr .done
.deletedTree
	ld hl, .CeruleanCitySuperNerd1_AfterTreeDelete ; instead he'll comment on how it was removed
.done
	rst _PrintText
	rst TextScriptEnd

.CeruleanCitySuperNerd1_BeforeTreeDelete:
	text_far _CeruleanCitySuperNerd1Text
	text_end

.CeruleanCitySuperNerd1_AfterTreeDelete:
	text_far _CeruleanCitySuperNerd1_AfterTreeDelete
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
	rst _PrintText
	jr .end
.notFirstText
	cp 100 ; 80/256 chance of 2nd dialogue
	jr c, .notSecondText
	ld hl, .SlowbroPunchText
	rst _PrintText
	jr .end
.notSecondText
	; 100/256 chance of 3rd dialogue
	ld hl, .SlowbroWithdrawText
	rst _PrintText
.end
	rst TextScriptEnd

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
	rst _PrintText
	jr .end
.notFirstText
	cp 120 ; 60/256 chance of 2nd dialogue
	jr c, .notSecondText
	ld hl, .IsLoafingAroundText
	rst _PrintText
	jr .end
.notSecondText
	cp 60 ; 60/256 chance of 3rd dialogue
	jr c, .notThirdText
	ld hl, .TurnedAwayText
	rst _PrintText
	jr .end
.notThirdText
	; 60/256 chance of 4th dialogue
	ld hl, .IgnoredOrdersText
	rst _PrintText
.end
	rst TextScriptEnd

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
