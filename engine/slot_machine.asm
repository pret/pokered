PromptUserToPlaySlots: ; 3730e (d:730e)
	call SaveScreenTilesToBuffer2
	ld a, BANK(DisplayTextIDInit)
	ld [wAutoTextBoxDrawingControl], a
	ld b, a
	ld hl, DisplayTextIDInit
	call Bankswitch
	ld hl, PlaySlotMachineText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .skip
	dec a
	ld [wUpdateSpritesEnabled], a
	ld hl, wcd4f
	xor a
	ld [hli], a
	ld [hl], $2
	predef EmotionBubble
	call GBPalWhiteOutWithDelay3
	call LoadSlotMachineTiles
	call LoadFontTilePatterns
	ld b, $5
	call GoPAL_SET
	call GBPalNormal
	ld a, $e4
	ld [$ff48], a
	ld hl, wd730
	set 6, [hl]
	xor a
	ld [W_SUBANIMSUBENTRYADDR], a
	ld hl, wTrainerSpriteOffset
	ld bc, $0014
	call FillMemory
	call MainSlotMachineLoop
	ld hl, wd730
	res 6, [hl]
	xor a
	ld [W_SUBANIMSUBENTRYADDR], a
	call GBPalWhiteOutWithDelay3
	ld a, $1
	ld [wUpdateSpritesEnabled], a
	call GoPAL_SET_CF1C
	call ReloadMapSpriteTilePatterns
	call ReloadTilesetTilePatterns
.skip
	call LoadScreenTilesFromBuffer2
	call Delay3
	call GBPalNormal
	ld a, [wcc5e]
	push af
	jp CloseTextDisplay

PlaySlotMachineText: ; 37390 (d:7390)
	TX_FAR _PlaySlotMachineText
	db "@"

MainSlotMachineLoop: ; 37395 (d:7395)
	call SlotMachine_37754
	xor a
	ld hl, wcd4a
	ld [hli], a
	ld [hl], a
	call SlotMachine_3775f
	ld hl, BetHowManySlotMachineText
	call PrintText
	call SaveScreenTilesToBuffer1
.loop
	ld a, $3
	ld [wMenuWatchedKeys], a
	ld a, $2
	ld [wMaxMenuItem], a
	ld a, $c
	ld [wTopMenuItemY], a
	ld a, $f
	ld [wTopMenuItemX], a
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld [wcc37], a
	ld hl, wTileMap + $ea
	ld b, $5
	ld c, $4
	call TextBoxBorder
	ld hl, wTileMap + $100
	ld de, CoinMultiplierSlotMachineText
	call PlaceString
	call HandleMenuInput
	and $2
	jp nz, LoadScreenTilesFromBuffer1
	ld a, [wCurrentMenuItem]
	ld b, a
	ld a, $3
	sub b
	ld [wcd50], a
	ld hl, wPlayerCoins
	ld c, a
	ld a, [hli]
	and a
	jr nz, .skip1
	ld a, [hl]
	cp c
	jr nc, .skip1
	ld hl, NotEnoughCoinsSlotMachineText
	call PrintText
	jr .loop
.skip1
	call LoadScreenTilesFromBuffer1
	call SlotMachine_37741
	call SlotMachine_377d5
	call SlotMachine_37480
	ld a, $4
	ld hl, wcd4d
	ld [hli], a
	ld [hli], a
	ld [hl], a
	call WaitForSoundToFinish
	ld a, (SFX_1f_66 - SFX_Headers_1f) / 3
	call PlaySound
	ld hl, StartSlotMachineText
	call PrintText
	call SlotMachine_374ad
	call SlotMachine_37588
	ld hl, wPlayerCoins
	ld a, [hli]
	or [hl]
	jr nz, .skip2
	ld hl, OutOfCoinsSlotMachineText
	call PrintText
	ld c, $3c
	jp DelayFrames
.skip2
	ld hl, OneMoreGoSlotMachineText
	call PrintText
	ld hl, wTileMap + $fe
	ld bc, $0d0f
	xor a
	ld [wd12c], a
	ld a, $14
	ld [wd125], a
	call DisplayTextBoxID
	ld a, [wCurrentMenuItem]
	and a
	ret nz
	call SlotMachine_377ce
	jp MainSlotMachineLoop

CoinMultiplierSlotMachineText: ; 3745e (d:745e)
	db   "×3"
	next "×2"
	next "×1@"

OutOfCoinsSlotMachineText: ; 37467 (d:7467)
	TX_FAR _OutOfCoinsSlotMachineText
	db "@"

