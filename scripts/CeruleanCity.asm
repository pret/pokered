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
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [wJoyIgnore], a
	ld [wCeruleanCityCurScript], a
	ret

CeruleanCityScript0:
	CheckEvent EVENT_BEAT_CERULEAN_ROCKET_THIEF
	jr nz, .asm_194f7
	ld hl, CeruleanCityCoords1
	call ArePlayerCoordsInArray
	jr nc, .asm_194f7
	ld a, [wCoordIndex]
	cp $1
	ld a, PLAYER_DIR_UP
	ld b, SPRITE_FACING_DOWN
	jr nz, .asm_194e6
	ld a, PLAYER_DIR_DOWN
	ld b, SPRITE_FACING_UP
.asm_194e6
	ld [wPlayerMovingDirection], a
	ld a, b
	ld [wSpriteStateData1 + 2 * $10 + $9], a
	call Delay3
	ld a, $2
	ld [hSpriteIndexOrTextID], a
	jp DisplayTextID
.asm_194f7
	CheckEvent EVENT_BEAT_CERULEAN_RIVAL
	ret nz
	ld hl, CeruleanCityCoords2
	call ArePlayerCoordsInArray
	ret nc
	ld a, [wWalkBikeSurfState]
	and a
	jr z, .asm_19512
	ld a, $ff
	ld [wNewSoundID], a
	call PlaySound
.asm_19512
	ld c, BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	xor a
	ld [hJoyHeld], a
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, [wXCoord]
	cp $14
	jr z, .asm_19535
	ld a, $1
	ld [H_SPRITEINDEX], a
	ld a, $5
	ld [H_SPRITEDATAOFFSET], a
	call GetPointerWithinSpriteStateData2
	ld [hl], $19
.asm_19535
	ld a, HS_CERULEAN_RIVAL
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld de, CeruleanCityMovement1
	ld a, $1
	ld [H_SPRITEINDEX], a
	call MoveSprite
	ld a, $1
	ld [wCeruleanCityCurScript], a
	ret

CeruleanCityCoords1:
	db $07,$1e
	db $09,$1e
	db $ff

CeruleanCityCoords2:
	db $06,$14
	db $06,$15
	db $ff

CeruleanCityMovement1:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db $FF

CeruleanCityScript_1955d:
	ld a, 1
	ld [H_SPRITEINDEX], a
	xor a ; SPRITE_FACING_DOWN
	ld [hSpriteFacingDirection], a
	jp SetSpriteFacingDirectionAndDelay ; face object

CeruleanCityScript1:
	ld a, [wd730]
	bit 0, a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, $1
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, CeruleanCityText_1966d
	ld de, CeruleanCityText_19672
	call SaveEndBattleTextPointers
	ld a, OPP_SONY1
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
	ld [hJoyHeld], a
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
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $ff
	ld [wNewSoundID], a
	call PlaySound
	callba Music_RivalAlternateStart
	ld a, $1
	ld [H_SPRITEINDEX], a
	call SetSpriteMovementBytesToFF
	ld a, [wXCoord]
	cp $14
	jr nz, .asm_195f0
	ld de, CeruleanCityMovement4
	jr .asm_195f3
.asm_195f0
	ld de, CeruleanCityMovement3
.asm_195f3
	ld a, $1
	ld [H_SPRITEINDEX], a
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
	db $FF

CeruleanCityMovement4:
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db $FF

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
	TX_ASM
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
	TX_FAR _CeruleanCityText_19668
	db "@"

CeruleanCityText_1966d:
	TX_FAR _CeruleanCityText_1966d
	db "@"

CeruleanCityText_19672:
	TX_FAR _CeruleanCityText_19672
	db "@"

CeruleanCityText_19677:
	TX_FAR _CeruleanCityText_19677
	db "@"

