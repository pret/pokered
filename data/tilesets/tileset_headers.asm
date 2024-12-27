MACRO tileset
	db BANK(\1_GFX)
	dw \1_Block, \1_GFX, \1_Coll
	db \2, \3, \4 ; counter tiles
	db \5         ; grass tile
	db \6         ; animations (TILEANIM_* value)
ENDM

Tilesets:
	table_width 12
	; name, 3 counter tiles, grass tile, animations
	tileset Overworld,    -1, -1, -1, $52, TILEANIM_WATER_FLOWER
	tileset RedsHouse1,   -1, -1, -1,  -1, TILEANIM_NONE
	tileset Mart,        $18,$19,$1E,  -1, TILEANIM_NONE
	tileset Forest,       -1, -1, -1, $20, TILEANIM_WATER
	tileset RedsHouse2,   -1, -1, -1,  -1, TILEANIM_NONE
	tileset Dojo,        $3A, -1, -1,  -1, TILEANIM_WATER_FLOWER
	tileset Pokecenter,  $18,$19,$1E,  -1, TILEANIM_NONE
	tileset Gym,         $3A, -1, -1,  -1, TILEANIM_WATER_FLOWER
	tileset House,        -1, -1, -1,  -1, TILEANIM_NONE
	tileset ForestGate,  $17,$32, -1,  -1, TILEANIM_NONE
	tileset Museum,      $17,$32, -1,  -1, TILEANIM_NONE
	tileset Underground,  -1, -1, -1,  -1, TILEANIM_NONE
	tileset Gate,        $17,$32, -1,  -1, TILEANIM_NONE
	tileset Ship,         -1, -1, -1,  -1, TILEANIM_WATER
	tileset ShipPort,     -1, -1, -1,  -1, TILEANIM_WATER
	tileset Cemetery,    $12, -1, -1,  -1, TILEANIM_NONE
	tileset Interior,     -1, -1, -1,  -1, TILEANIM_NONE
	tileset Cavern,       -1, -1, -1,  -1, TILEANIM_WATER
	tileset Lobby,       $15,$36, -1,  -1, TILEANIM_NONE
	tileset Mansion,      -1, -1, -1,  -1, TILEANIM_NONE
	tileset Lab,          -1, -1, -1,  -1, TILEANIM_NONE
	tileset Club,        $07,$17, -1,  -1, TILEANIM_NONE
	tileset Facility,    $12, -1, -1,  -1, TILEANIM_WATER
	tileset Plateau,      -1, -1, -1, $45, TILEANIM_WATER
	assert_table_length NUM_TILESETS
