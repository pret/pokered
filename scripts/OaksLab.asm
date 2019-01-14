OaksLab_Script:
	CheckEvent EVENT_PALLET_AFTER_GETTING_POKEBALLS_2
	call nz, OaksLabScript_1d076
	ld a, $1
	ld [wAutoTextBoxDrawingControl], a
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, OaksLab_ScriptPointers
	ld a, [wOaksLabCurScript]
	jp CallFunctionInTable

OaksLab_ScriptPointers:
	dw OaksLabScript0
	dw OaksLabScript1
	dw OaksLabScript2
	dw OaksLabScript3
	dw OaksLabScript4
	dw OaksLabScript5
	dw OaksLabScript6
	dw OaksLabScript7
	dw OaksLabScript8
	dw OaksLabScript9
	dw OaksLabScript10
	dw OaksLabScript11
	dw OaksLabScript12
	dw OaksLabScript13
	dw OaksLabScript14
	dw OaksLabScript15
	dw OaksLabScript16
	dw OaksLabScript17
	dw OaksLabScript18

OaksLabScript0:
	CheckEvent EVENT_OAK_APPEARED_IN_PALLET
	ret z
	ld a, [wNPCMovementScriptFunctionNum]
	and a
	ret nz
	ld a, HS_OAKS_LAB_OAK_2
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld hl, wd72e
	res 4, [hl]

	ld a, $1
	ld [wOaksLabCurScript], a
	ret

OaksLabScript1:
	ld a, $8
	ld [H_SPRITEINDEX], a
	ld de, OakEntryMovement
	call MoveSprite

	ld a, $2
	ld [wOaksLabCurScript], a
	ret

OakEntryMovement:
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db $FF

OaksLabScript2:
	ld a, [wd730]
	bit 0, a
	ret nz
	ld a, HS_OAKS_LAB_OAK_2
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_OAKS_LAB_OAK_1
	ld [wMissableObjectIndex], a
	predef ShowObject

	ld a, $3
	ld [wOaksLabCurScript], a
	ret

