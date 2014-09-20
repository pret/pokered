PlayerStepOutFromDoor: ; 1a3e0 (6:63e0)
	ld hl, wd730
	res 1, [hl]
	call IsPlayerStandingOnDoorTile
	jr nc, .notStandingOnDoor
	ld a, $fc
	ld [wJoyIgnore], a
	ld hl, wd736
	set 1, [hl]
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, D_DOWN
	ld [wSimulatedJoypadStatesEnd], a
	xor a
	ld [wSpriteStateData1 + 2], a
	call StartSimulatingJoypadStates
	ret
.notStandingOnDoor
	xor a
	ld [wWastedByteCD3A], a
	ld [wSimulatedJoypadStatesIndex], a
	ld [wSimulatedJoypadStatesEnd], a
	ld hl, wd736
	res 0, [hl]
	res 1, [hl]
	ld hl, wd730
	res 7, [hl]
	ret

_EndNPCMovementScript: ; 1a41d (6:641d)
	ld hl, wd730
	res 7, [hl]
	ld hl, wd72e
	res 7, [hl]
	ld hl, wd736
	res 0, [hl]
	res 1, [hl]
	xor a
	ld [wNPCMovementScriptSpriteOffset], a
	ld [wNPCMovementScriptPointerTableNum], a
	ld [wNPCMovementScriptFunctionNum], a
	ld [wWastedByteCD3A], a
	ld [wSimulatedJoypadStatesIndex], a
	ld [wSimulatedJoypadStatesEnd], a
	ret

ProfOakMovementScriptPointerTable: ; 1a442 (6:6442)
	dw Func_1a44c
	dw Func_1a485
	dw Func_1a4a1
	dw Func_1a4a6
	dw Func_1a4f4

Func_1a44c: ; 1a44c (6:644c)
	ld a, [W_XCOORD] ; wd362
	sub $a
	ld [wcca1], a
	jr z, .asm_1a475
	ld b, $0
	ld c, a
	ld hl, wNPCMovementDirections2
	ld a, $80
	call FillMemory
	ld [hl], $ff
	ld a, [wSpriteIndex]
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	ld de, wNPCMovementDirections2
	call MoveSprite
	ld a, $1
	ld [wNPCMovementScriptFunctionNum], a
	jr .asm_1a47a
.asm_1a475
	ld a, $3
	ld [wNPCMovementScriptFunctionNum], a
.asm_1a47a
	ld hl, W_FLAGS_D733
	set 1, [hl]
	ld a, $fc
	ld [wJoyIgnore], a
	ret

Func_1a485: ; 1a485 (6:6485)
	ld a, [wd730]
	bit 0, a
	ret nz
	ld a, [wcca1]
	ld [wSimulatedJoypadStatesIndex], a
	ld [$ff95], a
	predef ConvertNPCMovementDirectionsToJoypadMasks
	call StartSimulatingJoypadStates
	ld a, $2
	ld [wNPCMovementScriptFunctionNum], a
	ret

Func_1a4a1: ; 1a4a1 (6:64a1)
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz

Func_1a4a6: ; 1a4a6 (6:64a6)
	xor a
	ld [wOverrideSimulatedJoypadStatesMask], a
	ld a, [wSpriteIndex]
	swap a
	ld [wNPCMovementScriptSpriteOffset], a
	xor a
	ld [wSpriteStateData2 + $06], a
	ld hl, wSimulatedJoypadStatesEnd
	ld de, RLEList_PlayerWalkToLab
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	ld hl, wNPCMovementDirections2
	ld de, RLEList_ProfOakWalkToLab
	call DecodeRLEList
	ld hl, wd72e
	res 7, [hl]
	ld hl, wd730
	set 7, [hl]
	ld a, $4
	ld [wNPCMovementScriptFunctionNum], a
	ret

RLEList_ProfOakWalkToLab: ; 1a4dc (6:64dc)
	db $00, $05
	db $80, $01
	db $00, $05
	db $C0, $03
	db $40, $01
	db $E0, $01
	db $FF

RLEList_PlayerWalkToLab: ; 1a4e9 (6:64e9)
	db D_UP, $02
	db D_RIGHT, $03
	db D_DOWN, $05
	db D_LEFT, $01
	db D_DOWN, $06
	db $FF

