OaksLabScript: ; 1cb0e (7:4b0e)
	ld a, [wd74b]
	bit 6, a
	call nz, OaksLabScript_1d076
	ld a, $1
	ld [wAutoTextBoxDrawingControl], a
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, OaksLabScriptPointers
	ld a, [W_OAKSLABCURSCRIPT]
	jp CallFunctionInTable

OaksLabScriptPointers: ; 1cb28 (7:4b28)
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

OaksLabScript0: ; 1cb4e (7:4b4e)
	ld a, [wd74b]
	bit 7, a
	ret z
	ld a, [wNPCMovementScriptFunctionNum]
	and a
	ret nz
	ld a, $31
	ld [wcc4d], a
	predef ShowObject
	ld hl, wd72e
	res 4, [hl]

	ld a, $1
	ld [W_OAKSLABCURSCRIPT], a
	ret

OaksLabScript1: ; 1cb6e (7:4b6e)
	ld a, $8
	ld [H_SPRITEINDEX], a
	ld de, OakEntryMovement
	call MoveSprite

	ld a, $2
	ld [W_OAKSLABCURSCRIPT], a
	ret

OakEntryMovement: ; 1cb7e (7:4b7e)
	db $40,$40,$40,$FF

OaksLabScript2: ; 1cb82 (7:4b82)
	ld a, [wd730]
	bit 0, a
	ret nz
	ld a, $31
	ld [wcc4d], a
	predef HideObject
	ld a, $2e
	ld [wcc4d], a
	predef ShowObject

	ld a, $3
	ld [W_OAKSLABCURSCRIPT], a
	ret

OaksLabScript3: ; 1cba2 (7:4ba2)
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
	ld [$ff8d], a
	call SetSpriteFacingDirectionAndDelay
	ld a, $5
	ld [H_SPRITEINDEX], a
	xor a
	ld [$ff8d], a
	call SetSpriteFacingDirectionAndDelay

	ld a, $4
	ld [W_OAKSLABCURSCRIPT], a
	ret

PlayerEntryMovementRLE: ; 1cbcf (7:4bcf)
	db $40, $8, $ff

OaksLabScript4: ; 1cbd2 (7:4bd2)
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld hl, wd747
	set 0, [hl]
	ld hl, wd74b
	set 0, [hl]
	ld a, $1
	ld [H_SPRITEINDEX], a
	ld a, $4
	ld [$ff8d], a
	call SetSpriteFacingDirectionAndDelay
	call UpdateSprites
	ld hl, W_FLAGS_D733
	res 1, [hl]
	call PlayDefaultMusic

	ld a, $5
	ld [W_OAKSLABCURSCRIPT], a
	ret

OaksLabScript5: ; 1cbfd (7:4bfd)
	ld a, $fc
	ld [wJoyIgnore], a
	ld a, $11
	ld [$ff8c], a
	call DisplayTextID
	call Delay3
	ld a, $12
	ld [$ff8c], a
	call DisplayTextID
	call Delay3
	ld a, $13
	ld [$ff8c], a
	call DisplayTextID
	call Delay3
	ld a, $14
	ld [$ff8c], a
	call DisplayTextID
	ld hl, wd74b
	set 1, [hl]
	xor a
	ld [wJoyIgnore], a

	ld a, $6
	ld [W_OAKSLABCURSCRIPT], a
	ret

OaksLabScript6: ; 1cc36 (7:4c36)
	ld a, [W_YCOORD]
	cp $6
	ret nz
	ld a, $5
	ld [H_SPRITEINDEX], a
	xor a
	ld [$ff8d], a
	call SetSpriteFacingDirectionAndDelay
	ld a, $1
	ld [H_SPRITEINDEX], a
	xor a
	ld [$ff8d], a
	call SetSpriteFacingDirectionAndDelay
	call UpdateSprites
	ld a, $c
	ld [$ff8c], a
	call DisplayTextID
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, $40
	ld [wSimulatedJoypadStatesEnd], a
	call StartSimulatingJoypadStates
	ld a, $8
	ld [wd528], a

	ld a, $7
	ld [W_OAKSLABCURSCRIPT], a
	ret

OaksLabScript7: ; 1cc72 (7:4c72)
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3

	ld a, $6
	ld [W_OAKSLABCURSCRIPT], a
	ret

