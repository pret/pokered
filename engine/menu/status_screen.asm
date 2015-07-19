DrawHP: ; 128ef (4:68ef)
; Draws the HP bar in the stats screen
	call GetPredefRegisters
	ld a, $1
	jr DrawHP_

DrawHP2: ; 128f6 (4:68f6)
; Draws the HP bar in the party screen
	call GetPredefRegisters
	ld a, $2

DrawHP_: ; 128fb (4:68fb)
	ld [wHPBarType], a
	push hl
	ld a, [wLoadedMonHP]
	ld b, a
	ld a, [wLoadedMonHP + 1]
	ld c, a
	or b
	jr nz, .nonzeroHP
	xor a
	ld c, a
	ld e, a
	ld a, $6
	ld d, a
	jp .drawHPBarAndPrintFraction
.nonzeroHP
	ld a, [wLoadedMonMaxHP]
	ld d, a
	ld a, [wLoadedMonMaxHP + 1]
	ld e, a
	predef HPBarLength
	ld a, $6
	ld d, a
	ld c, a
.drawHPBarAndPrintFraction
	pop hl
	push de
	push hl
	push hl
	call DrawHPBar
	pop hl
	ld a, [hFlags_0xFFF6]
	bit 0, a
	jr z, .printFractionBelowBar
	ld bc, $9 ; right of bar
	jr .printFraction
.printFractionBelowBar
	ld bc, SCREEN_WIDTH + 1 ; below bar
.printFraction
	add hl, bc
	ld de, wLoadedMonHP
	ld bc, $203
	call PrintNumber
	ld a, "/"
	ld [hli], a
	ld de, wLoadedMonMaxHP
	ld bc, $203
	call PrintNumber
	pop hl
	pop de
	ret


; Predef 0x37
StatusScreen: ; 12953 (4:6953)
	call LoadMonData
	ld a, [wMonDataLocation]
	cp BOX_DATA
	jr c, .DontRecalculate
; mon is in a box or daycare
	ld a, [wLoadedMonBoxLevel]
	ld [wLoadedMonLevel], a
	ld [W_CURENEMYLVL], a
	ld hl, wLoadedMonHPExp - 1
	ld de, wLoadedMonStats
	ld b, $1
	call CalcStats ; Recalculate stats
.DontRecalculate
	ld hl, wd72c
	set 1, [hl]
	ld a, $33
	ld [$ff24], a ; Reduce the volume
	call GBPalWhiteOutWithDelay3
	call ClearScreen
	call UpdateSprites
	call LoadHpBarAndStatusTilePatterns
	ld de, BattleHudTiles1  ; source
	ld hl, vChars2 + $6d0 ; dest
	ld bc, (BANK(BattleHudTiles1) << 8) + $03 ; bank bytes/8
	call CopyVideoDataDouble ; ·│ :L and halfarrow line end
	ld de, BattleHudTiles2
	ld hl, vChars2 + $780
	ld bc, (BANK(BattleHudTiles2) << 8) + $01
	call CopyVideoDataDouble ; │
	ld de, BattleHudTiles3
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
	coord hl, 19, 1
	ld bc, $060a
	call DrawLineBox ; Draws the box around name, HP and status
	ld de, $fffa
	add hl, de
	ld [hl], $f2 ; . after No ("." is a different one)
	dec hl
	ld [hl], "№"
	coord hl, 19, 9
	ld bc, $0806
	call DrawLineBox ; Draws the box around types, ID No. and OT
	coord hl, 10, 9
	ld de, Type1Text
	call PlaceString ; "TYPE1/"
	coord hl, 11, 3
	predef DrawHP
	ld hl, wcf25
	call GetHealthBarColor
	ld b, $3
	call GoPAL_SET ; SGB palette
	coord hl, 16, 6
	ld de, wLoadedMonStatus
	call PrintStatusCondition
	jr nz, .StatusWritten
	coord hl, 16, 6
	ld de, OKText
	call PlaceString ; "OK"
.StatusWritten
	coord hl, 9, 6
	ld de, StatusText
	call PlaceString ; "STATUS/"
	coord hl, 14, 2
	call PrintLevel ; Pokémon level
	ld a, [W_MONHDEXNUM]
	ld [wd11e], a
	ld [wd0b5], a
	predef IndexToPokedex
	coord hl, 3, 7
	ld de, wd11e
	ld bc, $8103 ; Zero-padded, 3
	call PrintNumber ; Pokémon no.
	coord hl, 11, 10
	predef PrintMonType
	ld hl, NamePointers2
	call .GetStringPointer
	ld d, h
	ld e, l
	coord hl, 9, 1
	call PlaceString ; Pokémon name
	ld hl, OTPointers
	call .GetStringPointer
	ld d, h
	ld e, l
	coord hl, 12, 16
	call PlaceString ; OT
	coord hl, 12, 14
	ld de, wLoadedMonOTID
	ld bc, $8205 ; 5
	call PrintNumber ; ID Number
	ld d, $0
	call PrintStatsBox
	call Delay3
	call GBPalNormal
	coord hl, 1, 0
	call LoadFlippedFrontSpriteByMonIndex ; draw Pokémon picture
	ld a, [wcf91]
	call PlayCry ; play Pokémon cry
	call WaitForTextScrollButtonPress ; wait for button
	pop af
	ld [hTilesetType], a
	ret

.GetStringPointer
	ld a, [wMonDataLocation]
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMonDataLocation]
	cp DAYCARE_DATA
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
DrawLineBox: ; 0x12ac7
	ld de, $0014 ; New line
.PrintVerticalLine
	ld [hl], $78 ; │
	add hl, de
	dec b
	jr nz, .PrintVerticalLine
	ld [hl], $77 ; ┘
	dec hl
