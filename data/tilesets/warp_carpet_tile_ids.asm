WarpTileListPointers:
	dw .FacingDownWarpTiles
	dw .FacingUpWarpTiles
	dw .FacingLeftWarpTiles
	dw .FacingRightWarpTiles

warp_tiles: MACRO
REPT _NARG
	db \1
	shift
ENDR
	db -1 ; end
ENDM

.FacingDownWarpTiles:
	warp_tiles $01, $12, $17, $3D, $04, $18, $33

.FacingUpWarpTiles:
	warp_tiles $01, $5C

.FacingLeftWarpTiles:
	warp_tiles $1A, $4B

.FacingRightWarpTiles:
	warp_tiles $0F, $4E