OaksLabScript8: ; 1cc80 (7:4c80)
	ld a, [W_PLAYERSTARTER]
	cp STARTER1
	jr z, .Charmander ; 0x1cc85 $6
	cp STARTER2
	jr z, .Squirtle ; 0x1cc89 $1d
	jr .Bulbasaur ; 0x1cc8b $38
.Charmander
	ld de, .MiddleBallMovement1
	ld a, [W_YCOORD]
	cp $4 ; is the player standing below the table?
	jr z, .asm_1ccf3 ; 0x1cc95 $5c
	ld de, .MiddleBallMovement2
	jr .asm_1ccf3 ; 0x1cc9a $57

.MiddleBallMovement1
	db 0,0,$C0,$C0,$C0,$40,$FF
.MiddleBallMovement2
	db 0,$C0,$C0,$C0,$FF

.Squirtle
	ld de, .RightBallMovement1
	ld a, [W_YCOORD]
	cp $4 ; is the player standing below the table?
	jr z, .asm_1ccf3 ; 0x1ccb0 $41
	ld de, .RightBallMovement2
	jr .asm_1ccf3 ; 0x1ccb5 $3c

.RightBallMovement1
	db 0,0,$C0,$C0,$C0,$C0,$40,$FF
.RightBallMovement2
	db 0,$C0,$C0,$C0,$C0,$FF

.Bulbasaur
	ld de, .LeftBallMovement1
	ld a, [W_XCOORD]
	cp $9 ; is the player standing to the right of the table?
	jr nz, .asm_1ccf3 ; 0x1cccd $24
	push hl
	ld a, $1
	ld [H_SPRITEINDEX], a
	ld a, $4
	ld [$ff8b], a
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
	jr .asm_1ccf3 ; 0x1cced $4

.LeftBallMovement1
	db $00,$C0 ; not yet terminated!
.LeftBallMovement2
	db $C0,$FF

.asm_1ccf3
	ld a, $1
	ld [H_SPRITEINDEX], a
	call MoveSprite

	ld a, $9
	ld [W_OAKSLABCURSCRIPT], a
	ret

OaksLabScript9: ; 1cd00 (7:4d00)
	ld a, [wd730]
	bit 0, a
	ret nz
	ld a, $fc
	ld [wJoyIgnore], a
	ld a, $1
	ld [H_SPRITEINDEX], a
	ld a, $4
	ld [$ff8d], a
	call SetSpriteFacingDirectionAndDelay
	ld a, $d
	ld [$ff8c], a
	call DisplayTextID
	ld a, [wTrainerEngageDistance]
	cp $2
	jr nz, .asm_1cd28 ; 0x1cd22 $4
	ld a, $2b
	jr .asm_1cd32 ; 0x1cd26 $a
.asm_1cd28
	cp $3
	jr nz, .asm_1cd30 ; 0x1cd2a $4
	ld a, $2c
	jr .asm_1cd32 ; 0x1cd2e $2
.asm_1cd30
	ld a, $2d
.asm_1cd32
	ld [wcc4d], a
	predef HideObject
	call Delay3
	ld a, [wWhichTrade]
	ld [W_RIVALSTARTER], a
	ld [wcf91], a
	ld [wd11e], a
	call GetMonName
	ld a, $1
	ld [H_SPRITEINDEX], a
	ld a, $4
	ld [$ff8d], a
	call SetSpriteFacingDirectionAndDelay
	ld a, $e
	ld [$ff8c], a
	call DisplayTextID
	ld hl, wd74b
	set 2, [hl]
	xor a
	ld [wJoyIgnore], a

	ld a, $a
	ld [W_OAKSLABCURSCRIPT], a
	ret

OaksLabScript10: ; 1cd6d (7:4d6d)
	ld a, [W_YCOORD]
	cp $6
	ret nz
	ld a, $1
	ld [H_SPRITEINDEX], a
	xor a
	ld [$ff8d], a
	call SetSpriteFacingDirectionAndDelay
	ld a, $8
	ld [wd528], a
	ld c, BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic ; play music
	ld a, $f
	ld [$ff8c], a
	call DisplayTextID
	ld a, $1
	ld [$ff9b], a
	ld a, $1
	swap a
	ld [$ff95], a
	predef CalcPositionOfPlayerRelativeToNPC
	ld a, [$ff95]
	dec a
	ld [$ff95], a
	predef FindPathToPlayer
	ld de, wNPCMovementDirections2
	ld a, $1
	ld [H_SPRITEINDEX], a
	call MoveSprite

	ld a, $b
	ld [W_OAKSLABCURSCRIPT], a
	ret

