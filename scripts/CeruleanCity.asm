CeruleanCity_Script:
	call EnableAutoTextBoxDrawing
	ld hl, CeruleanCity_ScriptPointers
	ld a, [wCeruleanCityCurScript]
	jp CallFunctionInTable

CeruleanCityScript_1948c:
	xor a
	ld [wJoyIgnore], a
	ld [wCeruleanCityCurScript], a
	ld a, HS_CERULEAN_RIVAL
	ld [wMissableObjectIndex], a
	predef_jump HideObject

CeruleanCity_ScriptPointers:
	dw CeruleanCityScript0
	dw CeruleanCityScript1
	dw CeruleanCityScript2
	dw CeruleanCityScript3
	dw CeruleanCityScript4

CeruleanCityScript4:
	ld a, [wIsInBattle]
	cp $ff
	jp z, CeruleanCityScript_1948c
	ld a, $f0
	ld [wJoyIgnore], a
	SetEvent EVENT_BEAT_CERULEAN_ROCKET_THIEF
	ld a, $2
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [wJoyIgnore], a
	ld [wCeruleanCityCurScript], a
	ret

CeruleanCityScript0:
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
	ld a, $2
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
;	ld [wNewSoundID], a
	call PlaySound
.walking
	ld c, 0 ; BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	xor a
	ldh [hJoyHeld], a
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, [wXCoord]
	cp 20 ; is the player standing on the right side of the bridge?
	jr z, .playerOnRightSideOfBridge
	ld a, $1
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
	ld a, $1
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, $1
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

CeruleanCityScript_1955d:
	ld a, 1
	ldh [hSpriteIndex], a
	xor a ; SPRITE_FACING_DOWN
	ldh [hSpriteFacingDirection], a
	jp SetSpriteFacingDirectionAndDelay ; face object

CeruleanCityScript1:
	ld a, [wd730]
	bit 0, a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, $1
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, CeruleanCityText_1966d
	ld de, CeruleanCityText_19672
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
	call CeruleanCityScript_1955d
	ld a, $2
	ld [wCeruleanCityCurScript], a
	ret

CeruleanCityScript2:
	ld a, [wIsInBattle]
	cp $ff
	jp z, CeruleanCityScript_1948c
	call CeruleanCityScript_1955d
	ld a, $f0
	ld [wJoyIgnore], a
	SetEvent EVENT_BEAT_CERULEAN_RIVAL
	ld a, $1
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, SFX_STOP_ALL_MUSIC
;	ld [wNewSoundID], a
	call PlaySound
	farcall Music_RivalAlternateStart
	ld a, $1
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
	ld a, $1
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, $3
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

CeruleanCityScript3:
	ld a, [wd730]
	bit 0, a
	ret nz
	ld a, HS_CERULEAN_RIVAL
	ld [wMissableObjectIndex], a
	predef HideObject
	xor a
	ld [wJoyIgnore], a
	call PlayDefaultMusic
	ld a, $0
	ld [wCeruleanCityCurScript], a
	ret

CeruleanCity_TextPointers:
	dw CeruleanCityText1
	dw CeruleanCityText2
	dw CeruleanCityText3
	dw CeruleanCityText4
	dw CeruleanCityText5
	dw CeruleanCityText6
	dw CeruleanCityText7
	dw CeruleanCityText8
	dw CeruleanCityText9
	dw CeruleanCityText10
	dw CeruleanCityText11
	dw CeruleanCityText12
	dw CeruleanCityText13
	dw MartSignText
	dw PokeCenterSignText
	dw CeruleanCityText16
	dw CeruleanCityText17

CeruleanCityText1:
	text_asm
	CheckEvent EVENT_BEAT_CERULEAN_RIVAL
	; do pre-battle text
	jr z, .PreBattleText
	; or talk about bill
	ld hl, CeruleanCityText_19677
	call PrintText
	jr .end
.PreBattleText
	ld hl, CeruleanCityText_19668
	call PrintText
.end
	jp TextScriptEnd

CeruleanCityText_19668:
	text_far _CeruleanCityText_19668
	text_end

CeruleanCityText_1966d:
	text_far _CeruleanCityText_1966d
	text_end

CeruleanCityText_19672:
	text_far _CeruleanCityText_19672
	text_end

