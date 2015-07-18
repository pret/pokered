VermilionDockScript: ; 1db52 (7:5b52)
	call EnableAutoTextBoxDrawing
	ld hl, wd803
	bit 4, [hl]
	jr nz, .asm_1db8d
	bit 0, [hl]
	ret z
	ld a, [wDestinationWarpID]
	cp $1
	ret nz
	bit 2, [hl]
	jp z, VermilionDock_1db9b
	set 4, [hl]
	call Delay3
	ld hl, wd730
	set 7, [hl]
	ld hl, wSimulatedJoypadStatesEnd
	ld a, $40
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, $3
	ld [wSimulatedJoypadStatesIndex], a
	xor a
	ld [wSpriteStateData2 + $06], a
	ld [wOverrideSimulatedJoypadStatesMask], a
	dec a
	ld [wJoyIgnore], a
	ret
.asm_1db8d
	bit 5, [hl]
	ret nz
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld [wJoyIgnore], a
	set 5, [hl]
	ret

VermilionDock_1db9b: ; 1db9b (7:5b9b)
	set 2, [hl]
	ld a, $ff
	ld [wJoyIgnore], a
	ld [wc0ee], a
	call PlaySound
	ld c, BANK(Music_Surfing)
	ld a, MUSIC_SURFING
	call PlayMusic
	callba LoadSmokeTileFourTimes
	xor a
	ld [wSpriteStateData1 + 2], a
	ld c, 120
	call DelayFrames
	ld b, $9c
	call CopyScreenTileBufferToVRAM
	coord hl, 0, 10
	ld bc, $0078
	ld a, $14
	call FillMemory
	ld a, $1
	ld [$ffba], a
	call Delay3
	xor a
	ld [$ffba], a
	ld [wWhichTrade], a
	ld [$ff49], a
	ld a, $58
	ld [wTrainerEngageDistance], a
	ld hl, wMapViewVRAMPointer
	ld c, [hl]
	inc hl
	ld b, [hl]
	push bc
	push hl
	ld a, (SFX_02_54 - SFX_Headers_02) / 3
	call PlaySoundWaitForCurrent
	ld a, $ff
	ld [wUpdateSpritesEnabled], a
	ld d, $0
	ld e, $8
.asm_1dbfa
	ld hl, $0002
	add hl, bc
	ld a, l
	ld [wMapViewVRAMPointer], a
	ld a, h
	ld [wMapViewVRAMPointer + 1], a
	push hl
	push de
	call ScheduleEastColumnRedraw
	call VermilionDock_1dc59
	pop de
	ld b, $10
.asm_1dc11
	call VermilionDock_1dc42
	ld c, $8
.asm_1dc16
	call VermilionDock_1dc7c
	dec c
	jr nz, .asm_1dc16
	inc d
	dec b
	jr nz, .asm_1dc11
	pop bc
	dec e
	jr nz, .asm_1dbfa
	xor a
	ld [$ff4a], a
	ld [hWY], a
	call VermilionDock_1dc94
	ld a, $90
	ld [hWY], a
	ld a, $1
	ld [wUpdateSpritesEnabled], a
	pop hl
	pop bc
	ld [hl], b
	dec hl
	ld [hl], c
	call LoadPlayerSpriteGraphics
	ld hl, wNumberOfWarps
	dec [hl]
	ret

VermilionDock_1dc42: ; 1dc42 (7:5c42)
	push bc
	push de
	ld hl, wOAMBuffer + $11
	ld a, [wWhichTrade]
	swap a
	ld c, a
	ld de, $0004
.asm_1dc50
	inc [hl]
	inc [hl]
	add hl, de
	dec c
	jr nz, .asm_1dc50
	pop de
	pop bc
	ret

VermilionDock_1dc59: ; 1dc59 (7:5c59)
	ld a, [wTrainerEngageDistance]
	sub $10
	ld [wTrainerEngageDistance], a
	ld c, a
	ld b, $64
	ld a, [wWhichTrade]
	inc a
	ld [wWhichTrade], a
	ld a, $1
	ld de, VermilionDockOAMBlock
	call WriteOAMBlock
	ret

VermilionDockOAMBlock: ; 1dc74 (7:5c74)
	db $fc, $10
	db $fd, $10
	db $fe, $10
	db $ff, $10

VermilionDock_1dc7c: ; 1dc7c (7:5c7c)
	ld h, d
	ld l, $50
	call .asm_1dc86
	ld h, $0
	ld l, $80
.asm_1dc86
	ld a, [rLY]
	cp l
	jr nz, .asm_1dc86
	ld a, h
	ld [$ff43], a
.asm_1dc8e
	ld a, [rLY]
	cp h
	jr z, .asm_1dc8e
	ret

VermilionDock_1dc94: ; 1dc94 (7:5c94)
	ld hl, wcc5b
	ld bc, $00b4
	ld a, $14
	call FillMemory
	ld hl, vBGMap0 + 10 * 32
	ld de, wcc5b
	ld bc, $000c
	call CopyVideoData
	ld hl, wOverworldMap + 10 + 7 * VERMILION_DOCK_WIDTH ; 10, 7
	ld a, $d
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, (SFX_02_54 - SFX_Headers_02) / 3
	call PlaySound
	ld c, 120
	call DelayFrames
	ret

VermilionDockTextPointers: ; 1dcbf (7:5cbf)
	dw VermilionDockText1

VermilionDockText1: ; 1dcc1 (7:5cc1)
	TX_FAR _VermilionDockText1
	db "@"