OaksLabScript3:
	call Delay3
	ld hl, wSimulatedJoypadStatesEnd
	ld de, PlayerEntryMovementRLE
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, $1
	ld [H_SPRITEINDEX], a
	xor a
	ld [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, $5
	ld [H_SPRITEINDEX], a
	xor a
	ld [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay

	ld a, $4
	ld [wOaksLabCurScript], a
	ret

PlayerEntryMovementRLE:
	db D_UP,$8
	db $ff

OaksLabScript4:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	SetEvent EVENT_FOLLOWED_OAK_INTO_LAB
	SetEvent EVENT_FOLLOWED_OAK_INTO_LAB_2
	ld a, $1
	ld [H_SPRITEINDEX], a
	ld a, SPRITE_FACING_UP
	ld [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	call UpdateSprites
	ld hl, wFlags_D733
	res 1, [hl]
	call PlayDefaultMusic

	ld a, $5
	ld [wOaksLabCurScript], a
	ret

OaksLabScript5:
	ld a, $fc
	ld [wJoyIgnore], a
	ld a, $11
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	call Delay3
	ld a, $12
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	call Delay3
	ld a, $13
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	call Delay3
	ld a, $14
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_OAK_ASKED_TO_CHOOSE_MON
	xor a
	ld [wJoyIgnore], a

	ld a, $6
	ld [wOaksLabCurScript], a
	ret

OaksLabScript6:
	ld a, [wYCoord]
	cp $6
	ret nz
	ld a, $5
	ld [H_SPRITEINDEX], a
	xor a ; SPRITE_FACING_DOWN
	ld [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, $1
	ld [H_SPRITEINDEX], a
	xor a
	ld [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	call UpdateSprites
	ld a, $c
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, D_UP
	ld [wSimulatedJoypadStatesEnd], a
	call StartSimulatingJoypadStates
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a

	ld a, $7
	ld [wOaksLabCurScript], a
	ret

OaksLabScript7:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3

	ld a, $6
	ld [wOaksLabCurScript], a
	ret

OaksLabScript8:
	ld a, [wPlayerStarter]
	cp STARTER1
	jr z, .Charmander
	cp STARTER2
	jr z, .Squirtle
	jr .Bulbasaur
.Charmander
	ld de, .MiddleBallMovement1
	ld a, [wYCoord]
	cp $4 ; is the player standing below the table?
	jr z, .asm_1ccf3
	ld de, .MiddleBallMovement2
	jr .asm_1ccf3

.MiddleBallMovement1
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_UP
	db $FF

.MiddleBallMovement2
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db $FF

.Squirtle
	ld de, .RightBallMovement1
	ld a, [wYCoord]
	cp $4 ; is the player standing below the table?
	jr z, .asm_1ccf3
	ld de, .RightBallMovement2
	jr .asm_1ccf3

.RightBallMovement1
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_UP
	db $FF

.RightBallMovement2
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db $FF

.Bulbasaur
	ld de, .LeftBallMovement1
	ld a, [wXCoord]
	cp $9 ; is the player standing to the right of the table?
	jr nz, .asm_1ccf3
	push hl
	ld a, $1
	ld [H_SPRITEINDEX], a
	ld a, $4
	ld [H_SPRITEDATAOFFSET], a
	call GetPointerWithinSpriteStateData1
	push hl
	ld [hl], $4c
	inc hl
	inc hl
	ld [hl], $0
	pop hl
	inc h
	ld [hl], $8
	inc hl
	ld [hl], $9
	ld de, .LeftBallMovement2 ; the rival is not currently onscreen, so account for that
	pop hl
	jr .asm_1ccf3

.LeftBallMovement1
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_RIGHT ; not yet terminated!
.LeftBallMovement2
	db NPC_MOVEMENT_RIGHT
	db $FF

.asm_1ccf3
	ld a, $1
	ld [H_SPRITEINDEX], a
	call MoveSprite

	ld a, $9
	ld [wOaksLabCurScript], a
	ret

OaksLabScript9:
	ld a, [wd730]
	bit 0, a
	ret nz
	ld a, $fc
	ld [wJoyIgnore], a
	ld a, $1
	ld [H_SPRITEINDEX], a
	ld a, SPRITE_FACING_UP
	ld [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, $d
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, [wRivalStarterBallSpriteIndex]
	cp $2
	jr nz, .asm_1cd28
	ld a, HS_STARTER_BALL_1
	jr .asm_1cd32
.asm_1cd28
	cp $3
	jr nz, .asm_1cd30
	ld a, HS_STARTER_BALL_2
	jr .asm_1cd32
.asm_1cd30
	ld a, HS_STARTER_BALL_3
.asm_1cd32
	ld [wMissableObjectIndex], a
	predef HideObject
	call Delay3
	ld a, [wRivalStarterTemp]
	ld [wRivalStarter], a
	ld [wcf91], a
	ld [wd11e], a
	call GetMonName
	ld a, $1
	ld [H_SPRITEINDEX], a
	ld a, SPRITE_FACING_UP
	ld [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, $e
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_GOT_STARTER
	xor a
	ld [wJoyIgnore], a

	ld a, $a
	ld [wOaksLabCurScript], a
	ret

OaksLabScript10:
	ld a, [wYCoord]
	cp $6
	ret nz
	ld a, $1
	ld [H_SPRITEINDEX], a
	xor a ; SPRITE_FACING_DOWN
	ld [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	ld c, BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	ld a, $f
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $1
	ld [hNPCPlayerRelativePosPerspective], a
	ld a, $1
	swap a
	ld [hNPCSpriteOffset], a
	predef CalcPositionOfPlayerRelativeToNPC
	ld a, [hNPCPlayerYDistance]
	dec a
	ld [hNPCPlayerYDistance], a
	predef FindPathToPlayer
	ld de, wNPCMovementDirections2
	ld a, $1
	ld [H_SPRITEINDEX], a
	call MoveSprite

	ld a, $b
	ld [wOaksLabCurScript], a
	ret

OaksLabScript11:
	ld a, [wd730]
	bit 0, a
	ret nz

	; define which team rival uses, and fight it
	ld a, OPP_SONY1
	ld [wCurOpponent], a
	ld a, [wRivalStarter]
	cp STARTER2
	jr nz, .NotSquirtle
	ld a, $1
	jr .done
.NotSquirtle
	cp STARTER3
	jr nz, .Charmander
	ld a, $2
	jr .done
.Charmander
	ld a, $3
.done
	ld [wTrainerNo], a
	ld a, $1
	ld [wSpriteIndex], a
	call GetSpritePosition1
	ld hl, OaksLabText_1d3be
	ld de, OaksLabText_1d3c3
	call SaveEndBattleTextPointers
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	xor a
	ld [wJoyIgnore], a
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	ld a, $c
	ld [wOaksLabCurScript], a
	ret

OaksLabScript12:
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	call UpdateSprites
	ld a, $1
	ld [wSpriteIndex], a
	call SetSpritePosition1
	ld a, $1
	ld [H_SPRITEINDEX], a
	xor a ; SPRITE_FACING_DOWN
	ld [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	predef HealParty
	SetEvent EVENT_BATTLED_RIVAL_IN_OAKS_LAB

	ld a, $d
	ld [wOaksLabCurScript], a
	ret

OaksLabScript13:
	ld c, 20
	call DelayFrames
	ld a, $10
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	callba Music_RivalAlternateStart
	ld a, $1
	ld [H_SPRITEINDEX], a
	ld de, .RivalExitMovement
	call MoveSprite
	ld a, [wXCoord]
	cp $4
	; move left or right depending on where the player is standing
	jr nz, .moveLeft
	ld a, NPC_MOVEMENT_RIGHT
	jr .next
.moveLeft
	ld a, NPC_MOVEMENT_LEFT
.next
	ld [wNPCMovementDirections], a

	ld a, $e
	ld [wOaksLabCurScript], a
	ret

.RivalExitMovement
	db $E0 ; change sprite facing direction
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db $FF

OaksLabScript14:
	ld a, [wd730]
	bit 0, a
	jr nz, .asm_1ce8c
	ld a, HS_OAKS_LAB_RIVAL
	ld [wMissableObjectIndex], a
	predef HideObject
	xor a
	ld [wJoyIgnore], a
	call PlayDefaultMusic ; reset to map music
	ld a, $12
	ld [wOaksLabCurScript], a
	jr .done
; make the player keep facing the rival as he walks away
.asm_1ce8c
	ld a, [wNPCNumScriptedSteps]
	cp $5
	jr nz, .asm_1cea8
	ld a, [wXCoord]
	cp $4
	jr nz, .asm_1cea1
	ld a, SPRITE_FACING_RIGHT
	ld [wSpriteStateData1 + 9], a
	jr .done
.asm_1cea1
	ld a, SPRITE_FACING_LEFT
	ld [wSpriteStateData1 + 9], a
	jr .done
.asm_1cea8
	cp $4
	ret nz
	xor a ; ld a, SPRITE_FACING_DOWN
	ld [wSpriteStateData1 + 9], a
.done
	ret

OaksLabScript15:
	xor a
	ld [hJoyHeld], a
	call EnableAutoTextBoxDrawing
	ld a, $ff
	ld [wNewSoundID], a
	call PlaySound
	callba Music_RivalAlternateStart
	ld a, $15
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	call OaksLabScript_1d02b
	ld a, HS_OAKS_LAB_RIVAL
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld a, [wNPCMovementDirections2Index]
	ld [wSavedNPCMovementDirections2Index], a
	ld b, 0
	ld c, a
	ld hl, wNPCMovementDirections2
	ld a, NPC_MOVEMENT_UP
	call FillMemory
	ld [hl], $ff
	ld a, $1
	ld [H_SPRITEINDEX], a
	ld de, wNPCMovementDirections2
	call MoveSprite

	ld a, $10
	ld [wOaksLabCurScript], a
	ret

OaksLabScript_1cefd:
	ld a, $1
	ld [H_SPRITEINDEX], a
	ld a, SPRITE_FACING_UP
	ld [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, $8
	ld [H_SPRITEINDEX], a
	xor a ; SPRITE_FACING_DOWN
	ld [hSpriteFacingDirection], a
	jp SetSpriteFacingDirectionAndDelay

OaksLabScript16:
	ld a, [wd730]
	bit 0, a
	ret nz
	call EnableAutoTextBoxDrawing
	call PlayDefaultMusic
	ld a, $fc
	ld [wJoyIgnore], a
	call OaksLabScript_1cefd
	ld a, $16
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	call DelayFrame
	call OaksLabScript_1cefd
	ld a, $17
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	call DelayFrame
	call OaksLabScript_1cefd
	ld a, $18
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	call DelayFrame
	ld a, $19
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	call Delay3
	ld a, HS_POKEDEX_1
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_POKEDEX_2
	ld [wMissableObjectIndex], a
	predef HideObject
	call OaksLabScript_1cefd
	ld a, $1a
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $1
	ld [H_SPRITEINDEX], a
	ld a, SPRITE_FACING_RIGHT
	ld [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	call Delay3
	ld a, $1b
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_GOT_POKEDEX
	SetEvent EVENT_OAK_GOT_PARCEL
	ld a, HS_LYING_OLD_MAN
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_OLD_MAN
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld a, [wSavedNPCMovementDirections2Index]
	ld b, 0
	ld c, a
	ld hl, wNPCMovementDirections2
	xor a ; NPC_MOVEMENT_DOWN
	call FillMemory
	ld [hl], $ff
	ld a, $ff
	ld [wNewSoundID], a
	call PlaySound
	callba Music_RivalAlternateStart
	ld a, $1
	ld [H_SPRITEINDEX], a
	ld de, wNPCMovementDirections2
	call MoveSprite

	ld a, $11
	ld [wOaksLabCurScript], a
	ret

OaksLabScript17:
	ld a, [wd730]
	bit 0, a
	ret nz
	call PlayDefaultMusic
	ld a, HS_OAKS_LAB_RIVAL
	ld [wMissableObjectIndex], a
	predef HideObject
	SetEvent EVENT_1ST_ROUTE22_RIVAL_BATTLE
	ResetEventReuseHL EVENT_2ND_ROUTE22_RIVAL_BATTLE
	SetEventReuseHL EVENT_ROUTE22_RIVAL_WANTS_BATTLE
	ld a, HS_ROUTE_22_RIVAL_1
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld a, $5
	ld [wPalletTownCurScript], a
	xor a
	ld [wJoyIgnore], a

	ld a, $12
	ld [wOaksLabCurScript], a
	ret

OaksLabScript18:
	ret

OaksLabScript_RemoveParcel:
	ld hl, wBagItems
	ld bc, $0000
.loop
	ld a, [hli]
	cp $ff
	ret z
	cp OAKS_PARCEL
	jr z, .foundParcel
	inc hl
	inc c
	jr .loop
.foundParcel
	ld hl, wNumBagItems
	ld a, c
	ld [wWhichPokemon], a
	ld a, $1
	ld [wItemQuantity], a
	jp RemoveItemFromInventory

OaksLabScript_1d02b:
	ld a, $7c
	ld [$ffeb], a
	ld a, $8
	ld [$ffee], a
	ld a, [wYCoord]
	cp $3
	jr nz, .asm_1d045
	ld a, $4
	ld [wNPCMovementDirections2Index], a
	ld a, $30
	ld b, $b
	jr .asm_1d068
.asm_1d045
	cp $1
	jr nz, .asm_1d054
	ld a, $2
	ld [wNPCMovementDirections2Index], a
	ld a, $30
	ld b, $9
	jr .asm_1d068
.asm_1d054
	ld a, $3
	ld [wNPCMovementDirections2Index], a
	ld b, $a
	ld a, [wXCoord]
	cp $4
	jr nz, .asm_1d066
	ld a, $40
	jr .asm_1d068
.asm_1d066
	ld a, $20
.asm_1d068
	ld [$ffec], a
	ld a, b
	ld [$ffed], a
	ld a, $1
	ld [wSpriteIndex], a
	call SetSpritePosition1
	ret

OaksLabScript_1d076:
	ld hl, OaksLab_TextPointers2
	ld a, l
	ld [wMapTextPtr], a
	ld a, h
	ld [wMapTextPtr+1], a
	ret

OaksLab_TextPointers:
	dw OaksLabText1
	dw OaksLabText2
	dw OaksLabText3
	dw OaksLabText4
	dw OaksLabText5
	dw OaksLabText6
	dw OaksLabText7
	dw OaksLabText8
	dw OaksLabText9
	dw OaksLabText10
	dw OaksLabText11
	dw OaksLabText12
	dw OaksLabText13
	dw OaksLabText14
	dw OaksLabText15
	dw OaksLabText16
	dw OaksLabText17
	dw OaksLabText18
	dw OaksLabText19
	dw OaksLabText20
	dw OaksLabText21
	dw OaksLabText22
	dw OaksLabText23
	dw OaksLabText24
	dw OaksLabText25
	dw OaksLabText26
	dw OaksLabText27

OaksLab_TextPointers2:
	dw OaksLabText1
	dw OaksLabText2
	dw OaksLabText3
	dw OaksLabText4
	dw OaksLabText5
	dw OaksLabText6
	dw OaksLabText7
	dw OaksLabText8
	dw OaksLabText9
	dw OaksLabText10
	dw OaksLabText11

OaksLabText1:
	TX_ASM
	CheckEvent EVENT_FOLLOWED_OAK_INTO_LAB_2
	jr nz, .asm_1d0de
	ld hl, OaksLabGaryText1
	call PrintText
	jr .asm_1d0f0
.asm_1d0de
	bit 2, a
	jr nz, .asm_1d0ea
	ld hl, OaksLabText40
	call PrintText
	jr .asm_1d0f0
.asm_1d0ea
	ld hl, OaksLabText41
	call PrintText
.asm_1d0f0
	jp TextScriptEnd

OaksLabGaryText1:
	TX_FAR _OaksLabGaryText1
	db "@"

OaksLabText40:
	TX_FAR _OaksLabText40
	db "@"

OaksLabText41:
	TX_FAR _OaksLabText41
	db "@"

OaksLabText2:
	TX_ASM
	ld a, STARTER2
	ld [wRivalStarterTemp], a
	ld a, $3
	ld [wRivalStarterBallSpriteIndex], a
	ld a, STARTER1
	ld b, $2
	jr OaksLabScript_1d133

OaksLabText3:
	TX_ASM
	ld a, STARTER3
	ld [wRivalStarterTemp], a
	ld a, $4
	ld [wRivalStarterBallSpriteIndex], a
	ld a, STARTER2
	ld b, $3
	jr OaksLabScript_1d133

OaksLabText4:
	TX_ASM
	ld a, STARTER1
	ld [wRivalStarterTemp], a
	ld a, $2
	ld [wRivalStarterBallSpriteIndex], a
	ld a, STARTER3
	ld b, $4

OaksLabScript_1d133:
	ld [wcf91], a
	ld [wd11e], a
	ld a, b
	ld [wSpriteIndex], a
	CheckEvent EVENT_GOT_STARTER
	jp nz, OaksLabScript_1d22d
	CheckEventReuseA EVENT_OAK_ASKED_TO_CHOOSE_MON
	jr nz, OaksLabScript_1d157
	ld hl, OaksLabText39
	call PrintText
	jp TextScriptEnd

OaksLabText39:
	TX_FAR _OaksLabText39
	db "@"

OaksLabScript_1d157:
	ld a, $5
	ld [H_SPRITEINDEX], a
	ld a, $9
	ld [H_SPRITEDATAOFFSET], a
	call GetPointerWithinSpriteStateData1
	ld [hl], SPRITE_FACING_DOWN
	ld a, $1
	ld [H_SPRITEINDEX], a
	ld a, $9
	ld [H_SPRITEDATAOFFSET], a
	call GetPointerWithinSpriteStateData1
	ld [hl], SPRITE_FACING_RIGHT
	ld hl, wd730
	set 6, [hl]
	predef StarterDex
	ld hl, wd730
	res 6, [hl]
	call ReloadMapData
	ld c, 10
	call DelayFrames
	ld a, [wSpriteIndex]
	cp $2
	jr z, OaksLabLookAtCharmander
	cp $3
	jr z, OaksLabLookAtSquirtle
	jr OaksLabLookAtBulbasaur

OaksLabLookAtCharmander:
	ld hl, OaksLabCharmanderText
	jr OaksLabMonChoiceMenu
OaksLabCharmanderText:
	TX_FAR _OaksLabCharmanderText
	db "@"

OaksLabLookAtSquirtle:
	ld hl, OaksLabSquirtleText
	jr OaksLabMonChoiceMenu
OaksLabSquirtleText:
	TX_FAR _OaksLabSquirtleText
	db "@"

OaksLabLookAtBulbasaur:
	ld hl, OaksLabBulbasaurText
	jr OaksLabMonChoiceMenu
OaksLabBulbasaurText:
	TX_FAR _OaksLabBulbasaurText
	db "@"

OaksLabMonChoiceMenu:
	call PrintText
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	call YesNoChoice ; yes/no menu
	ld a, [wCurrentMenuItem]
	and a
	jr nz, OaksLabMonChoiceEnd
	ld a, [wcf91]
	ld [wPlayerStarter], a
	ld [wd11e], a
	call GetMonName
	ld a, [wSpriteIndex]
	cp $2
	jr nz, .asm_1d1db
	ld a, HS_STARTER_BALL_1
	jr .asm_1d1e5
.asm_1d1db
	cp $3
	jr nz, .asm_1d1e3
	ld a, HS_STARTER_BALL_2
	jr .asm_1d1e5
.asm_1d1e3
	ld a, HS_STARTER_BALL_3
.asm_1d1e5
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, OaksLabMonEnergeticText
	call PrintText
	ld hl, OaksLabReceivedMonText
	call PrintText
	xor a ; PLAYER_PARTY_DATA
	ld [wMonDataLocation], a
	ld a, 5
	ld [wCurEnemyLVL], a
	ld a, [wcf91]
	ld [wd11e], a
	call AddPartyMon
	ld hl, wd72e
	set 3, [hl]
	ld a, $fc
	ld [wJoyIgnore], a
	ld a, $8
	ld [wOaksLabCurScript], a
OaksLabMonChoiceEnd:
	jp TextScriptEnd

OaksLabMonEnergeticText:
	TX_FAR _OaksLabMonEnergeticText
	db "@"

OaksLabReceivedMonText:
	TX_FAR _OaksLabReceivedMonText
	TX_SFX_KEY_ITEM
	db "@"

OaksLabScript_1d22d:
	ld a, $5
	ld [H_SPRITEINDEX], a
	ld a, $9
	ld [H_SPRITEDATAOFFSET], a
	call GetPointerWithinSpriteStateData1
	ld [hl], $0
	ld hl, OaksLabLastMonText
	call PrintText
	jp TextScriptEnd

OaksLabLastMonText:
	TX_FAR _OaksLabLastMonText
	db "@"

OaksLabText32:
OaksLabText5:
	TX_ASM
	CheckEvent EVENT_PALLET_AFTER_GETTING_POKEBALLS
	jr nz, .asm_1d266
	ld hl, wPokedexOwned
	ld b, wPokedexOwnedEnd - wPokedexOwned
	call CountSetBits
	ld a, [wNumSetBits]
	cp 2
	jr c, .asm_1d279
	CheckEvent EVENT_GOT_POKEDEX
	jr z, .asm_1d279
.asm_1d266
	ld hl, OaksLabText_1d31d
	call PrintText
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	predef DisplayDexRating
	jp .asm_1d2ed
.asm_1d279
	ld b, POKE_BALL
	call IsItemInBag
	jr nz, .asm_1d2e7
	CheckEvent EVENT_BEAT_ROUTE22_RIVAL_1ST_BATTLE
	jr nz, .asm_1d2d0
	CheckEvent EVENT_GOT_POKEDEX
	jr nz, .asm_1d2c8
	CheckEventReuseA EVENT_BATTLED_RIVAL_IN_OAKS_LAB
	jr nz, .asm_1d2a9
	ld a, [wd72e]
	bit 3, a
	jr nz, .asm_1d2a1
	ld hl, OaksLabText_1d2f0
	call PrintText
	jr .asm_1d2ed
.asm_1d2a1
	ld hl, OaksLabText_1d2f5
	call PrintText
	jr .asm_1d2ed
.asm_1d2a9
	ld b, OAKS_PARCEL
	call IsItemInBag
	jr nz, .asm_1d2b8
	ld hl, OaksLabText_1d2fa
	call PrintText
	jr .asm_1d2ed
.asm_1d2b8
	ld hl, OaksLabDeliverParcelText
	call PrintText
	call OaksLabScript_RemoveParcel
	ld a, $f
	ld [wOaksLabCurScript], a
	jr .asm_1d2ed
.asm_1d2c8
	ld hl, OaksLabAroundWorldText
	call PrintText
	jr .asm_1d2ed
.asm_1d2d0
	CheckAndSetEvent EVENT_GOT_POKEBALLS_FROM_OAK
	jr nz, .asm_1d2e7
	lb bc, POKE_BALL, 5
	call GiveItem
	ld hl, OaksLabGivePokeballsText
	call PrintText
	jr .asm_1d2ed
.asm_1d2e7
	ld hl, OaksLabPleaseVisitText
	call PrintText
.asm_1d2ed
	jp TextScriptEnd

OaksLabText_1d2f0:
	TX_FAR _OaksLabText_1d2f0
	db "@"

OaksLabText_1d2f5:
	TX_FAR _OaksLabText_1d2f5
	db "@"

OaksLabText_1d2fa:
	TX_FAR _OaksLabText_1d2fa
	db "@"

OaksLabDeliverParcelText:
	TX_FAR _OaksLabDeliverParcelText1
	TX_SFX_KEY_ITEM
	TX_FAR _OaksLabDeliverParcelText2
	db "@"

OaksLabAroundWorldText:
	TX_FAR _OaksLabAroundWorldText
	db "@"

OaksLabGivePokeballsText:
	TX_FAR _OaksLabGivePokeballsText1
	TX_SFX_KEY_ITEM
	TX_FAR _OaksLabGivePokeballsText2
	db "@"

OaksLabPleaseVisitText:
	TX_FAR _OaksLabPleaseVisitText
	db "@"

OaksLabText_1d31d:
	TX_FAR _OaksLabText_1d31d
	db "@"

OaksLabText7:
OaksLabText6:
	TX_ASM
	ld hl, OaksLabText_1d32c
	call PrintText
	jp TextScriptEnd

OaksLabText_1d32c:
	TX_FAR _OaksLabText_1d32c
	db "@"

OaksLabText8:
	TX_FAR _OaksLabText8
	db "@"

OaksLabText9:
	TX_ASM
	ld hl, OaksLabText_1d340
	call PrintText
	jp TextScriptEnd

OaksLabText_1d340:
	TX_FAR _OaksLabText_1d340
	db "@"

OaksLabText17:
	TX_ASM
	ld hl, OaksLabRivalWaitingText
	call PrintText
	jp TextScriptEnd

OaksLabRivalWaitingText:
	TX_FAR _OaksLabRivalWaitingText
	db "@"

OaksLabText18:
	TX_ASM
	ld hl, OaksLabChooseMonText
	call PrintText
	jp TextScriptEnd

OaksLabChooseMonText:
	TX_FAR _OaksLabChooseMonText
	db "@"

OaksLabText19:
	TX_ASM
	ld hl, OaksLabRivalInterjectionText
	call PrintText
	jp TextScriptEnd

OaksLabRivalInterjectionText:
	TX_FAR _OaksLabRivalInterjectionText
	db "@"

OaksLabText20:
	TX_ASM
	ld hl, OaksLabBePatientText
	call PrintText
	jp TextScriptEnd

OaksLabBePatientText:
	TX_FAR _OaksLabBePatientText
	db "@"

OaksLabText12:
	TX_ASM
	ld hl, OaksLabLeavingText
	call PrintText
	jp TextScriptEnd

OaksLabLeavingText:
	TX_FAR _OaksLabLeavingText
	db "@"

OaksLabText13:
	TX_ASM
	ld hl, OaksLabRivalPickingMonText
	call PrintText
	jp TextScriptEnd

OaksLabRivalPickingMonText:
	TX_FAR _OaksLabRivalPickingMonText
	db "@"

OaksLabText14:
	TX_ASM
	ld hl, OaksLabRivalReceivedMonText
	call PrintText
	jp TextScriptEnd

OaksLabRivalReceivedMonText:
	TX_FAR _OaksLabRivalReceivedMonText
	TX_SFX_KEY_ITEM
	db "@"

OaksLabText15:
	TX_ASM
	ld hl, OaksLabRivalChallengeText
	call PrintText
	jp TextScriptEnd

OaksLabRivalChallengeText:
	TX_FAR _OaksLabRivalChallengeText
	db "@"

OaksLabText_1d3be:
	TX_FAR _OaksLabText_1d3be
	db "@"

OaksLabText_1d3c3:
	TX_FAR _OaksLabText_1d3c3
	db "@"

OaksLabText16:
	TX_ASM
	ld hl, OaksLabRivalToughenUpText
	call PrintText
	jp TextScriptEnd

OaksLabRivalToughenUpText:
	TX_FAR _OaksLabRivalToughenUpText
	db "@"

OaksLabText21:
	TX_FAR _OaksLabText21
	db "@"

OaksLabText22:
	TX_FAR _OaksLabText22
	db "@"

OaksLabText23:
	TX_FAR _OaksLabText23
	db "@"

OaksLabText24:
	TX_FAR _OaksLabText24
	db "@"

OaksLabText25:
	TX_FAR _OaksLabText25
	TX_SFX_KEY_ITEM
	db "@"

OaksLabText26:
	TX_FAR _OaksLabText26
	db "@"

OaksLabText27:
	TX_FAR _OaksLabText27
	db "@"

OaksLabText11:
OaksLabText10:
	TX_ASM
	ld hl, OaksLabText_1d405
	call PrintText
	jp TextScriptEnd

OaksLabText_1d405:
	TX_FAR _OaksLabText_1d405
	db "@"