OaksLabScript11: ; 1cdb9 (7:4db9)
	ld a, [wd730]
	bit 0, a
	ret nz

	; define which team rival uses, and fight it
	ld a, SONY1 + $C8
	ld [W_CUROPPONENT], a
	ld a, [W_RIVALSTARTER]
	cp STARTER2
	jr nz, .NotSquirtle ; 0x1cdc9 $4
	ld a, $1
	jr .done ; 0x1cdcd $a
.NotSquirtle
	cp STARTER3
	jr nz, .Charmander ; 0x1cdd1 $4
	ld a, $2
	jr .done ; 0x1cdd5 $2
.Charmander
	ld a, $3
.done
	ld [W_TRAINERNO], a
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
	ld a, $8
	ld [wd528], a
	ld a, $c
	ld [W_OAKSLABCURSCRIPT], a
	ret

OaksLabScript12: ; 1ce03 (7:4e03)
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, $8
	ld [wd528], a
	call UpdateSprites
	ld a, $1
	ld [wSpriteIndex], a
	call SetSpritePosition1
	ld a, $1
	ld [H_SPRITEINDEX], a
	xor a
	ld [$ff8d], a
	call SetSpriteFacingDirectionAndDelay
	predef HealParty
	ld hl, wd74b
	set 3, [hl]

	ld a, $d
	ld [W_OAKSLABCURSCRIPT], a
	ret

OaksLabScript13: ; 1ce32 (7:4e32)
	ld c, $14
	call DelayFrames
	ld a, $10
	ld [$ff8c], a
	call DisplayTextID
	callba Music_RivalAlternateStart
	ld a, $1
	ld [H_SPRITEINDEX], a
	ld de, .RivalExitMovement
	call MoveSprite
	ld a, [W_XCOORD]
	cp $4
	; move left or right depending on where the player is standing
	jr nz, .asm_1ce5b ; 0x1ce55 $4
	ld a, $c0
	jr .asm_1ce5d ; 0x1ce59 $2
.asm_1ce5b
	ld a, $80
.asm_1ce5d
	ld [wcc5b], a

	ld a, $e
	ld [W_OAKSLABCURSCRIPT], a
	ret

.RivalExitMovement
	db $E0,$00,$00,$00,$00,$00,$FF

OaksLabScript14: ; 1ce6d (7:4e6d)
	ld a, [wd730]
	bit 0, a
	jr nz, .asm_1ce8c ; 0x1ce72 $18
	ld a, $2a
	ld [wcc4d], a
	predef HideObject
	xor a
	ld [wJoyIgnore], a
	call PlayDefaultMusic ; reset to map music
	ld a, $12
	ld [W_OAKSLABCURSCRIPT], a
	jr .done ; 0x1ce8a $23
.asm_1ce8c
	ld a, [wcf0f]
	cp $5
	jr nz, .asm_1cea8 ; 0x1ce91 $15
	ld a, [W_XCOORD]
	cp $4
	jr nz, .asm_1cea1 ; 0x1ce98 $7
	ld a, $c
	ld [wSpriteStateData1 + 9], a
	jr .done ; 0x1ce9f $e
.asm_1cea1
	ld a, $8
	ld [wSpriteStateData1 + 9], a
	jr .done ; 0x1cea6 $7
.asm_1cea8
	cp $4
	ret nz
	xor a
	ld [wSpriteStateData1 + 9], a
.done
	ret

OaksLabScript15: ; 1ceb0 (7:4eb0)
	xor a
	ld [hJoyHeld], a
	call EnableAutoTextBoxDrawing
	ld a, $ff
	ld [wc0ee], a
	call PlaySound
	callba Music_RivalAlternateStart
	ld a, $15
	ld [$ff8c], a
	call DisplayTextID
	call OaksLabScript_1d02b
	ld a, $2a
	ld [wcc4d], a
	predef ShowObject
	ld a, [wNPCMovementDirections2Index]
	ld [wd157], a
	ld b, $0
	ld c, a
	ld hl, wNPCMovementDirections2
	ld a, $40
	call FillMemory
	ld [hl], $ff
	ld a, $1
	ld [H_SPRITEINDEX], a
	ld de, wNPCMovementDirections2
	call MoveSprite

	ld a, $10
	ld [W_OAKSLABCURSCRIPT], a
	ret

