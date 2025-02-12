; PureRGBnote: ADDED: Many new hidden items were added versus the original game

MACRO hidden_item
	db \1, \3, \2
ENDM

HiddenItemCoords:
	table_width 3
	; map id, x, y
	hidden_item VIRIDIAN_FOREST,                1,  18
	hidden_item VIRIDIAN_FOREST,               16,  42
	hidden_item MT_MOON_B2F,                   18,  12
	hidden_item ROUTE_25,                      38,   5
	hidden_item ROUTE_9,                       14,   7
	hidden_item ROUTE_9,                       32,   3
	hidden_item SS_ANNE_KITCHEN,               13,   9
	hidden_item SS_ANNE_B1F_ROOMS,              3,   1
	hidden_item ROUTE_10,                       9,  17
	hidden_item ROUTE_10,                      16,  53
	hidden_item ROCKET_HIDEOUT_B1F,            21,  15
	hidden_item ROCKET_HIDEOUT_B3F,            27,  17
	hidden_item ROCKET_HIDEOUT_B4F,            25,   1
	hidden_item POKEMON_TOWER_5F,               4,  12
	hidden_item ROUTE_13,                       1,  14
	hidden_item ROUTE_13,                      16,  13
	hidden_item ROUTE_13,                      42,   5
	hidden_item POKEMON_MANSION_B1F,            1,   9
	hidden_item SAFARI_ZONE_CENTER,             4,  14
	hidden_item SAFARI_ZONE_WEST,               6,   5
	hidden_item SILPH_CO_5F,                   12,   3
	hidden_item SILPH_CO_9F,                    2,  15
	hidden_item SILPH_CO_9F,                   10,   7
	hidden_item COPYCATS_HOUSE_2F,              1,   1
	hidden_item CERULEAN_CAVE_1F,              14,  11
	hidden_item CERULEAN_CAVE_B1F,             27,   3
	hidden_item POWER_PLANT,                   17,  16
	hidden_item POWER_PLANT,                   12,   1
	hidden_item SEAFOAM_ISLANDS_B2F,           15,  15
	hidden_item SEAFOAM_ISLANDS_B4F,           25,  17
	hidden_item POKEMON_MANSION_1F,             8,  16
	hidden_item POKEMON_MANSION_3F,             1,   9
	hidden_item ROUTE_23,                       9,  44
	hidden_item ROUTE_23,                      19,  70
	hidden_item ROUTE_23,                       8,  90
	hidden_item VICTORY_ROAD_2F,                5,   2
	hidden_item VICTORY_ROAD_2F,               26,   7
	hidden_item VIRIDIAN_CITY,                 14,   4
	hidden_item ROUTE_11,                      48,   5
	hidden_item ROUTE_12,                       2,  63
	hidden_item ROUTE_17,                      14,  15
	hidden_item ROUTE_17,                       9,  45
	hidden_item ROUTE_17,                      16,  72
	hidden_item ROUTE_17,                       4,  90
	hidden_item ROUTE_17,                       9, 121
	hidden_item UNDERGROUND_PATH_NORTH_SOUTH,   3,   4
	hidden_item UNDERGROUND_PATH_NORTH_SOUTH,   4,  34
	hidden_item UNDERGROUND_PATH_WEST_EAST,    12,   2
	hidden_item UNDERGROUND_PATH_WEST_EAST,    21,   5
	hidden_item CELADON_CITY,                  48,  15
	hidden_item CELADON_CITY,                   3,   2
	hidden_item CELADON_CITY,                  48,   7
	hidden_item ROUTE_25,                      10,   3
	hidden_item MT_MOON_B2F,                   33,   9
	hidden_item SEAFOAM_ISLANDS_B3F,            9,  16
	hidden_item VERMILION_CITY,                14,  11
	hidden_item CERULEAN_CITY,                 15,   8
	hidden_item ROUTE_4,                       40,   3
	hidden_item ROUTE_2,					   18,  66
	hidden_item ROUTE_6,					    6,   4
	hidden_item ROUTE_8,					   34,  14
	hidden_item ROUTE_8,					   19,   5
	hidden_item ROUTE_14,					    4,  19
	hidden_item ROUTE_16,					    2,   2
	hidden_item ROUTE_18,					    7,   9
	hidden_item PEWTER_CITY,				   23,   2
	hidden_item SAFARI_ZONE_NORTH,			    7,  13
	hidden_item SECRET_LAB,                     9,  25
	hidden_item CINNABAR_VOLCANO,              43,  64
	assert_max_table_length MAX_HIDDEN_ITEMS
	db -1 ; end
