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
.DW Facility_GFX tile $20
.DB 1
.DB BANK(Facility_GFX)
.DW vTileset tile $20
.DW Facility_GFX tile $21
.DB 1
.DB BANK(Facility_GFX)
.DW vTileset tile $21
.DW Facility_GFX tile $30
.DB 1
.DB BANK(Facility_GFX)
.DW vTileset tile $30
.DW Facility_GFX tile $31
.DB 1
.DB BANK(Facility_GFX)
.DW vTileset tile $31

GymSpinnerArrows::
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
.DW Gym_GFX tile $3C
.DB 1
.DB BANK(Gym_GFX)
.DW vTileset tile $3C
.DW Gym_GFX tile $3D
.DB 1
.DB BANK(Gym_GFX)
.DW vTileset tile $3D
.DW Gym_GFX tile $4C
.DB 1
.DB BANK(Gym_GFX)
.DW vTileset tile $4C
.DW Gym_GFX tile $4D
.DB 1
.DB BANK(Gym_GFX)
.DW vTileset tile $4D