OaksLabScript_1cefd ; 1cefd (7:4efd)
	ld a, $1
	ld [H_SPRITEINDEX], a
	ld a, $4
	ld [$ff8d], a
	call SetSpriteFacingDirectionAndDelay
	ld a, $8
	ld [H_SPRITEINDEX], a
	xor a
	ld [$ff8d], a
	jp SetSpriteFacingDirectionAndDelay

OaksLabScript16: ; 1cf12 (7:4f12)
	ld a, [wd730]
	bit 0, a
	ret nz
	call EnableAutoTextBoxDrawing
	call PlayDefaultMusic
	ld a, $fc
	ld [wJoyIgnore], a
	call OaksLabScript_1cefd
	ld a, $16
	ld [$ff8c], a
	call DisplayTextID
	call DelayFrame
	call OaksLabScript_1cefd
	ld a, $17
	ld [$ff8c], a
	call DisplayTextID
	call DelayFrame
	call OaksLabScript_1cefd
	ld a, $18
	ld [$ff8c], a
	call DisplayTextID
	call DelayFrame
	ld a, $19
	ld [$ff8c], a
	call DisplayTextID
	call Delay3
	ld a, $2f
	ld [wcc4d], a
	predef HideObject
	ld a, $30
	ld [wcc4d], a
	predef HideObject
	call OaksLabScript_1cefd
	ld a, $1a
	ld [$ff8c], a
	call DisplayTextID
	ld a, $1
	ld [H_SPRITEINDEX], a
	ld a, $c
	ld [$ff8d], a
	call SetSpriteFacingDirectionAndDelay
	call Delay3
	ld a, $1b
	ld [$ff8c], a
	call DisplayTextID
	ld hl, wd74b
	set 5, [hl]
	ld hl, wd74e
	set 0, [hl]
	ld a, $1
	ld [wcc4d], a
	predef HideObject
	ld a, $2
	ld [wcc4d], a
	predef ShowObject
	ld a, [wd157]
	ld b, $0
	ld c, a
	ld hl, wNPCMovementDirections2
	xor a
	call FillMemory
	ld [hl], $ff
	ld a, $ff
	ld [wc0ee], a
	call PlaySound
	callba Music_RivalAlternateStart
	ld a, $1
	ld [H_SPRITEINDEX], a
	ld de, wNPCMovementDirections2
	call MoveSprite

	ld a, $11
	ld [W_OAKSLABCURSCRIPT], a
	ret

OaksLabScript17: ; 1cfd4 (7:4fd4)
	ld a, [wd730]
	bit 0, a
	ret nz
	call PlayDefaultMusic
	ld a, $2a
	ld [wcc4d], a
	predef HideObject
	ld hl, wd7eb
	set 0, [hl]
	res 1, [hl]
	set 7, [hl]
	ld a, $22
	ld [wcc4d], a
	predef ShowObject
	ld a, $5
	ld [W_PALLETTOWNCURSCRIPT], a
	xor a
	ld [wJoyIgnore], a

	ld a, $12
	ld [W_OAKSLABCURSCRIPT], a
	ret

OaksLabScript18: ; 1d009 (7:5009)
	ret

OaksLabScript_1d00a: ; 1d00a (7:500a)
	ld hl, wBagItems
	ld bc, $0000
.asm_1d010
	ld a, [hli]
	cp $ff
	ret z
	cp OAKS_PARCEL
	jr z, .GotParcel ; 0x1d016 $4
	inc hl
	inc c
	jr .asm_1d010 ; 0x1d01a $f4
.GotParcel
	ld hl, wNumBagItems
	ld a, c
	ld [wWhichPokemon], a
	ld a, $1
	ld [wcf96], a
	jp RemoveItemFromInventory

OaksLabScript_1d02b: ; 1d02b (7:502b)
	ld a, $7c
	ld [$ffeb], a
	ld a, $8
	ld [$ffee], a
	ld a, [W_YCOORD]
	cp $3
	jr nz, .asm_1d045 ; 0x1d038 $b
	ld a, $4
	ld [wNPCMovementDirections2Index], a
	ld a, $30
	ld b, $b
	jr .asm_1d068 ; 0x1d043 $23
.asm_1d045
	cp $1
	jr nz, .asm_1d054 ; 0x1d047 $b
	ld a, $2
	ld [wNPCMovementDirections2Index], a
	ld a, $30
	ld b, $9
	jr .asm_1d068 ; 0x1d052 $14
