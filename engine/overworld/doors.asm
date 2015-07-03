; returns whether the player is standing on a door tile in carry
IsPlayerStandingOnDoorTile: ; 1a609 (6:6609)
	push de
	ld hl, DoorTileIDPointers
	ld a, [W_CURMAPTILESET]
	ld de, $3
	call IsInArray
	pop de
	jr nc, .notStandingOnDoor
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	aCoord 8, 9 ; a = lower left background tile under player's sprite
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

DoorTileIDPointers: ; 1a62c (6:662c)
	db OVERWORLD
	dw OverworldDoorTileIDs
	db FOREST
	dw ForestDoorTileIDs
	db MART
	dw MartDoorTileIDs
	db HOUSE
	dw HouseDoorTileIDs
	db FOREST_GATE
	dw TilesetMuseumDoorTileIDs
	db MUSEUM
	dw TilesetMuseumDoorTileIDs
	db GATE
	dw TilesetMuseumDoorTileIDs
	db SHIP
	dw ShipDoorTileIDs
	db LOBBY
	dw LobbyDoorTileIDs
	db MANSION
	dw MansionDoorTileIDs
	db LAB
	dw LabDoorTileIDs
	db FACILITY
	dw FacilityDoorTileIDs
	db PLATEAU
	dw PlateauDoorTileIDs
	db $ff

OverworldDoorTileIDs: ; 1a654 (6:6654)
	db $1B,$58,$00

ForestDoorTileIDs: ; 1a657 (6:6657)
	db $3a,$00

MartDoorTileIDs: ; 1a659 (6:6659)
	db $5e,$00

HouseDoorTileIDs: ; 1a65b (6:665b)
	db $54,$00

TilesetMuseumDoorTileIDs: ; 1a65d (6:665d)
	db $3b,$00

ShipDoorTileIDs: ; 1a65f (6:665f)
	db $1e,$00

LobbyDoorTileIDs: ; 1a661 (6:6661)
	db $1c,$38,$1a,$00

MansionDoorTileIDs: ; 1a665 (6:6665)
	db $1a,$1c,$53,$00

LabDoorTileIDs: ; 1a669 (6:6669)
	db $34,$00

FacilityDoorTileIDs: ; 1a66b (6:666b)
	db $43,$58,$1b,$00

PlateauDoorTileIDs: ; 1a66f (6:666f)
	db $3b,$1b,$00