BetHowManySlotMachineText: ; 3746c (d:746c)
	TX_FAR _BetHowManySlotMachineText
	db "@"

StartSlotMachineText: ; 37471 (d:7471)
	TX_FAR _StartSlotMachineText
	db "@"

NotEnoughCoinsSlotMachineText: ; 37476 (d:7476)
	TX_FAR _NotEnoughCoinsSlotMachineText
	db "@"

OneMoreGoSlotMachineText: ; 3747b (d:747b)
	TX_FAR _OneMoreGoSlotMachineText
	db "@"

SlotMachine_37480: ; 37480 (d:7480)
	ld hl, wcd4c
	bit 7, [hl]
	ret nz
	ld a, [W_SUBANIMSUBENTRYADDR]
	and a
	jr nz, .skip1
	call Random
	and a
	jr z, .skip2
	ld b, a
	ld a, [wcc5b]
	cp b
	jr c, .skip3
	ld a, $d2
	cp b
	jr c, .skip1
	ld [hl], $0
	ret
.skip1
	set 6, [hl]
	ret
.skip2
	ld a, $3c
	ld [W_SUBANIMSUBENTRYADDR], a
	ret
.skip3
	set 7, [hl]
	ret

SlotMachine_374ad: ; 374ad (d:74ad)
	ld c, $14
.loop1
	push bc
	call SlotMachine_37813
	call SlotMachine_37823
	call SlotMachine_37833
	ld c, $2
	call DelayFrames
	pop bc
	dec c
	jr nz, .loop1
	xor a
	ld [wTrainerSpriteOffset], a
.loop2
	call SlotMachine_37882
	call SlotMachine_374df
	call SlotMachine_374fb
	call SlotMachine_37517
	ret c
	ld a, [wOnSGB]
	xor $1
	inc a
	ld c, a
	call DelayFrames
	jr .loop2

SlotMachine_374df: ; 374df (d:74df)
	ld a, [wTrainerSpriteOffset]
	cp $1
	jr c, .skip
	ld de, wTrainerEngageDistance
	ld a, [de]
	rra
	jr nc, .skip
	ld hl, wcd4d
	ld a, [hl]
	and a
	ret z
	dec [hl]
	call SlotMachine_3752c
	ret nz
.skip
	jp SlotMachine_37813

SlotMachine_374fb: ; 374fb (d:74fb)
	ld a, [wTrainerSpriteOffset]
	cp $2
	jr c, .skip
	ld de, wTrainerFacingDirection
	ld a, [de]
	rra
	jr nc, .skip
	ld hl, wcd4e
	ld a, [hl]
	and a
	ret z
	dec [hl]
	call SlotMachine_37552
	ret z
.skip
	jp SlotMachine_37823

SlotMachine_37517: ; 37517 (d:7517)
	ld a, [wTrainerSpriteOffset]
	cp $3
	jr c, .skip
	ld de, wTrainerScreenY
	ld a, [de]
	rra
	jr nc, .skip
	scf
	ret
.skip
	call SlotMachine_37833
	and a
	ret

SlotMachine_3752c: ; 3752c (d:752c)
	call SlotMachine_GetWheelOneTile
	ld hl, wTrainerScreenX
	ld a, [wcd4c]
	and $80
	jr nz, .skip1
	inc hl
	ld a, [hl]
	cp $a
	jr nz, .skip2
	ret
.skip1
	ld c, $3
.loop
	ld a, [hli]
	cp $2
	jr c, .skip2
	dec c
	jr nz, .loop
	ret
.skip2
	inc a
	ld hl, wcd4d
	ld [hl], $0
	ret

SlotMachine_37552: ; 37552 (d:7552)
	call SlotMachine_GetWheelTwoTile
	ld a, [wcd4c]
	and $80
	jr nz, .skip1
	call SlotMachine_3756e
	ret nz
	jr .skip2
.skip1
	call SlotMachine_3756e
	ld a, [de]
	cp $7
	ret nc
.skip2
	xor a
	ld [wcd4e], a
	ret

SlotMachine_3756e: ; 3756e (d:756e)
	ld hl, wTrainerScreenX
	ld de, wcd44
	ld a, [de]
	cp [hl]
	ret z
	inc de
	ld a, [de]
	cp [hl]
	ret z
	inc hl
	cp [hl]
	ret z
	inc hl
	cp [hl]
	ret z
	inc de
	ld a, [de]
	cp [hl]
	ret z
	dec de
	dec de
	ret