.asm_1d054
	ld a, $3
	ld [wNPCMovementDirections2Index], a
	ld b, $a
	ld a, [W_XCOORD]
	cp $4
	jr nz, .asm_1d066 ; 0x1d060 $4
	ld a, $40
	jr .asm_1d068 ; 0x1d064 $2
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

OaksLabScript_1d076: ; 1d076 (7:5076)
	ld hl, OaksLabTextPointers + $36 ; $50b8 ; starts at OaksLabText28
	ld a, l
	ld [W_MAPTEXTPTR], a
	ld a, h
	ld [W_MAPTEXTPTR+1], a
	ret

OaksLabTextPointers: ; 1d082 (7:5082)
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
	dw OaksLabText28
	dw OaksLabText29
	dw OaksLabText30
	dw OaksLabText31
	dw OaksLabText32
	dw OaksLabText33
	dw OaksLabText34
	dw OaksLabText35
	dw OaksLabText36
	dw OaksLabText37
	dw OaksLabText38

OaksLabText28: ; 1d0ce (7:50ce)
OaksLabText1: ; 1d0ce (7:50ce)
	db $08 ; asm
	ld a, [wd74b]
	bit 0, a
	jr nz, .asm_1d0de ; 0x1d0d4
	ld hl, OaksLabGaryText1
	call PrintText
	jr .asm_1d0f0 ; 0x1d0dc
.asm_1d0de ; 0x1d0de
	bit 2, a
	jr nz, .asm_1d0ea ; 0x1d0e0
	ld hl, OaksLabText40
	call PrintText
	jr .asm_1d0f0 ; 0x1d0e8
.asm_1d0ea ; 0x1d0ea
	ld hl, OaksLabText41
	call PrintText
.asm_1d0f0 ; 0x1d0f0
	jp TextScriptEnd

OaksLabGaryText1: ; 1d0f3 (7:50f3)
	TX_FAR _OaksLabGaryText1
	db "@"

OaksLabText40: ; 1d0f8 (7:50f8)
	TX_FAR _OaksLabText40
	db "@"

OaksLabText41: ; 1d0fd (7:50fd)
	TX_FAR _OaksLabText41
	db "@"

OaksLabText29: ; 1d102 (7:5102)
OaksLabText2: ; 1d102 (7:5102)
	db $8
	ld a, STARTER2
	ld [wWhichTrade], a
	ld a, $3
	ld [wTrainerEngageDistance], a
	ld a, STARTER1
	ld b, $2
	jr OaksLabScript_1d133 ; 0x1d111 $20

OaksLabText30: ; 1d113 (7:5113)
OaksLabText3: ; 1d113 (7:5113)
	db $8
	ld a, STARTER3
	ld [wWhichTrade], a
	ld a, $4
	ld [wTrainerEngageDistance], a
	ld a, STARTER2
	ld b, $3
	jr OaksLabScript_1d133 ; 0x1d122 $f

OaksLabText31: ; 1d124 (7:5124)
OaksLabText4: ; 1d124 (7:5124)
	db $8
	ld a, STARTER1
	ld [wWhichTrade], a
	ld a, $2
	ld [wTrainerEngageDistance], a
	ld a, STARTER3
	ld b, $4

OaksLabScript_1d133: ; 1d133 (7:5133)
	ld [wcf91], a
	ld [wd11e], a
	ld a, b
	ld [wSpriteIndex], a
	ld a, [wd74b]
	bit 2, a
	jp nz, OaksLabScript_1d22d
	bit 1, a
	jr nz, OaksLabScript_1d157 ; 0x1d147 $e
	ld hl, OaksLabText39
	call PrintText
	jp TextScriptEnd

OaksLabText39: ; 1d152 (7:5152)
	TX_FAR _OaksLabText39
	db "@"

OaksLabScript_1d157: ; 1d157 (7:5157)
	ld a, $5
	ld [H_SPRITEINDEX], a
	ld a, $9
	ld [$ff8b], a
	call GetPointerWithinSpriteStateData1
	ld [hl], $0
	; manually fixed some disassembler issues around here
	ld a, $1
	ld [H_SPRITEINDEX], a
	ld a, $9
	ld [$ff8b], a
	call GetPointerWithinSpriteStateData1
	ld [hl], $c
	ld hl, wd730
	set 6, [hl]
	predef StarterDex  ; StarterDex
	ld hl, wd730
	res 6, [hl]
	call ReloadMapData
	ld c, $a
	call DelayFrames
	ld a, [wSpriteIndex]
	cp $2
	jr z, OaksLabLookAtCharmander
	cp $3
	jr z, OaksLabLookAtSquirtle
	jr OaksLabLookAtBulbasaur

