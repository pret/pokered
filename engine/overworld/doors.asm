; returns whether the player is standing on a door tile in carry
IsPlayerStandingOnDoorTile:
	push de
	ld hl, DoorTileIDPointers
	ld a, [wCurMapTileset]
	ld de, $3
	call IsInArray
	pop de
	jr nc, .notStandingOnDoor
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	lda_coord 8, 9 ; a = lower left background tile under player's sprite
	ld b, a
.loop
	ld a, [hli]
	and a
	jr z, .notStandingOnDoor
	cp b
	jr nz, .loop
	scf
	ret
.notStandingOnDoor
	and a
	ret

INCLUDE "data/tilesets/door_tile_ids.asm"
