MACRO outdoor_map
	dn \2, \1
	dw \3
ENDM

; the appearance of towns and routes in the town map
ExternalMapEntries:
	table_width 3
	; x, y, name
	outdoor_map  2, 11, PalletTownName
	outdoor_map  2,  8, ViridianCityName
	outdoor_map  2,  3, PewterCityName
	outdoor_map 10,  2, CeruleanCityName
	outdoor_map 14,  5, LavenderTownName
	outdoor_map 10,  9, VermilionCityName
	outdoor_map  7,  5, CeladonCityName
	outdoor_map  8, 13, FuchsiaCityName
	outdoor_map  2, 15, CinnabarIslandName
	outdoor_map  0,  2, IndigoPlateauName
	outdoor_map 10,  5, SaffronCityName
	outdoor_map  0,  0, PalletTownName ; unused
	outdoor_map  2, 10, Route1Name
	outdoor_map  2,  6, Route2Name
	outdoor_map  4,  3, Route3Name
	outdoor_map  8,  2, Route4Name
	outdoor_map 10,  3, Route5Name
	outdoor_map 10,  8, Route6Name
	outdoor_map  8,  5, Route7Name
	outdoor_map 13,  5, Route8Name
	outdoor_map 13,  2, Route9Name
	outdoor_map 14,  4, Route10Name
	outdoor_map 12,  9, Route11Name
	outdoor_map 14,  9, Route12Name
	outdoor_map 13, 11, Route13Name
	outdoor_map 11, 12, Route14Name
	outdoor_map 10, 13, Route15Name
	outdoor_map  5,  5, Route16Name
	outdoor_map  4,  8, Route17Name
	outdoor_map  6, 13, Route18Name
	outdoor_map  6, 15, Route19Name
	outdoor_map  4, 15, Route20Name
	outdoor_map  2, 13, Route21Name
	outdoor_map  0,  8, Route22Name
	outdoor_map  0,  6, Route23Name
	outdoor_map 10,  1, Route24Name
	outdoor_map 11,  0, Route25Name
	assert_table_length FIRST_INDOOR_MAP


MACRO indoor_map
	db INDOORGROUP_\1
	dn \3, \2
	dw \4
ENDM

; the appearance of buildings and dungeons in the town map
InternalMapEntries:
	table_width 4
	; indoor map group, x, y, name
	indoor_map PALLET_TOWN,         2, 11, PalletTownName
	indoor_map VIRIDIAN_CITY,       2,  8, ViridianCityName
	indoor_map ROUTE_2,             2,  6, Route2Name
	indoor_map VIRIDIAN_FOREST,     2,  4, ViridianForestName
	indoor_map PEWTER_CITY,         2,  3, PewterCityName
	indoor_map MT_MOON,             6,  2, MountMoonName
	indoor_map CERULEAN_CITY,      10,  2, CeruleanCityName
	indoor_map ROUTE_4,             5,  2, Route4Name
	indoor_map CERULEAN_CITY_2,    10,  2, CeruleanCityName
	indoor_map ROUTE_5,            10,  4, Route5Name
	indoor_map ROUTE_6,            10,  6, Route6Name
	indoor_map ROUTE_7,             9,  5, Route7Name
	indoor_map ROUTE_8,            11,  5, Route8Name
	indoor_map ROCK_TUNNEL,        14,  3, RockTunnelName
	indoor_map POWER_PLANT,        15,  4, PowerPlantName
	indoor_map ROUTE_11,           13,  9, Route11Name
	indoor_map ROUTE_12,           14,  7, Route12Name
	indoor_map SEA_COTTAGE,        12,  0, SeaCottageName
	indoor_map VERMILION_CITY,     10,  9, VermilionCityName
	indoor_map SS_ANNE,             9, 10, SSAnneName
	indoor_map VICTORY_ROAD,        0,  4, VictoryRoadName
	indoor_map POKEMON_LEAGUE,      0,  2, PokemonLeagueName
	indoor_map UNDERGROUND_PATH,   10,  5, UndergroundPathName
	indoor_map POKEMON_LEAGUE_2,    0,  2, PokemonLeagueName
	indoor_map UNDERGROUND_PATH_2, 10,  5, UndergroundPathName
	indoor_map CELADON_CITY,        7,  5, CeladonCityName
	indoor_map LAVENDER_TOWN,      14,  5, LavenderTownName
	indoor_map POKEMON_TOWER,      15,  5, PokemonTowerName
	indoor_map LAVENDER_TOWN_2,    14,  5, LavenderTownName
	indoor_map FUCHSIA_CITY,        8, 13, FuchsiaCityName
	indoor_map SAFARI_ZONE,         8, 12, SafariZoneName
	indoor_map FUCHSIA_CITY_2,      8, 13, FuchsiaCityName
	indoor_map SEAFOAM_ISLANDS,     5, 15, SeafoamIslandsName
	indoor_map VERMILION_CITY_2,   10,  9, VermilionCityName
	indoor_map FUCHSIA_CITY_3,      8, 13, FuchsiaCityName
	indoor_map POKEMON_MANSION,     2, 15, PokemonMansionName
	indoor_map CINNABAR_ISLAND,     2, 15, CinnabarIslandName
	indoor_map INDIGO_PLATEAU,      0,  2, IndigoPlateauName
	indoor_map SAFFRON_CITY,       10,  5, SaffronCityName
	indoor_map ROUTE_15,            9, 13, Route15Name
	indoor_map ROUTE_16,            4,  5, Route16Name
	indoor_map ROUTE_12_2,         14, 10, Route12Name
	indoor_map ROUTE_18,            7, 13, Route18Name
	indoor_map SEAFOAM_ISLANDS_2,   5, 15, SeafoamIslandsName
	indoor_map ROUTE_22,            0,  7, Route22Name
	indoor_map VICTORY_ROAD_2,      0,  4, VictoryRoadName
	indoor_map ROUTE_12_3,         14,  7, Route12Name
	indoor_map VERMILION_CITY_3,   10,  9, VermilionCityName
	indoor_map DIGLETTS_CAVE,       3,  4, DiglettsCaveName
	indoor_map VICTORY_ROAD_3,      0,  4, VictoryRoadName
	indoor_map ROCKET_HQ,           7,  5, RocketHQName
	indoor_map SILPH_CO,           10,  5, SilphCoName
	indoor_map POKEMON_MANSION_2,   2, 15, PokemonMansionName
	indoor_map SAFARI_ZONE_2,       8, 12, SafariZoneName
	indoor_map CERULEAN_CAVE,       9,  1, CeruleanCaveName
	indoor_map LAVENDER_TOWN_3,    14,  5, LavenderTownName
	indoor_map CERULEAN_CITY_3,    10,  2, CeruleanCityName
	indoor_map ROCK_TUNNEL_2,      14,  3, RockTunnelName
	indoor_map SILPH_CO_2,         10,  5, SilphCoName
	indoor_map POKEMON_LEAGUE_3,    0,  2, PokemonLeagueName
	assert_table_length NUM_INDOOR_MAP_GROUPS
	db -1 ; end
