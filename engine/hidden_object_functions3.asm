; prints text for bookshelves in buildings without sign events
PrintBookshelfText: ; fb50 (3:7b50)
	ld a, [wSpriteStateData1 + 9]
	cp $4
	jr nz, .asm_fb7f
	ld a, [W_CURMAPTILESET] ; W_CURMAPTILESET
	ld b, a
	aCoord 8, 7
	ld c, a
	ld hl, BookshelfTileIDs ; $7b8b
.asm_fb62
	ld a, [hli]
	cp $ff
	jr z, .asm_fb7f
	cp b
	jr nz, .asm_fb7b
	ld a, [hli]
	cp c
	jr nz, .asm_fb7c
	ld a, [hl]
	push af
	call EnableAutoTextBoxDrawing
	pop af
	call PrintPredefTextID
	xor a
	ld [$ffdb], a
	ret
.asm_fb7b
	inc hl
.asm_fb7c
	inc hl
	jr .asm_fb62
.asm_fb7f
	ld a, $ff
	ld [$ffdb], a
	ld b, BANK(PrintCardKeyText)
	ld hl, PrintCardKeyText
	jp Bankswitch

; format: db tileset id, bookshelf tile id, text id
BookshelfTileIDs: ; fb8b (3:7b8b)
	db PLATEAU,      $30, $3A
	db HOUSE,        $3D, $3F
	db HOUSE,        $1E, $40
	db MANSION,      $32, $40
	db REDS_HOUSE_1, $32, $40
	db LAB,          $28, $40
	db LOBBY,        $16, $41
	db GYM,          $1D, $40
	db DOJO,         $1D, $40
	db GATE,         $22, $40
	db MART,         $54, $42
	db MART,         $55, $42
	db POKECENTER,   $54, $42
	db POKECENTER,   $55, $42
	db LOBBY,        $50, $42
	db LOBBY,        $52, $42
	db SHIP,         $36, $40
	db $FF

IndigoPlateauStatues: ; fbbf (3:7bbf)
	db $08 ; asm
	ld hl, IndigoPlateauStatuesText1
	call PrintText
	ld a, [W_XCOORD]
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
	db $08 ; asm
	ld hl, PokemonBooksText
	ld a, [W_CURMAPTILESET]
	cp MANSION ; Celadon Mansion tileset
	jr nz, .asm_fbfd
	ld a, [wTileMap + $80]
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
	db $08 ; asm
	ld a, $1
	ld [wcc3c], a
	ld hl, wd730
	set 6, [hl]
	call GBPalWhiteOutWithDelay3
	xor a
	ld [$ffb0], a
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