OaksLabLookAtCharmander ; 0x1d195
	ld hl, OaksLabCharmanderText
	jr OaksLabMonChoiceMenu
OaksLabCharmanderText: ; 1d19a (7:519a)
	TX_FAR _OaksLabCharmanderText
	db "@"

OaksLabLookAtSquirtle: ; 1d19f (7:519f)
	ld hl, OaksLabSquirtleText
	jr OaksLabMonChoiceMenu
OaksLabSquirtleText: ; 1d1a4 (7:51a4)
	TX_FAR _OaksLabSquirtleText
	db "@"

OaksLabLookAtBulbasaur: ; 1d1a9 (7:51a9)
	ld hl, OaksLabBulbasaurText
	jr OaksLabMonChoiceMenu
OaksLabBulbasaurText: ; 1d1ae (7:51ae)
	TX_FAR _OaksLabBulbasaurText
	db "@"

OaksLabMonChoiceMenu: ; 1d1b3 (7:51b3)
	call PrintText
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	call YesNoChoice ; yes/no menu
	ld a, [wCurrentMenuItem]
	and a
	jr nz, OaksLabMonChoiceEnd
	ld a, [wcf91]
	ld [W_PLAYERSTARTER], a
	ld [wd11e], a
	call GetMonName
	ld a, [wSpriteIndex]
	cp $2
	jr nz, asm_1d1db ; 0x1d1d5 $4
	ld a, $2b
	jr asm_1d1e5 ; 0x1d1d9 $a
asm_1d1db: ; 1d1db (7:51db)
	cp $3
	jr nz, asm_1d1e3 ; 0x1d1dd $4
	ld a, $2c
	jr asm_1d1e5 ; 0x1d1e1 $2
asm_1d1e3: ; 1d1e3 (7:51e3)
	ld a, $2d
asm_1d1e5: ; 1d1e5 (7:51e5)
	ld [wcc4d], a
	predef HideObject
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, OaksLabMonEnergeticText
	call PrintText
	ld hl, OaksLabReceivedMonText
	call PrintText
	xor a
	ld [wcc49], a
	ld a, $5
	ld [W_CURENEMYLVL], a
	ld a, [wcf91]
	ld [wd11e], a
	call AddPartyMon
	ld hl, wd72e
	set 3, [hl]
	ld a, $fc
	ld [wJoyIgnore], a
	ld a, $8
	ld [W_OAKSLABCURSCRIPT], a
OaksLabMonChoiceEnd: ; 1d21f (7:521f)
	jp TextScriptEnd

OaksLabMonEnergeticText: ; 1d222 (7:5222)
	TX_FAR _OaksLabMonEnergeticText
	db "@"

OaksLabReceivedMonText: ; 1d227 (7:5227)
	TX_FAR _OaksLabReceivedMonText
	db $11, "@"

OaksLabScript_1d22d: ; 1d22d (7:522d)
	ld a, $5
	ld [H_SPRITEINDEX], a
	ld a, $9
	ld [$ff8b], a
	call GetPointerWithinSpriteStateData1
	ld [hl], $0
	ld hl, OaksLabLastMonText
	call PrintText
	jp TextScriptEnd

OaksLabLastMonText: ; 1d243 (7:5243)
	TX_FAR _OaksLabLastMonText
	db "@"

OaksLabText32: ; 1d248 (7:5248)
OaksLabText5: ; 1d248 (7:5248)
	db $08 ; asm
	ld a, [wd747]
	bit 6, a
	jr nz, .asm_50e81 ; 0x1d24e
	ld hl, wPokedexOwned
	ld b, $13
	call CountSetBits
	ld a, [wd11e]
	cp $2
	jr c, .asm_b28b0 ; 0x1d25d
	ld a, [wd74b]
	bit 5, a
	jr z, .asm_b28b0 ; 0x1d264
.asm_50e81 ; 0x1d266
	ld hl, OaksLabText_1d31d
	call PrintText
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	predef DisplayDexRating
	jp .asm_0f042
