; Format: bank label, pointer target — DW pairs of (bank, offset)
DoorTileIDPointers::
.DW OVERWORLD,   .OverworldDoorTileIDs
.DW FOREST,      .ForestDoorTileIDs
.DW MART,        .MartDoorTileIDs
.DW HOUSE,       .HouseDoorTileIDs
.DW FOREST_GATE, .TilesetMuseumDoorTileIDs
.DW MUSEUM,      .TilesetMuseumDoorTileIDs
.DW GATE,        .TilesetMuseumDoorTileIDs
.DW SHIP,        .ShipDoorTileIDs
.DW LOBBY,       .LobbyDoorTileIDs
.DW MANSION,     .MansionDoorTileIDs
.DW LAB,         .LabDoorTileIDs
.DW FACILITY,    .FacilityDoorTileIDs
.DW PLATEAU,     .PlateauDoorTileIDs
.DB 0 ; end

.OverworldDoorTileIDs:
.DB $1B, $58

.ForestDoorTileIDs:
.DB $3a

.MartDoorTileIDs:
.DB $5e

.HouseDoorTileIDs:
.DB $54

.TilesetMuseumDoorTileIDs:
.DB $3b

.ShipDoorTileIDs:
.DB $1e

.LobbyDoorTileIDs:
.DB $1c, $38, $1a

.MansionDoorTileIDs:
.DB $1a, $1c, $53

.LabDoorTileIDs:
.DB $34

.FacilityDoorTileIDs:
.DB $43, $58, $1b

.PlateauDoorTileIDs:
.DB $3b, $1b
