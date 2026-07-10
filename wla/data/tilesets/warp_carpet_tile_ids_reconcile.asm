WarpTileListPointers:
.DW .FacingDownWarpTiles
.DW .FacingUpWarpTiles
.DW .FacingLeftWarpTiles
.DW .FacingRightWarpTiles

.FacingDownWarpTiles:
.DB $01, $12, $17, $3D, $04, $18, $33, -1

.FacingUpWarpTiles:
.DB $01, $5C, -1

.FacingLeftWarpTiles:
.DB $1A, $4B, -1

.FacingRightWarpTiles:
.DB $0F, $4E, -1
