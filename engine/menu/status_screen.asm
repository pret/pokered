; Predef 0x37
StatusScreen: ; 12953 (4:6953)
	call LoadMonData
	ld a, [wcc49]
	cp $2 ; 2 means we're in a PC box
	jr c, .DontRecalculate ; 0x1295b $14
	ld a, [wcf9b]
	ld [wcfb9], a
	ld [W_CURENEMYLVL], a
	ld hl, wcfa8
	ld de, wcfba
	ld b, $1
	call CalcStats ; Recalculate stats
.DontRecalculate
	ld hl, wd72c
	set 1, [hl]
	ld a, $33
	ld [$ff24], a ; Reduce the volume
	call GBPalWhiteOutWithDelay3
	call ClearScreen
	call UpdateSprites ; move sprites (?)
	call LoadHpBarAndStatusTilePatterns
	ld de, BattleHudTiles1  ; $6080 ; source
	ld hl, vChars2 + $6d0 ; dest
	ld bc, (BANK(BattleHudTiles1) << 8) + $03 ; bank bytes/8
	call CopyVideoDataDouble ; ·│ :L and halfarrow line end
	ld de, BattleHudTiles2 ; $6098
	ld hl, vChars2 + $780
	ld bc, (BANK(BattleHudTiles2) << 8) + $01
	call CopyVideoDataDouble ; │
	ld de, BattleHudTiles3 ; $60b0
	ld hl, vChars2 + $760
	ld bc, (BANK(BattleHudTiles3) << 8) + $02
	call CopyVideoDataDouble ; ─┘
	ld de, PTile
	ld hl, vChars2 + $720
	ld bc,(BANK(PTile) << 8 | $01)
	call CopyVideoDataDouble ; P (for PP), inline
	ld a, [hTilesetType]
	push af
	xor a
	ld [hTilesetType], a
	hlCoord 19, 1
	ld bc, $060a
	call DrawLineBox ; Draws the box around name, HP and status
	ld de, $fffa
	add hl, de
	ld [hl], $f2 ; . after No ("." is a different one)
	dec hl
	ld [hl], "№"
	hlCoord 19, 9
	ld bc, $0806
	call DrawLineBox ; Draws the box around types, ID No. and OT
	hlCoord 10, 9
	ld de, Type1Text
	call PlaceString ; "TYPE1/"
	hlCoord 11, 3
	predef DrawHP ; predef $5f
	ld hl, wcf25
	call GetHealthBarColor
	ld b, $3
	call GoPAL_SET ; SGB palette
	hlCoord 16, 6
	ld de, wcf9c
	call PrintStatusCondition
	jr nz, .StatusWritten ; 0x129fc $9
	hlCoord 16, 6
	ld de, OKText
	call PlaceString ; "OK"
.StatusWritten
	hlCoord 9, 6
	ld de, StatusText
	call PlaceString ; "STATUS/"
	hlCoord 14, 2
	call PrintLevel ; Pokémon level
	ld a, [W_MONHDEXNUM]
	ld [wd11e], a
	ld [wd0b5], a
	predef IndexToPokedex
	hlCoord 3, 7
	ld de, wd11e
	ld bc, $8103 ; Zero-padded, 3
	call PrintNumber ; Pokémon no.
	hlCoord 11, 10
	predef Func_27d6b ; Prints the type (?)
	ld hl, NamePointers2 ; $6a9d
	call .unk_12a7e
	ld d, h
	ld e, l
	hlCoord 9, 1
	call PlaceString ; Pokémon name
	ld hl, OTPointers ; $6a95
	call .unk_12a7e
	ld d, h
	ld e, l
	hlCoord 12, 16
	call PlaceString ; OT
	hlCoord 12, 14
	ld de, wcfa4
	ld bc, $8205 ; 5
	call PrintNumber ; ID Number
	ld d, $0
	call PrintStatsBox
	call Delay3
	call GBPalNormal
	hlCoord 1, 0
	call LoadFlippedFrontSpriteByMonIndex ; draw Pokémon picture
	ld a, [wcf91]
	call PlayCry ; play Pokémon cry
	call WaitForTextScrollButtonPress ; wait for button
	pop af
	ld [hTilesetType], a
	ret
