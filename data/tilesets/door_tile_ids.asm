DoorTileIDPointers:
	dbw OVERWORLD,   OverworldDoorTileIDs
	dbw FOREST,      ForestDoorTileIDs
	dbw MART,        MartDoorTileIDs
	dbw HOUSE,       HouseDoorTileIDs
	dbw FOREST_GATE, TilesetMuseumDoorTileIDs
	dbw MUSEUM,      TilesetMuseumDoorTileIDs
	dbw GATE,        TilesetMuseumDoorTileIDs
	dbw SHIP,        ShipDoorTileIDs
	dbw LOBBY,       LobbyDoorTileIDs
	dbw MANSION,     MansionDoorTileIDs
	dbw LAB,         LabDoorTileIDs
	dbw FACILITY,    FacilityDoorTileIDs
	dbw PLATEAU,     PlateauDoorTileIDs
	db $ff

OverworldDoorTileIDs:
	db $1B,$58,$00

ForestDoorTileIDs:
	db $3a,$00

MartDoorTileIDs:
	db $5e,$00

HouseDoorTileIDs:
	db $54,$00

TilesetMuseumDoorTileIDs:
	db $3b,$00

ShipDoorTileIDs:
	db $1e,$00

LobbyDoorTileIDs:
	db $1c,$38,$1a,$00

MansionDoorTileIDs:
	db $1a,$1c,$53,$00

LabDoorTileIDs:
	db $34,$00

FacilityDoorTileIDs:
	db $43,$58,$1b,$00

PlateauDoorTileIDs:
	db $3b,$1b,$00
