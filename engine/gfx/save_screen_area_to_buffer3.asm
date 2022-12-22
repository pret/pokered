; copy bxc screen area at hl to wTileMapBackup3. Maximum size allowed 160 tiles.
SaveScreenTileAreaToBuffer3::
	call GetPredefRegisters
	ld de, wTileMapBackup3
	ld a, b
	push af
	inc c
.yLoop
	pop af
	push af
	push hl
	ld b, a
	dec c
	jr z, DoneTileBuffer3Action
.xLoop
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .xLoop
	pop hl
	push bc
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	jr .yLoop

; load saved tiles of bxc screen area at hl from wTileMapBackup3
LoadScreenTileAreaFromBuffer3::
	call GetPredefRegisters
	ld de, wTileMapBackup3
	ld a, b
	push af
	inc c
.yLoop
	pop af
	push af
	push hl
	ld b, a
	dec c
	jr z, DoneTileBuffer3Action
.xLoop
	ld a, [de]
	ld [hli], a
	inc de
	dec b
	jr nz, .xLoop
	pop hl
	push bc
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	jr .yLoop

DoneTileBuffer3Action:
	pop hl
	pop af
	ret