CeruleanCityText_19677:
	text_far _CeruleanCityText_19677
	text_end

CeruleanCityText2:
	text_asm
	CheckEvent EVENT_BEAT_CERULEAN_ROCKET_THIEF
	jr nz, .beatRocketThief
	ld hl, CeruleanCityText_196d9
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, CeruleanCityText_196ee
	ld de, CeruleanCityText_196ee
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndexOrTextID]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $4
	ld [wCeruleanCityCurScript], a
	jp TextScriptEnd
.beatRocketThief
	ld hl, CeruleanCityText_196f3
	call PrintText
	lb bc, TM_DIG, 1
	call GiveItem
	jr c, .Success
	ld hl, TM28NoRoomText
	call PrintText
	jr .Done
.Success
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, ReceivedTM28Text
	call PrintText
	farcall CeruleanHideRocket
.Done
	jp TextScriptEnd

CeruleanCityText_196d9:
	text_far _CeruleanCityText_196d9
	text_end

ReceivedTM28Text:
	text_far _ReceivedTM28Text
	sound_get_item_1
	text_far _ReceivedTM28Text2
	text_waitbutton
	text_end

TM28NoRoomText:
	text_far _TM28NoRoomText
	text_end

CeruleanCityText_196ee:
	text_far _CeruleanCityText_196ee
	text_end

CeruleanCityText_196f3:
	text_far _CeruleanCityText_196f3
	text_end

CeruleanCityText3:
	text_far _CeruleanCityText3
	text_end

CeruleanCityText4:
	text_far _CeruleanCityText4
	text_end

CeruleanCityText5:
	text_far _CeruleanCityText5
	text_end

CeruleanCityText11:
CeruleanCityText6:
	text_far _CeruleanCityText6
	text_end

CeruleanCityText7:
	text_asm
	ldh a, [hRandomAdd]
	cp 180 ; 76/256 chance of 1st dialogue
	jr c, .notFirstText
	ld hl, CeruleanCityText_19730
	call PrintText
	jr .end
.notFirstText
	cp 100 ; 80/256 chance of 2nd dialogue
	jr c, .notSecondText
	ld hl, CeruleanCityText_19735
	call PrintText
	jr .end
.notSecondText
	; 100/256 chance of 3rd dialogue
	ld hl, CeruleanCityText_1973a
	call PrintText
.end
	jp TextScriptEnd

CeruleanCityText_19730:
	text_far _CeruleanCityText_19730
	text_end

CeruleanCityText_19735:
	text_far _CeruleanCityText_19735
	text_end

CeruleanCityText_1973a:
	text_far _CeruleanCityText_1973a
	text_end

CeruleanCityText8:
	text_asm
	ldh a, [hRandomAdd]
	cp 180 ; 76/256 chance of 1st dialogue
	jr c, .notFirstText
	ld hl, CeruleanCityText_1976f
	call PrintText
	jr .end
.notFirstText
	cp 120 ; 60/256 chance of 2nd dialogue
	jr c, .notSecondText
	ld hl, CeruleanCityText_19774
	call PrintText
	jr .end
.notSecondText
	cp 60 ; 60/256 chance of 3rd dialogue
	jr c, .notThirdText
	ld hl, CeruleanCityText_19779
	call PrintText
	jr .end
.notThirdText
	; 60/256 chance of 4th dialogue
	ld hl, CeruleanCityText_1977e
	call PrintText
.end
	jp TextScriptEnd

CeruleanCityText_1976f:
	text_far _CeruleanCityText_1976f
	text_end

CeruleanCityText_19774:
	text_far _CeruleanCityText_19774
	text_end

CeruleanCityText_19779:
	text_far _CeruleanCityText_19779
	text_end

CeruleanCityText_1977e:
	text_far _CeruleanCityText_1977e
	text_end

CeruleanCityText9:
	text_far _CeruleanCityText9
	text_end

CeruleanCityText10:
	text_far _CeruleanCityText10
	text_end

CeruleanCityText12:
	text_far _CeruleanCityText12
	text_end

CeruleanCityText13:
	text_far _CeruleanCityText13
	text_end

CeruleanCityText16:
	text_far _CeruleanCityText16
	text_end

CeruleanCityText17:
	text_far _CeruleanCityText17
	text_end
