tileset: MACRO
	db BANK(\2)   ; BANK(GFX)
	dw \1, \2, \3 ; Block, GFX, Coll
	db \4, \5, \6 ; counter tiles
	db \7         ; grass tile
	db \8         ; permission (indoor, cave, outdoor)
ENDM

Tilesets:
	; block, gfx, coll, 3 counter tiles, grass tile, permission
	tileset Overworld_Block,   Overworld_GFX,   Overworld_Coll,   $FF,$FF,$FF, $52, ANIMATED_FLOWERS_WATER
	tileset RedsHouse1_Block,  RedsHouse1_GFX,  RedsHouse1_Coll,  $FF,$FF,$FF, $FF, STATIC_FLOWERS_WATER
	tileset Mart_Block,        Mart_GFX,        Mart_Coll,        $18,$19,$1E, $FF, STATIC_FLOWERS_WATER
	tileset Forest_Block,      Forest_GFX,      Forest_Coll,      $FF,$FF,$FF, $20, STATIC_FLOWERS_ANIMATED_WATER
	tileset RedsHouse2_Block,  RedsHouse2_GFX,  RedsHouse2_Coll,  $FF,$FF,$FF, $FF, STATIC_FLOWERS_WATER
	tileset Dojo_Block,        Dojo_GFX,        Dojo_Coll,        $3A,$FF,$FF, $FF, ANIMATED_FLOWERS_WATER
	tileset Pokecenter_Block,  Pokecenter_GFX,  Pokecenter_Coll,  $18,$19,$1E, $FF, STATIC_FLOWERS_WATER
	tileset Gym_Block,         Gym_GFX,         Gym_Coll,         $3A,$FF,$FF, $FF, ANIMATED_FLOWERS_WATER
	tileset House_Block,       House_GFX,       House_Coll,       $FF,$FF,$FF, $FF, STATIC_FLOWERS_WATER
	tileset ForestGate_Block,  ForestGate_GFX,  ForestGate_Coll,  $17,$32,$FF, $FF, STATIC_FLOWERS_WATER
	tileset Museum_Block,      Museum_GFX,      Museum_Coll,      $17,$32,$FF, $FF, STATIC_FLOWERS_WATER
	tileset Underground_Block, Underground_GFX, Underground_Coll, $FF,$FF,$FF, $FF, STATIC_FLOWERS_WATER
	tileset Gate_Block,        Gate_GFX,        Gate_Coll,        $17,$32,$FF, $FF, STATIC_FLOWERS_WATER
	tileset Ship_Block,        Ship_GFX,        Ship_Coll,        $FF,$FF,$FF, $FF, STATIC_FLOWERS_ANIMATED_WATER
	tileset ShipPort_Block,    ShipPort_GFX,    ShipPort_Coll,    $FF,$FF,$FF, $FF, STATIC_FLOWERS_ANIMATED_WATER
	tileset Cemetery_Block,    Cemetery_GFX,    Cemetery_Coll,    $12,$FF,$FF, $FF, STATIC_FLOWERS_WATER
	tileset Interior_Block,    Interior_GFX,    Interior_Coll,    $FF,$FF,$FF, $FF, STATIC_FLOWERS_WATER
	tileset Cavern_Block,      Cavern_GFX,      Cavern_Coll,      $FF,$FF,$FF, $FF, STATIC_FLOWERS_ANIMATED_WATER
	tileset Lobby_Block,       Lobby_GFX,       Lobby_Coll,       $15,$36,$FF, $FF, STATIC_FLOWERS_WATER
	tileset Mansion_Block,     Mansion_GFX,     Mansion_Coll,     $FF,$FF,$FF, $FF, STATIC_FLOWERS_WATER
	tileset Lab_Block,         Lab_GFX,         Lab_Coll,         $FF,$FF,$FF, $FF, STATIC_FLOWERS_WATER
	tileset Club_Block,        Club_GFX,        Club_Coll,        $07,$17,$FF, $FF, STATIC_FLOWERS_WATER
	tileset Facility_Block,    Facility_GFX,    Facility_Coll,    $12,$FF,$FF, $FF, STATIC_FLOWERS_ANIMATED_WATER
	tileset Plateau_Block,     Plateau_GFX,     Plateau_Coll,     $FF,$FF,$FF, $45, STATIC_FLOWERS_ANIMATED_WATER
