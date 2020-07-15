external_map: MACRO
	dn \1, \2
	dw \3
ENDM

; the appearance of towns and routes in the town map
ExternalMapEntries:
	; x, y, name
	external_map 11,  2, PalletTownName
	external_map  8,  2, ViridianCityName
	external_map  3,  2, PewterCityName
	external_map  2, 10, CeruleanCityName
	external_map  5, 14, LavenderTownName
	external_map  9, 10, VermilionCityName
	external_map  5,  7, CeladonCityName
	external_map 13,  8, FuchsiaCityName
	external_map 15,  2, CinnabarIslandName
	external_map  2,  0, IndigoPlateauName
	external_map  5, 10, SaffronCityName
	external_map  0,  0, PalletTownName ; unused
	external_map 10,  2, Route1Name
	external_map  6,  2, Route2Name
	external_map  3,  4, Route3Name
	external_map  2,  8, Route4Name
	external_map  3, 10, Route5Name
	external_map  8, 10, Route6Name
	external_map  5,  8, Route7Name
	external_map  5, 13, Route8Name
	external_map  2, 13, Route9Name
	external_map  4, 14, Route10Name
	external_map  9, 12, Route11Name
	external_map  9, 14, Route12Name
	external_map 11, 13, Route13Name
	external_map 12, 11, Route14Name
	external_map 13, 10, Route15Name
	external_map  5,  5, Route16Name
	external_map  8,  4, Route17Name
	external_map 13,  6, Route18Name
	external_map 15,  6, Route19Name
	external_map 15,  4, Route20Name
	external_map 13,  2, Route21Name
	external_map  8,  0, Route22Name
	external_map  6,  0, Route23Name
	external_map  1, 10, Route24Name
	external_map  0, 11, Route25Name


internal_map: MACRO
	db \1 + 1
	dn \2, \3
	dw \4
ENDM

; the appearance of buildings and dungeons in the town map
InternalMapEntries:
	; maximum map id subject to this rule, x, y, name
	internal_map OAKS_LAB,                      11,  2, PalletTownName
	internal_map VIRIDIAN_GYM,                   8,  2, ViridianCityName
	internal_map VIRIDIAN_FOREST_SOUTH_GATE,     6,  2, Route2Name
	internal_map VIRIDIAN_FOREST,                4,  2, ViridianForestName
	internal_map PEWTER_POKECENTER,              3,  2, PewterCityName
	internal_map MT_MOON_B2F,                    2,  6, MountMoonName
	internal_map CERULEAN_MART,                  2, 10, CeruleanCityName
	internal_map MT_MOON_POKECENTER,             2,  5, Route4Name
	internal_map CERULEAN_TRASHED_HOUSE_COPY,    2, 10, CeruleanCityName
	internal_map DAYCARE,                        4, 10, Route5Name
	internal_map UNDERGROUND_PATH_ROUTE_6_COPY,  6, 10, Route6Name
	internal_map UNDERGROUND_PATH_ROUTE_7_COPY,  5,  9, Route7Name
	internal_map UNDERGROUND_PATH_ROUTE_8,       5, 11, Route8Name
	internal_map ROCK_TUNNEL_1F,                 3, 14, RockTunnelName
	internal_map POWER_PLANT,                    4, 15, PowerPlantName
	internal_map ROUTE_11_GATE_2F,               9, 13, Route11Name
	internal_map ROUTE_12_GATE_1F,               7, 14, Route12Name
	internal_map BILLS_HOUSE,                    0, 12, SeaCottageName
	internal_map VERMILION_DOCK,                 9, 10, VermilionCityName
	internal_map SS_ANNE_B1F_ROOMS,             10,  9, SSAnneName
	internal_map VICTORY_ROAD_1F,                4,  0, VictoryRoadName
	internal_map HALL_OF_FAME,                   2,  0, PokemonLeagueName
	internal_map UNDERGROUND_PATH_NORTH_SOUTH,   5, 10, UndergroundPathName
	internal_map CHAMPIONS_ROOM,                 2,  0, PokemonLeagueName
	internal_map UNDERGROUND_PATH_WEST_EAST,     5, 10, UndergroundPathName
	internal_map CELADON_HOTEL,                  5,  7, CeladonCityName
	internal_map LAVENDER_POKECENTER,            5, 14, LavenderTownName
	internal_map POKEMON_TOWER_7F,               5, 15, PokemonTowerName
	internal_map LAVENDER_CUBONE_HOUSE,          5, 14, LavenderTownName
	internal_map WARDENS_HOUSE,                 13,  8, FuchsiaCityName
	internal_map SAFARI_ZONE_GATE,              12,  8, SafariZoneName
	internal_map FUCHSIA_MEETING_ROOM,          13,  8, FuchsiaCityName
	internal_map SEAFOAM_ISLANDS_B4F,           15,  5, SeafoamIslandsName
	internal_map VERMILION_OLD_ROD_HOUSE,        9, 10, VermilionCityName
	internal_map FUCHSIA_GOOD_ROD_HOUSE,        13,  8, FuchsiaCityName
	internal_map POKEMON_MANSION_1F,            15,  2, PokemonMansionName
	internal_map CINNABAR_MART_COPY,            15,  2, CinnabarIslandName
	internal_map INDIGO_PLATEAU_LOBBY,           2,  0, IndigoPlateauName
	internal_map MR_PSYCHICS_HOUSE,              5, 10, SaffronCityName
	internal_map ROUTE_15_GATE_2F,              13,  9, Route15Name
	internal_map ROUTE_16_FLY_HOUSE,             5,  4, Route16Name
	internal_map ROUTE_12_SUPER_ROD_HOUSE,      10, 14, Route12Name
	internal_map ROUTE_18_GATE_2F,              13,  7, Route18Name
	internal_map SEAFOAM_ISLANDS_1F,            15,  5, SeafoamIslandsName
	internal_map ROUTE_22_GATE,                  7,  0, Route22Name
	internal_map VICTORY_ROAD_2F,                4,  0, VictoryRoadName
	internal_map ROUTE_12_GATE_2F,               7, 14, Route12Name
	internal_map VERMILION_TRADE_HOUSE,          9, 10, VermilionCityName
	internal_map DIGLETTS_CAVE,                  4,  3, DiglettsCaveName
	internal_map VICTORY_ROAD_3F,                4,  0, VictoryRoadName
	internal_map UNUSED_MAP_CE,                  5,  7, RocketHQName
	internal_map SILPH_CO_8F,                    5, 10, SilphCoName
	internal_map POKEMON_MANSION_B1F,           15,  2, PokemonMansionName
	internal_map SAFARI_ZONE_NORTH_REST_HOUSE,  12,  8, SafariZoneName
	internal_map CERULEAN_CAVE_1F,               1,  9, CeruleanCaveName
	internal_map NAME_RATERS_HOUSE,              5, 14, LavenderTownName
	internal_map CERULEAN_BADGE_HOUSE,           2, 10, CeruleanCityName
	internal_map ROCK_TUNNEL_B1F,                3, 14, RockTunnelName
	internal_map SILPH_CO_ELEVATOR,              5, 10, SilphCoName
	internal_map AGATHAS_ROOM,                   2,  0, PokemonLeagueName
	db -1 ; end
