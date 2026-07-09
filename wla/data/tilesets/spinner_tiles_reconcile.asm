; Spinner arrows: each entry is a DW pair of (source tile pointer, size), followed by dest tile pointer + size
; Format per arrow: .DW src_tile ptr, .DB size, .DB BANK(src), .DW vTileset dest ptr, repeat for size bytes
FacilitySpinnerArrows::
.DW SpinnerArrowAnimTiles tile 0
.DB 1
.DB BANK(SpinnerArrowAnimTiles)
.DW vTileset tile $20
.DW SpinnerArrowAnimTiles tile 1
.DB 1
.DB BANK(SpinnerArrowAnimTiles)
.DW vTileset tile $21
.DW SpinnerArrowAnimTiles tile 2
.DB 1
.DB BANK(SpinnerArrowAnimTiles)
.DW vTileset tile $30
.DW SpinnerArrowAnimTiles tile 3
.DB 1
.DB BANK(SpinnerArrowAnimTiles)
.DW vTileset tile $31
.GymSpinnerArrows::
.DW SpinnerArrowAnimTiles tile 1
.DB 1
.DB BANK(SpinnerArrowAnimTiles)
.DW vTileset tile $3C
.DW SpinnerArrowAnimTiles tile 3
.DB 1
.DB BANK(SpinnerArrowAnimTiles)
.DW vTileset tile $3D
.DW SpinnerArrowAnimTiles tile 0
.DB 1
.DB BANK(SpinnerArrowAnimTiles)
.DW vTileset tile $4C
.DW SpinnerArrowAnimTiles tile 2
.DB 1
.DB BANK(SpinnerArrowAnimTiles)
.DW vTileset tile $4D
