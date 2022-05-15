Route2_Script:
	call Route2ReplaceCutTiles
	jp EnableAutoTextBoxDrawing

; replaces the cut trees, by default it adds 1
; after using the "Tree Deleter" on this route it removes 2 trees from the default to have 3 gone in total and an open path to Pewter City
Route2ReplaceCutTiles:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl] ; did we load the map from a save/warp/door/battle, etc?
	res 5, [hl]
	jr nz, .removeAddCutTiles
	bit 4, [hl] ; did we enter the map by traversal from another route
	res 4, [hl]
	jr nz, .removeAddCutTilesNoRedraw
	ret
.removeAddCutTiles
	CheckEvent EVENT_DELETED_ROUTE2_TREES
	jr nz, .remove
.add
	; add one tree in this case to have the default map - improves speed when removing the trees at the cost of a minor hit by default
	ld a, $34
	ld [wNewTileBlockID], a
	lb bc, 30, 6
	predef ReplaceTileBlock
	ret
.remove
	ld a, $6D
	ld [wNewTileBlockID], a
	lb bc, 11, 7
	predef ReplaceTileBlock
	lb bc, 5, 2
	predef ReplaceTileBlock
	ret
.removeAddCutTilesNoRedraw
	; this avoids redrawing the map because when going between areas since these tiles are offscreen.
	CheckEvent EVENT_DELETED_ROUTE2_TREES
	jr nz, .removeNoRedraw
	ld a, $34
	ld [wNewTileBlockID], a
	lb bc, 30, 6
	predef ReplaceTileBlockNoRedraw
	ret
.removeNoRedraw
	ld a, $6D
	ld [wNewTileBlockID], a
	lb bc, 11, 7
	predef ReplaceTileBlockNoRedraw
	lb bc, 5, 2
	predef ReplaceTileBlockNoRedraw
	ret

Route2_TextPointers:
	dw PickUpItemText
	dw PickUpItemText
	dw Route2Text3
	dw Route2Text4

Route2Text3:
	text_far _Route2Text3
	text_end

Route2Text4:
	text_far _Route2Text4
	text_end