.unk_12a7e ; 0x12a7e ; I don't know what this does, iterates over pointers?
	ld a, [wcc49]
	add a
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcc49]
	cp $3
	ret z
	ld a, [wWhichPokemon]
	jp SkipFixedLengthTextEntries

OTPointers: ; 12a95 (4:6a95)
	dw wPartyMonOT
	dw wEnemyMonOT
	dw wBoxMonOT
	dw W_DAYCAREMONOT

NamePointers2: ; 12a9d (4:6a9d)
	dw wPartyMonNicks
	dw wEnemyMonNicks
	dw wBoxMonNicks
	dw W_DAYCAREMONNAME

Type1Text: ; 12aa5 (4:6aa5)
	db "TYPE1/", $4e

Type2Text: ; 12aac (4:6aac)
	db "TYPE2/", $4e

IDNoText: ; 12ab3 (4:6ab3)
	db $73, "№", "/", $4e

OTText: ; 12ab7 (4:6ab7)
	db "OT/", $4e, "@"

StatusText: ; 12abc (4:6abc)
	db "STATUS/@"

OKText: ; 12ac4 (4:6ac4)
	db "OK@"

; Draws a line starting from hl high b and wide c
DrawLineBox ; 0x12ac7
	ld de, $0014 ; New line
.PrintVerticalLine
	ld [hl], $78 ; │
	add hl, de
	dec b
	jr nz, .PrintVerticalLine ; 0x12ace $fa
	ld [hl], $77 ; ┘
	dec hl
.PrintHorizLine
	ld [hl], $76 ; ─
	dec hl
	dec c
	jr nz, .PrintHorizLine ; 0x12ad7 $fa
	ld [hl], $6f ; ← (halfarrow ending)
	ret

PTile: ; 12adc (4:6adc) ; This is a single 1bpp "P" tile
	INCBIN "gfx/p_tile.1bpp"

PrintStatsBox: ; 12ae4 (4:6ae4)
	ld a, d
	and a ; a is 0 from the status screen
	jr nz, .DifferentBox ; 0x12ae6 $12
	hlCoord 0, 8
	ld b, $8
	ld c, $8
	call TextBoxBorder ; Draws the box
	hlCoord 1, 9 ; Start printing stats from here
	ld bc, $0019 ; Number offset
	jr .PrintStats ; 0x12af8 $10
.DifferentBox
	hlCoord 9, 2
	ld b, $8
	ld c, $9
	call TextBoxBorder
	hlCoord 11, 3
	ld bc, $0018
.PrintStats
	push bc
	push hl
	ld de, StatsText
	call PlaceString
	pop hl
	pop bc
	add hl, bc
	ld de, wcfbc
	ld bc, $0203 ; three digits
	call PrintStat
	ld de, wcfbe
	call PrintStat
	ld de, wcfc0
	call PrintStat
	ld de, wcfc2
	jp PrintNumber
PrintStat
	push hl
	call PrintNumber
	pop hl
	ld de, $0028
	add hl, de
	ret

StatsText: ; 12b3a (4:6b3a)
	db   "ATTACK"
	next "DEFENSE"
	next "SPEED"
	next "SPECIAL@"

StatusScreen2: ; 12b57 (4:6b57)
	ld a, [hTilesetType]
	push af
	xor a
	ld [hTilesetType], a
	ld [$ffba], a
	ld bc, $0005
	ld hl, wd0dc
	call FillMemory
	ld hl, wcfa0
	ld de, wd0dc
	ld bc, $0004
	call CopyData
	callab Func_39b87
	hlCoord 9, 2
	ld bc, $050a
	call ClearScreenArea ; Clear under name
	hlCoord 19, 3
	ld [hl], $78
	hlCoord 0, 8
	ld b, $8
	ld c, $12
	call TextBoxBorder ; Draw move container
	hlCoord 2, 9
	ld de, wd0e1
	call PlaceString ; Print moves
	ld a, [wcd6c]
	inc a
	ld c, a
	ld a, $4
	sub c
	ld b, a ; Number of moves ?
	hlCoord 11, 10
	ld de, $0028
	ld a, $72
	call Func_12ccb ; Print "PP"
	ld a, b
	and a
	jr z, .InitPP ; 0x12bb3 $6
	ld c, a
	ld a, "-"
	call Func_12ccb ; Fill the rest with --
