; prints text for bookshelves in buildings without sign events
PrintBookshelfText::
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

INCLUDE "data/tilesets/bookshelf_tile_ids.asm"
