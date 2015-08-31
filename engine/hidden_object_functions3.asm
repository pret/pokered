; prints text for bookshelves in buildings without sign events
PrintBookshelfText: ; fb50 (3:7b50)
	ld a, [wSpriteStateData1 + 9] ; player's sprite facing direction
	cp SPRITE_FACING_UP
	jr nz, .noMatch
; facing up
	ld a, [wCurMapTileset]
	ld b, a
	aCoord 8, 7
	ld c, a
	ld hl, BookshelfTileIDs
.loop
	ld a, [hli]
	cp $ff
	jr z, .noMatch
	cp b
	jr nz, .nextBookshelfEntry1
	ld a, [hli]
	cp c
	jr nz, .nextBookshelfEntry2
	ld a, [hl]
	push af
	call EnableAutoTextBoxDrawing
	pop af
	call PrintPredefTextID
	xor a
	ld [$ffdb], a
	ret
.nextBookshelfEntry1
	inc hl
.nextBookshelfEntry2
	inc hl
	jr .loop
.noMatch
	ld a, $ff
	ld [$ffdb], a
	jpba PrintCardKeyText

; format: db tileset id, bookshelf tile id, text id
BookshelfTileIDs: ; fb8b (3:7b8b)
	db PLATEAU,      $30
	db (IndigoPlateauStatues_id   - TextPredefs) / 2 + 1
	db HOUSE,        $3D
	db (TownMapText_id   - TextPredefs) / 2 + 1
	db HOUSE,        $1E
	db (BookOrSculptureText_id   - TextPredefs) / 2 + 1
	db MANSION,      $32
	db (BookOrSculptureText_id   - TextPredefs) / 2 + 1
	db REDS_HOUSE_1, $32
	db (BookOrSculptureText_id   - TextPredefs) / 2 + 1
	db LAB,          $28
	db (BookOrSculptureText_id   - TextPredefs) / 2 + 1
	db LOBBY,        $16
	db (ElevatorText_id   - TextPredefs) / 2 + 1
	db GYM,          $1D
	db (BookOrSculptureText_id   - TextPredefs) / 2 + 1
	db DOJO,         $1D
	db (BookOrSculptureText_id   - TextPredefs) / 2 + 1
	db GATE,         $22
	db (BookOrSculptureText_id   - TextPredefs) / 2 + 1
	db MART,         $54
	db (PokemonStuffText_id   - TextPredefs) / 2 + 1
	db MART,         $55
	db (PokemonStuffText_id   - TextPredefs) / 2 + 1
	db POKECENTER,   $54
	db (PokemonStuffText_id   - TextPredefs) / 2 + 1
	db POKECENTER,   $55
	db (PokemonStuffText_id   - TextPredefs) / 2 + 1
	db LOBBY,        $50
	db (PokemonStuffText_id   - TextPredefs) / 2 + 1
	db LOBBY,        $52
	db (PokemonStuffText_id   - TextPredefs) / 2 + 1
	db SHIP,         $36
	db (BookOrSculptureText_id   - TextPredefs) / 2 + 1
	db $FF

IndigoPlateauStatues: ; fbbf (3:7bbf)
	TX_ASM
	ld hl, IndigoPlateauStatuesText1
	call PrintText
	ld a, [wXCoord]
	bit 0, a
	ld hl, IndigoPlateauStatuesText2
	jr nz, .asm_fbd3
	ld hl, IndigoPlateauStatuesText3
.asm_fbd3
	call PrintText
	jp TextScriptEnd

IndigoPlateauStatuesText1: ; fbd9 (3:7bd9)
	TX_FAR _IndigoPlateauStatuesText1
	db "@"

IndigoPlateauStatuesText2: ; fbde (3:7bde)
	TX_FAR _IndigoPlateauStatuesText2
	db "@"

IndigoPlateauStatuesText3: ; fbe3 (3:7be3)
	TX_FAR _IndigoPlateauStatuesText3
	db "@"

BookOrSculptureText: ; fbe8 (3:7be8)
	TX_ASM
	ld hl, PokemonBooksText
	ld a, [wCurMapTileset]
	cp MANSION ; Celadon Mansion tileset
	jr nz, .asm_fbfd
	aCoord 8, 6
	cp $38
	jr nz, .asm_fbfd
	ld hl, DiglettSculptureText
.asm_fbfd
	call PrintText
	jp TextScriptEnd

PokemonBooksText: ; fc03 (3:7c03)
	TX_FAR _PokemonBooksText
	db "@"

DiglettSculptureText: ; fc08 (3:7c08)
	TX_FAR _DiglettSculptureText
	db "@"

ElevatorText: ; fc0d (3:7c0d)
	TX_FAR _ElevatorText
	db "@"

TownMapText: ; fc12 (3:7c12)
	TX_FAR _TownMapText
	db $06
	TX_ASM
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, wd730
	set 6, [hl]
	call GBPalWhiteOutWithDelay3
	xor a
	ld [hWY], a
	inc a
	ld [H_AUTOBGTRANSFERENABLED], a
	call LoadFontTilePatterns
	callba DisplayTownMap
	ld hl, wd730
	res 6, [hl]
	ld de, TextScriptEnd
	push de
	ld a, [H_LOADEDROMBANK]
	push af
	jp CloseTextDisplay

PokemonStuffText: ; fc45 (3:7c45)
	TX_FAR _PokemonStuffText
	db "@"