SlotMachine_37588: ; 37588 (d:7588)
	call SlotMachine_GetWheelThreeTile
	ld a, [wcd50]
	cp $2
	jr z, .skip1
	cp $1
	jr z, .skip2
	ld hl, wTrainerScreenX
	ld de, wcd45
	ld bc, wcd49
	call SlotMachine_CheckForMatch
	jp z, .skip5
	ld hl, wcd43
	ld de, wcd45
	ld bc, wcd47
	call SlotMachine_CheckForMatch
	jr z, .skip5
.skip1
	ld hl, wcd43
	ld de, wcd46
	ld bc, wcd49
	call SlotMachine_CheckForMatch
	jr z, .skip5
	ld hl, wTrainerScreenX
	ld de, wcd44
	ld bc, wcd47
	call SlotMachine_CheckForMatch
	jr z, .skip5
.skip2
	ld hl, wcd42
	ld de, wcd45
	ld bc, wcd48
	call SlotMachine_CheckForMatch
	jr z, .skip5
	ld a, [wcd4c]
	and $c0
	jr z, .skip3
	ld hl, wcd4f
	dec [hl]
	jr nz, .skip4
.skip3
	ld hl, NotThisTimeText
	call PrintText
.loop
	xor a
	ld [wc002], a
	ret
.skip4
	call SlotMachine_37833
	call DelayFrame
	call SlotMachine_37833
	call DelayFrame
	jp SlotMachine_37588
.skip5
	ld a, [wcd4c]
	and $c0
	jr z, .skip4
	and $80
	jr nz, .skip6
	ld a, [hl]
	cp $7
	jr c, .skip4
.skip6
	ld a, [hl]
	sub $2
	ld [wTrainerScreenX], a
	ld hl, SlotRewardPointers
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wcf4b
	ld bc, $0004
	call CopyData
	pop hl
	ld de, .asm_37638
	push de
	jp [hl]

.asm_37638
	ld a, [$ff47]
	xor $40
	ld [$ff47], a
	ld c, $5
	call DelayFrames
	dec b
	jr nz, .asm_37638
	ld hl, wcd4a
	ld [hl], d
	inc hl
	ld [hl], e
	call SlotMachine_3775f
	ld hl, SlotsMachineText_37665
	call PrintText
	call WaitForTextScrollButtonPress
	call SlotMachine_3776b
	call SlotMachine_3775f
	ld a, $e4
	ld [$ff48], a
	jp .loop

SlotsMachineText_37665: ; 37665 (d:7665)
	db $08 ; asm
	push bc
	call SlotMachine_37728
	ld hl, LinedUpText
	pop bc
	inc bc
	inc bc
	inc bc
	inc bc
	ret

LinedUpText: ; 37673 (d:7673)
	TX_FAR _LinedUpText
	db "@"

SlotRewardPointers: ; 37678 (d:7678)
	dw SlotReward300Func
	dw SlotReward300Text
	dw SlotReward100Func
	dw SlotReward100Text
	dw SlotReward8Func
	dw SlotReward8Text
	dw SlotReward15Func
	dw SlotReward15Text
	dw SlotReward15Func
	dw SlotReward15Text
	dw SlotReward15Func
	dw SlotReward15Text

SlotReward300Text: ; 37690 (d:7690)
	db "300@"

SlotReward100Text: ; 37694 (d:7694)
	db "100@"

SlotReward8Text: ; 37698 (d:7698)
	db "8@"

SlotReward15Text: ; 3769a (d:769a)
	db "15@"

NotThisTimeText: ; 3769d (d:769d)
	TX_FAR _NotThisTimeText
	db "@"

; compares the slot machine tiles at bc, de, and hl
SlotMachine_CheckForMatch: ; 376a2 (d:76a2)
	ld a, [de]
	cp [hl]
	ret nz
	ld a, [bc]
	cp [hl]
	ret

SlotMachine_GetWheelThreeTile: ; 376a8 (d:76a8)
	ld de, wcd47
	ld hl, SlotMachineWheel3
	ld a, [wTrainerScreenY]
	call SlotMachine_GetWheelTile

SlotMachine_GetWheelTwoTile: ; 376b4 (d:76b4)
	ld de, wcd44
	ld hl, SlotMachineWheel2
	ld a, [wTrainerFacingDirection]
	call SlotMachine_GetWheelTile

SlotMachine_GetWheelOneTile: ; 376c0 (d:76c0)
	ld de, wTrainerScreenX
	ld hl, SlotMachineWheel1
	ld a, [wTrainerEngageDistance]

SlotMachine_GetWheelTile: ; 376c9 (d:76c9)
	ld c, a
	ld b, $0
	add hl, bc
	ld c, $3