.asm_b28b0 ; 0x1d279
	ld b,POKE_BALL
	call IsItemInBag
	jr nz, .asm_17c30 ; 0x1d27e
	ld a, [wd7eb]
	bit 5, a
	jr nz, .asm_f1adc ; 0x1d285
	ld a, [wd74b]
	bit 5, a
	jr nz, .asm_333a2 ; 0x1d28c
	bit 3, a
	jr nz, .asm_76269 ; 0x1d290
	ld a, [wd72e]
	bit 3, a
	jr nz, .asm_4a5e0 ; 0x1d297
	ld hl, OaksLabText_1d2f0
	call PrintText
	jr .asm_0f042 ; 0x1d29f
.asm_4a5e0 ; 0x1d2a1
	ld hl, OaksLabText_1d2f5
	call PrintText
	jr .asm_0f042 ; 0x1d2a7
.asm_76269 ; 0x1d2a9
	ld b, OAKS_PARCEL
	call IsItemInBag
	jr nz, .asm_a8fcf ; 0x1d2ae
	ld hl, OaksLabText_1d2fa
	call PrintText
	jr .asm_0f042 ; 0x1d2b6
.asm_a8fcf ; 0x1d2b8
	ld hl, OaksLabDeliverParcelText
	call PrintText
	call OaksLabScript_1d00a
	ld a, $f
	ld [W_OAKSLABCURSCRIPT], a
	jr .asm_0f042 ; 0x1d2c6
.asm_333a2 ; 0x1d2c8
	ld hl, OaksLabAroundWorldText
	call PrintText
	jr .asm_0f042 ; 0x1d2ce
.asm_f1adc ; 0x1d2d0
	ld hl, wd74b
	bit 4, [hl]
	set 4, [hl]
	jr nz, .asm_17c30 ; 0x1d2d7
	ld bc, (POKE_BALL << 8) | 5
	call GiveItem
	ld hl, OaksLabGivePokeballsText
	call PrintText
	jr .asm_0f042 ; 0x1d2e5
.asm_17c30 ; 0x1d2e7
	ld hl, OaksLabPleaseVisitText
	call PrintText
.asm_0f042 ; 0x1d2ed
	jp TextScriptEnd

OaksLabText_1d2f0: ; 1d2f0 (7:52f0)
	TX_FAR _OaksLabText_1d2f0
	db "@"

OaksLabText_1d2f5: ; 1d2f5 (7:52f5)
	TX_FAR _OaksLabText_1d2f5
	db "@"

OaksLabText_1d2fa: ; 1d2fa (7:52fa)
	TX_FAR _OaksLabText_1d2fa
	db "@"

OaksLabDeliverParcelText: ; 1d2ff (7:52ff)
	TX_FAR _OaksLabDeliverParcelText1
	db $11
	TX_FAR _OaksLabDeliverParcelText2
	db "@"

OaksLabAroundWorldText: ; 1d309 (7:5309)
	TX_FAR _OaksLabAroundWorldText
	db "@"

OaksLabGivePokeballsText: ; 1d30e (7:530e)
	TX_FAR _OaksLabGivePokeballsText1
	db $11
	TX_FAR _OaksLabGivePokeballsText2
	db "@"

OaksLabPleaseVisitText: ; 1d318 (7:5318)
	TX_FAR _OaksLabPleaseVisitText
	db "@"

OaksLabText_1d31d: ; 1d31d (7:531d)
	TX_FAR _OaksLabText_1d31d
	db "@"

OaksLabText34: ; 1d322 (7:5322)
OaksLabText33: ; 1d322 (7:5322)
OaksLabText7: ; 1d322 (7:5322)
OaksLabText6: ; 1d322 (7:5322)
	db $08 ; asm
	ld hl, OaksLabText_1d32c
	call PrintText
	jp TextScriptEnd

OaksLabText_1d32c: ; 1d32c (7:532c)
	TX_FAR _OaksLabText_1d32c
	db "@"

OaksLabText35: ; 1d331 (7:5331)
OaksLabText8: ; 1d331 (7:5331)
	TX_FAR _OaksLabText8
	db "@"

OaksLabText36: ; 1d336 (7:5336)
OaksLabText9: ; 1d336 (7:5336)
	db $08 ; asm
	ld hl, OaksLabText_1d340
	call PrintText
	jp TextScriptEnd

OaksLabText_1d340: ; 1d340 (7:5340)
	TX_FAR _OaksLabText_1d340
	db "@"