.InitPP ; 12bbb
	ld hl, wcfa0
	deCoord 14, 10
	ld b, $0
.PrintPP ; 12bc3
	ld a, [hli]
	and a
	jr z, .PPDone ; 0x12bc5 $4a
	push bc
	push hl
	push de
	ld hl, wCurrentMenuItem
	ld a, [hl]
	push af
	ld a, b
	ld [hl], a
	push hl
	callab GetMaxPP
	pop hl
	pop af
	ld [hl], a
	pop de
	pop hl
	push hl
	ld bc, $0014
	add hl, bc
	ld a, [hl]
	and $3f
	ld [wcd71], a
	ld h, d
	ld l, e
	push hl
	ld de, wcd71
	ld bc, $0102
	call PrintNumber
	ld a, "/"
	ld [hli], a
	ld de, wd11e
	ld bc, $0102
	call PrintNumber
	pop hl
	ld de, $0028
	add hl, de
	ld d, h
	ld e, l
	pop hl
	pop bc
	inc b
	ld a, b
	cp $4
	jr nz, .PrintPP ; 0x12c0f $b2
.PPDone
	hlCoord 9, 3
	ld de, EXPPointsText
	call PlaceString
	ld a, [wcfb9] ; level
	push af
	cp MAX_LEVEL
	jr z, .Level100 ; 0x12c20 $4
	inc a
	ld [wcfb9], a ; Increase temporarily if not 100
.Level100
	hlCoord 14, 6
	ld [hl], $70 ; 1-tile "to"
	inc hl
	inc hl
	call PrintLevel
	pop af
	ld [wcfb9], a
	ld de, wcfa6
	hlCoord 12, 4
	ld bc, $0307
	call PrintNumber ; exp
	call .asm_12c86
	ld de, wcfa6
	hlCoord 7, 6
	ld bc, $0307
	call PrintNumber
	hlCoord 9, 0
	call Func_12cc3
	hlCoord 9, 1
	call Func_12cc3
	ld a, [W_MONHDEXNUM]
	ld [wd11e], a
	call GetMonName
	hlCoord 9, 1
	call PlaceString
	ld a, $1
	ld [$ffba], a
	call Delay3
	call WaitForTextScrollButtonPress ; wait for button
	pop af
	ld [hTilesetType], a
	ld hl, wd72c
	res 1, [hl]
	ld a, $77
	ld [$ff24], a
	call GBPalWhiteOut
	jp ClearScreen
.asm_12c86 ; This does some magic with lvl/exp?
	ld a, [wcfb9] ; Load level
	cp MAX_LEVEL
	jr z, .asm_12ca7 ; 0x12c8b $1a ; If 100
	inc a
	ld d, a
	callab CalcExperience
	ld hl, wcfa8
	ld a, [$ff98]
	sub [hl]
	ld [hld], a
	ld a, [$ff97]
	sbc [hl]
	ld [hld], a
	ld a, [$ff96]
	sbc [hl]
	ld [hld], a
	ret
.asm_12ca7
	ld hl, wcfa6
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret

EXPPointsText: ; 12caf (4:6caf)
	db "EXP POINTS", $4e

LevelUpText: ; 12cba (4:6cba)
	db "LEVEL UP@"

Func_12cc3: ; 12cc3 (4:6cc3)
	ld bc, $a
	ld a, $7f
	jp FillMemory

Func_12ccb: ; 12ccb (4:6ccb)
	ld [hli], a
	ld [hld], a
	add hl, de
	dec c
	jr nz, Func_12ccb
	ret