.loop
	ld a, [hli]
	ld [de], a
	inc de
	inc hl
	dec c
	jr nz, .loop
	ret

SlotReward8Func: ; 376d7 (d:76d7)
	ld hl, W_SUBANIMSUBENTRYADDR
	ld a, [hl]
	and a
	jr z, .skip
	dec [hl]
.skip
	ld b, $2
	ld de, 8
	ret

SlotReward15Func: ; 376e5 (d:76e5)
	ld hl, W_SUBANIMSUBENTRYADDR
	ld a, [hl]
	and a
	jr z, .skip
	dec [hl]
.skip
	ld b, $4
	ld de, 15
	ret

SlotReward100Func: ; 376f3 (d:76f3)
	ld a, (SFX_1f_42 - SFX_Headers_1f) / 3
	call PlaySound
	xor a
	ld [wcd4c], a
	ld b, $8
	ld de, 100
	ret

SlotReward300Func: ; 37702 (d:7702)
	ld hl, YeahText
	call PrintText
	ld a, (SFX_1f_3b - SFX_Headers_1f) / 3
	call PlaySound
	call Random
	cp $80
	ld a, $0
	jr c, .skip
	ld [wcd4c], a
.skip
	ld [W_SUBANIMSUBENTRYADDR], a
	ld b, $14
	ld de, 300
	ret

YeahText: ; 37722 (d:7722)
	TX_FAR _YeahText
	db $0a, "@"

SlotMachine_37728: ; 37728 (d:7728)
	ld hl, wTileMap + $11a
	ld a, [wTrainerScreenX]
	add $25
	ld [hli], a
	inc a
	ld [hld], a
	inc a
	ld de, $ffec
	add hl, de
	ld [hli], a
	inc a
	ld [hl], a
	ld hl, wTileMap + $152
	ld [hl], $ee
	ret

SlotMachine_37741: ; 37741 (d:7741)
	ld hl, wcd4b
	ld a, [wcd50]
	ld [hld], a
	xor a
	ld [hli], a
	ld de, wPlayerCoins + 1
	ld c, $2
	predef SubBCDPredef

SlotMachine_37754: ; 37754 (d:7754)
	ld hl, wTileMap + $19
	ld de, wPlayerCoins
	ld c, $2
	jp PrintBCDNumber

SlotMachine_3775f: ; 3775f (d:775f)
	ld hl, wTileMap + $1f
	ld de, wcd4a
	ld bc, $8204
	jp PrintNumber

SlotMachine_3776b: ; 3776b (d:776b)
	ld a, $1
	ld [wc002], a
	call WaitForSoundToFinish
	ld hl, wcd46
	xor a
	ld [hli], a
	inc a
	ld [hl], a
	ld a, $5
	ld [W_SUBANIMTRANSFORM], a
.loop
	ld a, [wcd4b]
	ld l, a
	ld a, [wcd4a]
	ld h, a
	or l
	ret z
	ld de, $ffff
	add hl, de
	ld a, l
	ld [wcd4b], a
	ld a, h
	ld [wcd4a], a
	ld hl, wcd47
	ld de, wPlayerCoins + 1
	ld c, $2
	predef AddBCDPredef
	call SlotMachine_37754
	call SlotMachine_3775f
	ld a, (SFX_1f_65 - SFX_Headers_1f) / 3
	call PlaySound
	ld a, [W_SUBANIMTRANSFORM]
	dec a
	jr nz, .skip1
	ld a, [$ff48]
	xor $40
	ld [$ff48], a
	ld a, $5
.skip1
	ld [W_SUBANIMTRANSFORM], a
	ld a, [wTrainerScreenX]
	cp $7
	ld c, $8
	jr nc, .skip2
	srl c
.skip2
	call DelayFrames
	jr .loop

SlotMachine_377ce: ; 377ce (d:77ce)
	ld a, $23
	ld [wd08a], a
	jr SlotMachine_377e3

SlotMachine_377d5: ; 377d5 (d:77d5)
	ld a, $14
	ld [wd08a], a
	ld a, [wcd50]
	dec a
	jr z, SlotMachine_377fb
	dec a
	jr z, SlotMachine_377ef

SlotMachine_377e3: ; 377e3 (d:77e3)
	ld hl, wTileMap + $2b
	call SlotMachine_377fe
	ld hl, wTileMap + $cb
	call SlotMachine_377fe

SlotMachine_377ef: ; 377ef (d:77ef)
	ld hl, wTileMap + $53
	call SlotMachine_377fe
	ld hl, wTileMap + $a3
	call SlotMachine_377fe

