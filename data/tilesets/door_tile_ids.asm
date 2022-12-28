DoorTileIDPointers:
	dbw OVERWORLD,   .OverworldDoorTileIDs
	dbw FOREST,      .ForestDoorTileIDs
	dbw MART,        .MartDoorTileIDs
	dbw HOUSE,       .HouseDoorTileIDs
	dbw FOREST_GATE, .TilesetMuseumDoorTileIDs
	dbw MUSEUM,      .TilesetMuseumDoorTileIDs
	dbw GATE,        .TilesetMuseumDoorTileIDs
	dbw SHIP,        .ShipDoorTileIDs
	dbw LOBBY,       .LobbyDoorTileIDs
	dbw MANSION,     .MansionDoorTileIDs
	dbw LAB,         .LabDoorTileIDs
	dbw FACILITY,    .FacilityDoorTileIDs
	dbw PLATEAU,     .PlateauDoorTileIDs
	db -1 ; end

MACRO door_tiles
	IF _NARG
		db \# ; all args
	ENDC
	db 0 ; end
ENDM

.OverworldDoorTileIDs:
	door_tiles $1B, $58

.ForestDoorTileIDs:
	door_tiles $3a

.MartDoorTileIDs:
	door_tiles $5e

.HouseDoorTileIDs:
	door_tiles $54

.TilesetMuseumDoorTileIDs:
	door_tiles $3b

.ShipDoorTileIDs:
	door_tiles $1e

.LobbyDoorTileIDs:
	door_tiles $1c, $38, $1a

.MansionDoorTileIDs:
	door_tiles $1a, $1c, $53

.LabDoorTileIDs:
	door_tiles $34

.FacilityDoorTileIDs:
	door_tiles $43, $58, $1b

.PlateauDoorTileIDs:
	door_tiles $3b, $1b