Func_1a4f4: ; 1a4f4 (6:64f4)
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld a, $0
	ld [wcc4d], a
	predef HideObject
	ld hl, wd730
	res 7, [hl]
	ld hl, wd72e
	res 7, [hl]
	jp EndNPCMovementScript

PewterMuseumGuyMovementScriptPointerTable: ; 1a510 (6:6510)
	dw Func_1a514
	dw PewterMovementScriptDone

Func_1a514: ; 1a514 (6:6514)
	ld a, BANK(Music_MuseumGuy)
	ld [wc0ef], a
	ld [wc0f0], a
	ld a, MUSIC_MUSEUM_GUY
	ld [wc0ee], a
	call PlaySound
	ld a, [wSpriteIndex]
	swap a
	ld [wNPCMovementScriptSpriteOffset], a
	call StartSimulatingJoypadStates
	ld hl, wSimulatedJoypadStatesEnd
	ld de, RLEList_PewterMuseumPlayer
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	xor a
	ld [wd12f], a
	predef PewterGuys
	ld hl, wNPCMovementDirections2
	ld de, RLEList_PewterMuseumGuy
	call DecodeRLEList
	ld hl, wd72e
	res 7, [hl]
	ld a, $1
	ld [wNPCMovementScriptFunctionNum], a
	ret

RLEList_PewterMuseumPlayer: ; 1a559 (6:6559)
	db 0, $01
	db D_UP, $03
	db D_LEFT, $0D
	db D_UP, $06
	db $FF

RLEList_PewterMuseumGuy: ; 1a562 (6:6562)
	db $40, $06
	db $80, $0D
	db $40, $03
	db $80, $01
	db $FF

PewterMovementScriptDone: ; 1a56b (6:656b)
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld hl, wd730
	res 7, [hl]
	ld hl, wd72e
	res 7, [hl]
	jp EndNPCMovementScript

PewterGymGuyMovementScriptPointerTable: ; 1a57d (6:657d)
	dw Func_1a581
	dw PewterMovementScriptDone

Func_1a581: ; 1a581 (6:6581)
	ld a, BANK(Music_MuseumGuy)
	ld [wc0ef], a
	ld [wc0f0], a
	ld a, MUSIC_MUSEUM_GUY
	ld [wc0ee], a
	call PlaySound
	ld a, [wSpriteIndex]
	swap a
	ld [wNPCMovementScriptSpriteOffset], a
	xor a
	ld [wSpriteStateData2 + $06], a
	ld hl, wSimulatedJoypadStatesEnd
	ld de, RLEList_PewterGymPlayer
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	ld a, $1
	ld [wd12f], a
	predef PewterGuys
	ld hl, wNPCMovementDirections2
	ld de, RLEList_PewterGymGuy
	call DecodeRLEList
	ld hl, wd72e
	res 7, [hl]
	ld hl, wd730
	set 7, [hl]
	ld a, $1
	ld [wNPCMovementScriptFunctionNum], a
	ret

RLEList_PewterGymPlayer: ; 1a5cd (6:65cd)
	db 0, $01
	db D_RIGHT, $02
	db D_DOWN, $05
	db D_LEFT, $0B
	db D_UP, $05
	db D_LEFT, $0F
	db $FF

RLEList_PewterGymGuy: ; 1a5da (6:65da)
	db $00, $02
	db $80, $0F
	db $40, $05
	db $80, $0B
	db $00, $05
	db $C0, $03
	db $FF

FreezeEnemyTrainerSprite: ; 1a5e7 (6:65e7)
	ld a, [W_CURMAP]
	cp POKEMONTOWER_7
	ret z ; the Rockets on Pokemon Tower 7F leave after battling, so don't freeze them
	ld hl, RivalIDs
	ld a, [wEngagedTrainerClass]
	ld b, a
.loop
	ld a, [hli]
	cp $ff
	jr z, .notRival
	cp b
	ret z ; the rival leaves after battling, so don't freeze him
	jr .loop
.notRival
	ld a, [wSpriteIndex]
	ld [H_SPRITEINDEX], a
	jp SetSpriteMovementBytesToFF

RivalIDs: ; 1a605 (6:6605)
	db SONY1 + $c8
	db SONY2 + $c8
	db SONY3 + $c8
	db $ff
