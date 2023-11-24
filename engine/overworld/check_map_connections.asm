; PureRGBnote: MOVED: these functions were moved from overworld.asm for additional space in the home bank.

CheckWestMap::
	ld a, [wXCoord]
	cp $ff
	jp nz, CheckEastMap
	ld a, [wWestConnectedMap]
	ld [wCurMap], a
	ld a, [wWestConnectedMapXAlignment] ; new X coordinate upon entering west map
	ld [wXCoord], a
	ld a, [wYCoord]
	ld c, a
	ld a, [wWestConnectedMapYAlignment] ; Y adjustment upon entering west map
	add c
	ld c, a
	ld [wYCoord], a
	hl_deref wWestConnectedMapViewPointer ; pointer to upper left corner of map without adjustment for Y position
	srl c
	jr z, .savePointer1
.pointerAdjustmentLoop1
	ld a, [wWestConnectedMapWidth] ; width of connected map
	add MAP_BORDER * 2
	ld e, a
	ld d, 0
	ld b, 0
	add hl, de
	dec c
	jr nz, .pointerAdjustmentLoop1
.savePointer1
	ld a, l
	ld [wCurrentTileBlockMapViewPointer], a ; pointer to upper left corner of current tile block map section
	ld a, h
	ld [wCurrentTileBlockMapViewPointer + 1], a
	xor a
	ret

CheckEastMap:
	ld b, a
	ld a, [wCurrentMapWidth2] ; map width
	cp b
	jp nz, CheckNorthMap
	ld a, [wEastConnectedMap]
	ld [wCurMap], a
	ld a, [wEastConnectedMapXAlignment] ; new X coordinate upon entering east map
	ld [wXCoord], a
	ld a, [wYCoord]
	ld c, a
	ld a, [wEastConnectedMapYAlignment] ; Y adjustment upon entering east map
	add c
	ld c, a
	ld [wYCoord], a
	hl_deref wEastConnectedMapViewPointer ; pointer to upper left corner of map without adjustment for Y position
	srl c
	jr z, .savePointer2
.pointerAdjustmentLoop2
	ld a, [wEastConnectedMapWidth]
	add MAP_BORDER * 2
	ld e, a
	ld d, 0
	ld b, 0
	add hl, de
	dec c
	jr nz, .pointerAdjustmentLoop2
.savePointer2
	ld a, l
	ld [wCurrentTileBlockMapViewPointer], a ; pointer to upper left corner of current tile block map section
	ld a, h
	ld [wCurrentTileBlockMapViewPointer + 1], a
	xor a ;zet zero flag
	ret

CheckNorthMap:
	ld a, [wYCoord]
	cp $ff
	jp nz, CheckSouthMap
	ld a, [wNorthConnectedMap]
	ld [wCurMap], a
	ld a, [wNorthConnectedMapYAlignment] ; new Y coordinate upon entering north map
	ld [wYCoord], a
	ld a, [wXCoord]
	ld c, a
	ld a, [wNorthConnectedMapXAlignment] ; X adjustment upon entering north map
	add c
	ld c, a
	ld [wXCoord], a
	hl_deref wNorthConnectedMapViewPointer ; pointer to upper left corner of map without adjustment for X position
	ld b, 0
	srl c
	add hl, bc
	ld a, l
	ld [wCurrentTileBlockMapViewPointer], a ; pointer to upper left corner of current tile block map section
	ld a, h
	ld [wCurrentTileBlockMapViewPointer + 1], a
	xor a ;zet zero flag
	ret

CheckSouthMap:
	ld b, a
	ld a, [wCurrentMapHeight2]
	cp b
	ret nz
	ld a, [wSouthConnectedMap]
	ld [wCurMap], a
	ld a, [wSouthConnectedMapYAlignment] ; new Y coordinate upon entering south map
	ld [wYCoord], a
	ld a, [wXCoord]
	ld c, a
	ld a, [wSouthConnectedMapXAlignment] ; X adjustment upon entering south map
	add c
	ld c, a
	ld [wXCoord], a
	hl_deref wSouthConnectedMapViewPointer ; pointer to upper left corner of map without adjustment for X position
	ld b, 0
	srl c
	add hl, bc
	ld a, l
	ld [wCurrentTileBlockMapViewPointer], a ; pointer to upper left corner of current tile block map section
	ld a, h
	ld [wCurrentTileBlockMapViewPointer + 1], a
	xor a ;zet zero flag
	ret