ChampionsRoom_Script:
	call EnableAutoTextBoxDrawing
	ld hl, ChampionsRoom_ScriptPointers
	ld a, [wChampionsRoomCurScript]
	jp CallFunctionInTable

ResetGaryScript:
	xor a
	ld [wJoyIgnore], a
	ld [wChampionsRoomCurScript], a
	ret

ChampionsRoom_ScriptPointers:
	dw GaryScript0
	dw GaryScript1
	dw GaryScript2
	dw GaryScript3
	dw GaryScript4
	dw GaryScript5
	dw GaryScript6
	dw GaryScript7
	dw GaryScript8
	dw GaryScript9
	dw GaryScript10

GaryScript0:
	ret

GaryScript1:
	ld a, $ff
	ld [wJoyIgnore], a
	ld hl, wSimulatedJoypadStatesEnd
	ld de, GaryEntrance_RLEMovement
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, $2
	ld [wChampionsRoomCurScript], a
	ret

GaryEntrance_RLEMovement:
	db D_UP,1
	db D_RIGHT,1
	db D_UP,3
	db $ff

GaryScript2:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld hl, wOptions
	res 7, [hl]  ; Turn on battle animations to make the battle feel more epic.
	ld a, $1
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	call Delay3
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, GaryDefeatedText
	ld de, GaryVictoryText
	call SaveEndBattleTextPointers
	ld a, OPP_SONY3
	ld [wCurOpponent], a

	; select which team to use during the encounter
	ld a, [wRivalStarter]
	cp STARTER2
	jr nz, .NotStarter2
	ld a, $1
	jr .saveTrainerId
.NotStarter2
	cp STARTER3
	jr nz, .NotStarter3
	ld a, $2
	jr .saveTrainerId
.NotStarter3
	ld a, $3
.saveTrainerId
	ld [wTrainerNo], a

	xor a
	ld [hJoyHeld], a
	ld a, $3
	ld [wChampionsRoomCurScript], a
	ret

GaryScript3:
	ld a, [wIsInBattle]
	cp $ff
	jp z, ResetGaryScript
	call UpdateSprites
	SetEvent EVENT_BEAT_CHAMPION_RIVAL
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, $1
	ld [hSpriteIndexOrTextID], a
	call GaryScript_760c8
	ld a, $1
	ld [H_SPRITEINDEX], a
	call SetSpriteMovementBytesToFF
	ld a, $4
	ld [wChampionsRoomCurScript], a
	ret

GaryScript4:
	callba Music_Cities1AlternateTempo
	ld a, $2
	ld [hSpriteIndexOrTextID], a
	call GaryScript_760c8
	ld a, $2
	ld [H_SPRITEINDEX], a
	call SetSpriteMovementBytesToFF
	ld de, OakEntranceAfterVictoryMovement
	ld a, $2
	ld [H_SPRITEINDEX], a
	call MoveSprite
	ld a, HS_CHAMPIONS_ROOM_OAK
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld a, $5
	ld [wChampionsRoomCurScript], a
	ret

OakEntranceAfterVictoryMovement:
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db $FF

GaryScript5:
	ld a, [wd730]
	bit 0, a
	ret nz
	ld a, PLAYER_DIR_LEFT
	ld [wPlayerMovingDirection], a
	ld a, $1
	ld [H_SPRITEINDEX], a
	ld a, SPRITE_FACING_LEFT
	ld [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, $2
	ld [H_SPRITEINDEX], a
	xor a ; SPRITE_FACING_DOWN
	ld [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, $3
	ld [hSpriteIndexOrTextID], a
	call GaryScript_760c8
	ld a, $6
	ld [wChampionsRoomCurScript], a
	ret

GaryScript6:
	ld a, $2
	ld [H_SPRITEINDEX], a
	ld a, SPRITE_FACING_RIGHT
	ld [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, $4
	ld [hSpriteIndexOrTextID], a
	call GaryScript_760c8
	ld a, $7
	ld [wChampionsRoomCurScript], a
	ret

GaryScript7:
	ld a, $2
	ld [H_SPRITEINDEX], a
	xor a ; SPRITE_FACING_DOWN
	ld [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, $5
	ld [hSpriteIndexOrTextID], a
	call GaryScript_760c8
	ld de, OakExitGaryRoomMovement
	ld a, $2
	ld [H_SPRITEINDEX], a
	call MoveSprite
	ld a, $8
	ld [wChampionsRoomCurScript], a
	ret

OakExitGaryRoomMovement:
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db $FF

GaryScript8:
	ld a, [wd730]
	bit 0, a
	ret nz
	ld a, HS_CHAMPIONS_ROOM_OAK
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, $9
	ld [wChampionsRoomCurScript], a
	ret

GaryScript9:
	ld a, $ff
	ld [wJoyIgnore], a
	ld hl, wSimulatedJoypadStatesEnd
	ld de, WalkToHallOfFame_RLEMovment
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, $a
	ld [wChampionsRoomCurScript], a
	ret

WalkToHallOfFame_RLEMovment:
	db D_UP,4
	db D_LEFT,1
	db $ff

GaryScript10:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, $0
	ld [wChampionsRoomCurScript], a
	ret

GaryScript_760c8:
	ld a, $f0
	ld [wJoyIgnore], a
	call DisplayTextID
	ld a, $ff
	ld [wJoyIgnore], a
	ret

ChampionsRoom_TextPointers:
	dw GaryText1
	dw GaryText2
	dw GaryText3
	dw GaryText4
	dw GaryText5

GaryText1:
	TX_ASM
	CheckEvent EVENT_BEAT_CHAMPION_RIVAL
	ld hl, GaryChampionIntroText
	jr z, .printText
	ld hl, GaryText_76103
.printText
	call PrintText
	jp TextScriptEnd

GaryChampionIntroText:
	TX_FAR _GaryChampionIntroText
	db "@"

GaryDefeatedText:
	TX_FAR _GaryDefeatedText
	db "@"

GaryVictoryText:
	TX_FAR _GaryVictoryText
	db "@"

GaryText_76103:
	TX_FAR _GaryText_76103
	db "@"

GaryText2:
	TX_FAR _GaryText2
	db "@"

GaryText3:
	TX_ASM
	ld a, [wPlayerStarter]
	ld [wd11e], a
	call GetMonName
	ld hl, GaryText_76120
	call PrintText
	jp TextScriptEnd

GaryText_76120:
	TX_FAR _GaryText_76120
	db "@"

GaryText4:
	TX_FAR _GaryText_76125
	db "@"

GaryText5:
	TX_FAR _GaryText_7612a
	db "@"