OaksLabText17: ; 1d345 (7:5345)
	db $8
	ld hl, OaksLabRivalWaitingText
	call PrintText
	jp TextScriptEnd

OaksLabRivalWaitingText: ; 1d34f (7:534f)
	TX_FAR _OaksLabRivalWaitingText
	db "@"

OaksLabText18: ; 1d354 (7:5354)
	db $8
	ld hl, OaksLabChooseMonText
	call PrintText
	jp TextScriptEnd

OaksLabChooseMonText: ; 1d35e (7:535e)
	TX_FAR _OaksLabChooseMonText
	db "@"

OaksLabText19: ; 1d363 (7:5363)
	db $8
	ld hl, OaksLabRivalInterjectionText
	call PrintText
	jp TextScriptEnd

OaksLabRivalInterjectionText: ; 1d36d (7:536d)
	TX_FAR _OaksLabRivalInterjectionText
	db "@"

OaksLabText20: ; 1d372 (7:5372)
	db $8
	ld hl, OaksLabBePatientText
	call PrintText
	jp TextScriptEnd

OaksLabBePatientText: ; 1d37c (7:537c)
	TX_FAR _OaksLabBePatientText
	db "@"

OaksLabText12: ; 1d381 (7:5381)
	db $8
	ld hl, OaksLabLeavingText
	call PrintText
	jp TextScriptEnd

OaksLabLeavingText: ; 1d38b (7:538b)
	TX_FAR _OaksLabLeavingText
	db "@"

OaksLabText13: ; 1d390 (7:5390)
	db $8
	ld hl, OaksLabRivalPickingMonText
	call PrintText
	jp TextScriptEnd

OaksLabRivalPickingMonText: ; 1d39a (7:539a)
	TX_FAR _OaksLabRivalPickingMonText
	db "@"

OaksLabText14: ; 1d39f (7:539f)
	db $8
	ld hl, OaksLabRivalReceivedMonText
	call PrintText
	jp TextScriptEnd

OaksLabRivalReceivedMonText: ; 1d3a9 (7:53a9)
	TX_FAR _OaksLabRivalReceivedMonText
	db $11, "@"

OaksLabText15: ; 1d3af (7:53af)
	db $8
	ld hl, OaksLabRivalChallengeText
	call PrintText
	jp TextScriptEnd

OaksLabRivalChallengeText: ; 1d3b9 (7:53b9)
	TX_FAR _OaksLabRivalChallengeText
	db "@"

OaksLabText_1d3be: ; 1d3be (7:53be)
	TX_FAR _OaksLabText_1d3be
	db "@"

OaksLabText_1d3c3: ; 1d3c3 (7:53c3)
	TX_FAR _OaksLabText_1d3c3
	db "@"

OaksLabText16: ; 1d3c8 (7:53c8)
	db $8
	ld hl, OaksLabRivalToughenUpText
	call PrintText
	jp TextScriptEnd

OaksLabRivalToughenUpText: ; 1d3d2 (7:53d2)
	TX_FAR _OaksLabRivalToughenUpText
	db "@"

OaksLabText21: ; 1d3d7 (7:53d7)
	TX_FAR _OaksLabText21
	db "@"

OaksLabText22: ; 1d3dc (7:53dc)
	TX_FAR _OaksLabText22
	db "@"

OaksLabText23: ; 1d3e1 (7:53e1)
	TX_FAR _OaksLabText23
	db "@"

OaksLabText24: ; 1d3e6 (7:53e6)
	TX_FAR _OaksLabText24
	db "@"

OaksLabText25: ; 1d3eb (7:53eb)
	TX_FAR _OaksLabText25
	db $11, "@"

OaksLabText26: ; 1d3f1 (7:53f1)
	TX_FAR _OaksLabText26
	db "@"

OaksLabText27: ; 1d3f6 (7:53f6)
	TX_FAR _OaksLabText27
	db "@"

OaksLabText38: ; 1d3fb (7:53fb)
OaksLabText37: ; 1d3fb (7:53fb)
OaksLabText11: ; 1d3fb (7:53fb)
OaksLabText10: ; 1d3fb (7:53fb)
	db $08 ; asm
	ld hl, OaksLabText_1d405
	call PrintText
	jp TextScriptEnd

OaksLabText_1d405: ; 1d405 (7:5405)
	TX_FAR _OaksLabText_1d405
	db "@"