.PrintHorizLine
	ld [hl], $76 ; ─
	dec hl
	dec c
	jr nz, .PrintHorizLine
	ld [hl], $6f ; ← (halfarrow ending)
	ret

PTile: ; 12adc (4:6adc) ; This is a single 1bpp "P" tile
	INCBIN "gfx/p_tile.1bpp"

PrintStatsBox: ; 12ae4 (4:6ae4)
	ld a, d
	and a ; a is 0 from the status screen
	jr nz, .DifferentBox
	coord hl, 0, 8
	ld b, $8
	ld c, $8
	call TextBoxBorder ; Draws the box
	coord hl, 1, 9 ; Start printing stats from here
	ld bc, $0019 ; Number offset
	jr .PrintStats
.DifferentBox
	coord hl, 9, 2
	ld b, $8
	ld c, $9
	call TextBoxBorder
	coord hl, 11, 3
	ld bc, $0018
.PrintStats
	push bc
	push hl
	ld de, StatsText
	call PlaceString
	pop hl
	pop bc
	add hl, bc
	ld de, wLoadedMonAttack
	ld bc, $0203 ; three digits
	call PrintStat
	ld de, wLoadedMonDefense
	call PrintStat
	ld de, wLoadedMonSpeed
	call PrintStat
	ld de, wLoadedMonSpecial
	jp PrintNumber
PrintStat
	push hl
	call PrintNumber
	pop hl
	ld de, SCREEN_WIDTH * 2
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
	ld [H_AUTOBGTRANSFERENABLED], a
	ld bc, NUM_MOVES + 1
	ld hl, wMoves
	call FillMemory
	ld hl, wLoadedMonMoves
	ld de, wMoves
	ld bc, NUM_MOVES
	call CopyData
	callab FormatMovesString
	coord hl, 9, 2
	lb bc, 5, 10
	call ClearScreenArea ; Clear under name
	coord hl, 19, 3
	ld [hl], $78
	coord hl, 0, 8
	ld b, 8
	ld c, 18
	call TextBoxBorder ; Draw move container
	coord hl, 2, 9
	ld de, wMovesString
	call PlaceString ; Print moves
	ld a, [wNumMovesMinusOne]
	inc a
	ld c, a
	ld a, $4
	sub c
	ld b, a ; Number of moves ?
	coord hl, 11, 10
	ld de, SCREEN_WIDTH * 2
	ld a, $72 ; special P tile id
	call StatusScreen_PrintPP ; Print "PP"
	ld a, b
	and a
	jr z, .InitPP
	ld c, a
	ld a, "-"
	call StatusScreen_PrintPP ; Fill the rest with --
.InitPP ; 12bbb
	ld hl, wLoadedMonMoves
	coord de, 14, 10
	ld b, 0
.PrintPP ; 12bc3
	ld a, [hli]
	and a
	jr z, .PPDone
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
	ld bc, wPartyMon1PP - wPartyMon1Moves - 1
	add hl, bc
	ld a, [hl]
	and $3f
	ld [wStatusScreenCurrentPP], a
	ld h, d
	ld l, e
	push hl
	ld de, wStatusScreenCurrentPP
	ld bc, $0102
	call PrintNumber
	ld a, "/"
	ld [hli], a
	ld de, wd11e
	ld bc, $0102
	call PrintNumber
	pop hl
	ld de, SCREEN_WIDTH * 2
	add hl, de
	ld d, h
	ld e, l
	pop hl
	pop bc
	inc b
	ld a, b
	cp $4
	jr nz, .PrintPP
.PPDone
	coord hl, 9, 3
	ld de, StatusScreenExpText
	call PlaceString
	ld a, [wLoadedMonLevel]
	push af
	cp MAX_LEVEL
	jr z, .Level100
	inc a
	ld [wLoadedMonLevel], a ; Increase temporarily if not 100
.Level100
	coord hl, 14, 6
	ld [hl], $70 ; 1-tile "to"
	inc hl
	inc hl
	call PrintLevel
	pop af
	ld [wLoadedMonLevel], a
	ld de, wLoadedMonExp
	coord hl, 12, 4
	ld bc, $0307
	call PrintNumber ; exp
	call CalcExpToLevelUp
	ld de, wLoadedMonExp
	coord hl, 7, 6
	ld bc, $0307
	call PrintNumber ; exp needed to level up
	coord hl, 9, 0
	call StatusScreen_ClearName
	coord hl, 9, 1
	call StatusScreen_ClearName
	ld a, [W_MONHDEXNUM]
	ld [wd11e], a
	call GetMonName
	coord hl, 9, 1
	call PlaceString
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a
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

CalcExpToLevelUp: ; 12c86 (4:6c86)
	ld a, [wLoadedMonLevel]
	cp MAX_LEVEL
	jr z, .atMaxLevel
	inc a
	ld d, a
	callab CalcExperience
	ld hl, wLoadedMonExp + 2
	ld a, [hExperience + 2]
	sub [hl]
	ld [hld], a
	ld a, [hExperience + 1]
	sbc [hl]
	ld [hld], a
	ld a, [hExperience]
	sbc [hl]
	ld [hld], a
	ret
.atMaxLevel
	ld hl, wLoadedMonExp
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret

StatusScreenExpText: ; 12caf (4:6caf)
	db   "EXP POINTS"
	next "LEVEL UP@"

StatusScreen_ClearName: ; 12cc3 (4:6cc3)
	ld bc, 10
	ld a, " "
	jp FillMemory

StatusScreen_PrintPP: ; 12ccb (4:6ccb)
; print PP or -- c times, going down two rows each time
	ld [hli], a
	ld [hld], a
	add hl, de
	dec c
	jr nz, StatusScreen_PrintPP
	ret
