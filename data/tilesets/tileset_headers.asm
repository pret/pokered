tileset: MACRO
	db BANK(\2)   ; BANK(GFX)
	dw \1, \2, \3 ; Block, GFX, Coll
	db \4, \5, \6 ; counter tiles
	db \7         ; grass tile
	db \8         ; animations (TILEANIM_* value)
ENDM

Tilesets:
	; block, gfx, coll, 3 counter tiles, grass tile, animations
	tileset Overworld_Block,   Overworld_GFX,   Overworld_Coll,   $FF,$FF,$FF, $52, TILEANIM_WATER_FLOWER
	tileset RedsHouse1_Block,  RedsHouse1_GFX,  RedsHouse1_Coll,  $FF,$FF,$FF, $FF, TILEANIM_NONE
	tileset Mart_Block,        Mart_GFX,        Mart_Coll,        $18,$19,$1E, $FF, TILEANIM_NONE
	tileset Forest_Block,      Forest_GFX,      Forest_Coll,      $FF,$FF,$FF, $20, TILEANIM_WATER
	tileset RedsHouse2_Block,  RedsHouse2_GFX,  RedsHouse2_Coll,  $FF,$FF,$FF, $FF, TILEANIM_NONE
	tileset Dojo_Block,        Dojo_GFX,        Dojo_Coll,        $3A,$FF,$FF, $FF, TILEANIM_WATER_FLOWER
	tileset Pokecenter_Block,  Pokecenter_GFX,  Pokecenter_Coll,  $18,$19,$1E, $FF, TILEANIM_NONE
	tileset Gym_Block,         Gym_GFX,         Gym_Coll,         $3A,$FF,$FF, $FF, TILEANIM_WATER_FLOWER
	tileset House_Block,       House_GFX,       House_Coll,       $FF,$FF,$FF, $FF, TILEANIM_NONE
	tileset ForestGate_Block,  ForestGate_GFX,  ForestGate_Coll,  $17,$32,$FF, $FF, TILEANIM_NONE
	tileset Museum_Block,      Museum_GFX,      Museum_Coll,      $17,$32,$FF, $FF, TILEANIM_NONE
	tileset Underground_Block, Underground_GFX, Underground_Coll, $FF,$FF,$FF, $FF, TILEANIM_NONE
	tileset Gate_Block,        Gate_GFX,        Gate_Coll,        $17,$32,$FF, $FF, TILEANIM_NONE
	tileset Ship_Block,        Ship_GFX,        Ship_Coll,        $FF,$FF,$FF, $FF, TILEANIM_WATER
	tileset ShipPort_Block,    ShipPort_GFX,    ShipPort_Coll,    $FF,$FF,$FF, $FF, TILEANIM_WATER
	tileset Cemetery_Block,    Cemetery_GFX,    Cemetery_Coll,    $12,$FF,$FF, $FF, TILEANIM_NONE
	tileset Interior_Block,    Interior_GFX,    Interior_Coll,    $FF,$FF,$FF, $FF, TILEANIM_NONE
	tileset Cavern_Block,      Cavern_GFX,      Cavern_Coll,      $FF,$FF,$FF, $FF, TILEANIM_WATER
	tileset Lobby_Block,       Lobby_GFX,       Lobby_Coll,       $15,$36,$FF, $FF, TILEANIM_NONE
	tileset Mansion_Block,     Mansion_GFX,     Mansion_Coll,     $FF,$FF,$FF, $FF, TILEANIM_NONE
	tileset Lab_Block,         Lab_GFX,         Lab_Coll,         $FF,$FF,$FF, $FF, TILEANIM_NONE
	tileset Club_Block,        Club_GFX,        Club_Coll,        $07,$17,$FF, $FF, TILEANIM_NONE
	tileset Facility_Block,    Facility_GFX,    Facility_Coll,    $12,$FF,$FF, $FF, TILEANIM_WATER
	tileset Plateau_Block,     Plateau_GFX,     Plateau_Coll,     $FF,$FF,$FF, $45, TILEANIM_WATER