CeruleanCityText2:
	TX_ASM
	CheckEvent EVENT_BEAT_CERULEAN_ROCKET_THIEF
	jr nz, .asm_4ca20
	ld hl, CeruleanCityText_196d9
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, CeruleanCityText_196ee
	ld de, CeruleanCityText_196ee
	call SaveEndBattleTextPointers
	ld a, [hSpriteIndexOrTextID]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $4
	ld [wCeruleanCityCurScript], a
	jp TextScriptEnd
.asm_4ca20
	ld hl, CeruleanCityText_196f3
	call PrintText
	lb bc, TM_28, 1
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
	callba CeruleanHideRocket
.Done
	jp TextScriptEnd

CeruleanCityText_196d9:
	TX_FAR _CeruleanCityText_196d9
	db "@"

ReceivedTM28Text:
	TX_FAR _ReceivedTM28Text
	TX_SFX_ITEM_1
	TX_FAR _ReceivedTM28Text2
	TX_WAIT
	db "@"

TM28NoRoomText:
	TX_FAR _TM28NoRoomText
	db "@"

CeruleanCityText_196ee:
	TX_FAR _CeruleanCityText_196ee
	db "@"

CeruleanCityText_196f3:
	TX_FAR _CeruleanCityText_196f3
	db "@"

CeruleanCityText3:
	TX_FAR _CeruleanCityText3
	db "@"

CeruleanCityText4:
	TX_FAR _CeruleanCityText4
	db "@"

CeruleanCityText5:
	TX_FAR _CeruleanCityText5
	db "@"

CeruleanCityText11:
CeruleanCityText6:
	TX_FAR _CeruleanCityText6
	db "@"

CeruleanCityText7:
	TX_ASM
	ld a, [hRandomAdd]
	cp 180
	jr c, .asm_e9fc9
	ld hl, CeruleanCityText_19730
	call PrintText
	jr .asm_d486e
.asm_e9fc9
	cp 100
	jr c, .asm_df99b
	ld hl, CeruleanCityText_19735
	call PrintText
	jr .asm_d486e
.asm_df99b
	ld hl, CeruleanCityText_1973a
	call PrintText
.asm_d486e
	jp TextScriptEnd

CeruleanCityText_19730:
	TX_FAR _CeruleanCityText_19730
	db "@"

CeruleanCityText_19735:
	TX_FAR _CeruleanCityText_19735
	db "@"

CeruleanCityText_1973a:
	TX_FAR _CeruleanCityText_1973a
	db "@"

CeruleanCityText8:
	TX_ASM
	ld a, [hRandomAdd]
	cp 180
	jr c, .asm_e28da
	ld hl, CeruleanCityText_1976f
	call PrintText
	jr .asm_f2f38
.asm_e28da
	cp 120
	jr c, .asm_15d08
	ld hl, CeruleanCityText_19774
	call PrintText
	jr .asm_f2f38
.asm_15d08
	cp 60
	jr c, .asm_d7fea
	ld hl, CeruleanCityText_19779
	call PrintText
	jr .asm_f2f38
.asm_d7fea
	ld hl, CeruleanCityText_1977e
	call PrintText
.asm_f2f38
	jp TextScriptEnd

CeruleanCityText_1976f:
	TX_FAR _CeruleanCityText_1976f
	db "@"

CeruleanCityText_19774:
	TX_FAR _CeruleanCityText_19774
	db "@"

CeruleanCityText_19779:
	TX_FAR _CeruleanCityText_19779
	db "@"

CeruleanCityText_1977e:
	TX_FAR _CeruleanCityText_1977e
	db "@"

CeruleanCityText9:
	TX_FAR _CeruleanCityText9
	db "@"

CeruleanCityText10:
	TX_FAR _CeruleanCityText10
	db "@"

CeruleanCityText12:
	TX_FAR _CeruleanCityText12
	db "@"

CeruleanCityText13:
	TX_FAR _CeruleanCityText13
	db "@"

CeruleanCityText16:
	TX_FAR _CeruleanCityText16
	db "@"

CeruleanCityText17:
	TX_FAR _CeruleanCityText17
	db "@"
