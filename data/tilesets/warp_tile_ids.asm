WarpTileIDPointers:
	dw .OverworldWarpTileIDs
	dw .RedsHouse1WarpTileIDs
	dw .MartWarpTileIDs
	dw .ForestWarpTileIDs
	dw .RedsHouse2WarpTileIDs
	dw .DojoWarpTileIDs
	dw .PokecenterWarpTileIDs
	dw .GymWarpTileIDs
	dw .HouseWarpTileIDs
	dw .ForestGateWarpTileIDs
	dw .MuseumWarpTileIDs
	dw .UndergroundWarpTileIDs
	dw .GateWarpTileIDs
	dw .ShipWarpTileIDs
	dw .ShipPortWarpTileIDs
	dw .CemeteryWarpTileIDs
	dw .InteriorWarpTileIDs
	dw .CavernWarpTileIDs
	dw .LobbyWarpTileIDs
	dw .MansionWarpTileIDs
	dw .LabWarpTileIDs
	dw .ClubWarpTileIDs
	dw .FacilityWarpTileIDs
	dw .PlateauWarpTileIDs

.OverworldWarpTileIDs:
	db $1B, $58
	db -1 ; end

.ForestGateWarpTileIDs:
.MuseumWarpTileIDs:
.GateWarpTileIDs:
	db $3B
	; fallthrough
.RedsHouse1WarpTileIDs:
.RedsHouse2WarpTileIDs:
	db $1A, $1C
	db -1 ; end

.MartWarpTileIDs:
.PokecenterWarpTileIDs:
	db $5E
	db -1 ; end

.ForestWarpTileIDs:
	db $5A, $5C, $3A
	db -1 ; end

.DojoWarpTileIDs:
.GymWarpTileIDs:
	db $4A
	db -1 ; end

.HouseWarpTileIDs:
	db $54, $5C, $32
	db -1 ; end

.ShipWarpTileIDs:
	db $37, $39, $1E, $4A
	db -1 ; end

.InteriorWarpTileIDs:
	db $15, $55, $04
	db -1 ; end

.CavernWarpTileIDs:
	db $18, $1A, $22
	db -1 ; end

.LobbyWarpTileIDs:
	db $1A, $1C, $38
	db -1 ; end

.MansionWarpTileIDs:
	db $1A, $1C, $53
	db -1 ; end

.LabWarpTileIDs:
	db $34
	db -1 ; end

.FacilityWarpTileIDs:
	db $43, $58, $20
	; fallthrough
.CemeteryWarpTileIDs:
	db $1B
	; fallthrough
.UndergroundWarpTileIDs:
	db $13
	db -1 ; end

.PlateauWarpTileIDs:
	db $1B, $3B
	; fallthrough
.ShipPortWarpTileIDs:
.ClubWarpTileIDs:
	db -1 ; end