SlotMachine_377fb: ; 377fb (d:77fb)
	ld hl, wTileMap + $7b

SlotMachine_377fe: ; 377fe (d:77fe)
	ld a, [wd08a]
	ld [hl], a
	ld bc, $000d
	add hl, bc
	ld [hl], a
	ld bc, $0007
	add hl, bc
	inc a
	ld [hl], a
	ld bc, $000d
	add hl, bc
	ld [hl], a
	ret

SlotMachine_37813: ; 37813 (d:7813)
	ld bc, SlotMachineWheel1
	ld de, wTrainerEngageDistance
	ld hl, wOAMBuffer
	ld a, $30
	ld [W_BASECOORDX], a
	jr SlotMachine_37841

SlotMachine_37823: ; 37823 (d:7823)
	ld bc, SlotMachineWheel2
	ld de, wTrainerFacingDirection
	ld hl, wOAMBuffer + $30
	ld a, $50
	ld [W_BASECOORDX], a
	jr SlotMachine_37841

SlotMachine_37833: ; 37833 (d:7833)
	ld bc, SlotMachineWheel3
	ld de, wTrainerScreenY
	ld hl, wOAMBuffer + $60
	ld a, $70
	ld [W_BASECOORDX], a

SlotMachine_37841: ; 37841 (d:7841)
	ld a, $58
	ld [W_BASECOORDY], a
	push de
	ld a, [de]
	ld d, b
	add c
	ld e, a
	jr nc, SlotMachine_3784e
	inc d

SlotMachine_3784e: ; 3784e (d:784e)
	ld a, [W_BASECOORDY]
	ld [hli], a
	ld a, [W_BASECOORDX]
	ld [hli], a
	ld a, [de]
	ld [hli], a
	ld a, $80
	ld [hli], a
	ld a, [W_BASECOORDY]
	ld [hli], a
	ld a, [W_BASECOORDX]
	add $8
	ld [hli], a
	ld a, [de]
	inc a
	ld [hli], a
	ld a, $80
	ld [hli], a
	inc de
	ld a, [W_BASECOORDY]
	sub $8
	ld [W_BASECOORDY], a
	cp $28
	jr nz, SlotMachine_3784e
	pop de
	ld a, [de]
	inc a
	cp $1e
	jr nz, .skip
	xor a
.skip
	ld [de], a
	ret

SlotMachine_37882: ; 37882 (d:7882)
	call DelayFrame
	call JoypadLowSensitivity
	ld a, [hJoy5]
	and $1
	ret z
	ld hl, wTrainerSpriteOffset
	ld a, [hl]
	dec a
	ld de, wcd4d
	jr z, .skip
	dec a
	ld de, wcd4e
	jr z, .skip
.loop
	inc [hl]
	ld a, (SFX_1f_64 - SFX_Headers_1f) / 3
	jp PlaySound
.skip
	ld a, [de]
	and a
	ret nz
	jr .loop

LoadSlotMachineTiles: ; 378a8 (d:78a8)
	call DisableLCD
	ld hl, SlotMachineTiles2
	ld de, vChars0
	ld bc, $1c0
	ld a, BANK(SlotMachineTiles2)
	call FarCopyData2
	ld hl, SlotMachineTiles1
	ld de, vChars2
	ld bc, $250
	ld a, BANK(SlotMachineTiles1)
	call FarCopyData2
	ld hl, SlotMachineTiles2
	ld de, vChars2 + $250
	ld bc, $1c0
	ld a, BANK(SlotMachineTiles2)
	call FarCopyData2
	ld hl, SlotMachineMap
	ld de, wTileMap
	ld bc, $00f0
	call CopyData
	call EnableLCD
	ld hl, wTrainerEngageDistance
	ld a, $1c
	ld [hli], a
	ld [hli], a
	ld [hl], a
	call SlotMachine_37813
	call SlotMachine_37823
	jp SlotMachine_37833

SlotMachineMap: ; 378f5 (d:78f5)
	INCBIN "gfx/tilemaps/slotmachine.map"

SLOTS7		EQU $0200
SLOTSBAR	EQU $0604
SLOTSCHERRY	EQU $0A08
SLOTSFISH	EQU $0E0C
SLOTSBIRD	EQU $1210
SLOTSMOUSE	EQU $1614

INCLUDE "data/slot_machine_wheels.asm"

SlotMachineTiles1: ; 37a51 (d:7a51)
IF _RED
	INCBIN "gfx/red/slotmachine1.2bpp"
ENDC
IF _BLUE
	INCBIN "gfx/blue/slotmachine1.2bpp"
ENDC
