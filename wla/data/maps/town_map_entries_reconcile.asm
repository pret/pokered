
; the appearance of towns and routes in the town map
ExternalMapEntries:
	; x, y, name
	.DB ((11 & $F) << 4) | (2 & $F)
	.DW PalletTownName
	.DB ((8 & $F) << 4) | (2 & $F)
	.DW ViridianCityName
	.DB ((3 & $F) << 4) | (2 & $F)
	.DW PewterCityName
	.DB ((2 & $F) << 4) | (10 & $F)
	.DW CeruleanCityName
	.DB ((5 & $F) << 4) | (14 & $F)
	.DW LavenderTownName
	.DB ((9 & $F) << 4) | (10 & $F)
	.DW VermilionCityName
	.DB ((5 & $F) << 4) | (7 & $F)
	.DW CeladonCityName
	.DB ((13 & $F) << 4) | (8 & $F)
	.DW FuchsiaCityName
	.DB ((15 & $F) << 4) | (2 & $F)
	.DW CinnabarIslandName
	.DB ((2 & $F) << 4) | (0 & $F)
	.DW IndigoPlateauName
	.DB ((5 & $F) << 4) | (10 & $F)
	.DW SaffronCityName
	.DB ((0 & $F) << 4) | (0 & $F)
	.DW PalletTownName
	.DB ((10 & $F) << 4) | (2 & $F)
	.DW Route1Name
	.DB ((6 & $F) << 4) | (2 & $F)
	.DW Route2Name
	.DB ((3 & $F) << 4) | (4 & $F)
	.DW Route3Name
	.DB ((2 & $F) << 4) | (8 & $F)
	.DW Route4Name
	.DB ((3 & $F) << 4) | (10 & $F)
	.DW Route5Name
	.DB ((8 & $F) << 4) | (10 & $F)
	.DW Route6Name
	.DB ((5 & $F) << 4) | (8 & $F)
	.DW Route7Name
	.DB ((5 & $F) << 4) | (13 & $F)
	.DW Route8Name
	.DB ((2 & $F) << 4) | (13 & $F)
	.DW Route9Name
	.DB ((4 & $F) << 4) | (14 & $F)
	.DW Route10Name
	.DB ((9 & $F) << 4) | (12 & $F)
	.DW Route11Name
	.DB ((9 & $F) << 4) | (14 & $F)
	.DW Route12Name
	.DB ((11 & $F) << 4) | (13 & $F)
	.DW Route13Name
	.DB ((12 & $F) << 4) | (11 & $F)
	.DW Route14Name
	.DB ((13 & $F) << 4) | (10 & $F)
	.DW Route15Name
	.DB ((5 & $F) << 4) | (5 & $F)
	.DW Route16Name
	.DB ((8 & $F) << 4) | (4 & $F)
	.DW Route17Name
	.DB ((13 & $F) << 4) | (6 & $F)
	.DW Route18Name
	.DB ((15 & $F) << 4) | (6 & $F)
	.DW Route19Name
	.DB ((15 & $F) << 4) | (4 & $F)
	.DW Route20Name
	.DB ((13 & $F) << 4) | (2 & $F)
	.DW Route21Name
	.DB ((8 & $F) << 4) | (0 & $F)
	.DW Route22Name
	.DB ((6 & $F) << 4) | (0 & $F)
	.DW Route23Name
	.DB ((1 & $F) << 4) | (10 & $F)
	.DW Route24Name
	.DB ((0 & $F) << 4) | (11 & $F)
	.DW Route25Name



; the appearance of buildings and dungeons in the town map
InternalMapEntries:
	; indoor map group, x, y, name
	.DB INDOORGROUP_PALLET_TOWN
	.DB ((11 & $F) << 4) | (2 & $F)
	.DW PalletTownName
	.DB INDOORGROUP_VIRIDIAN_CITY
	.DB ((8 & $F) << 4) | (2 & $F)
	.DW ViridianCityName
	.DB INDOORGROUP_ROUTE_2
	.DB ((6 & $F) << 4) | (2 & $F)
	.DW Route2Name
	.DB INDOORGROUP_VIRIDIAN_FOREST
	.DB ((4 & $F) << 4) | (2 & $F)
	.DW ViridianForestName
	.DB INDOORGROUP_PEWTER_CITY
	.DB ((3 & $F) << 4) | (2 & $F)
	.DW PewterCityName
	.DB INDOORGROUP_MT_MOON
	.DB ((2 & $F) << 4) | (6 & $F)
	.DW MountMoonName
	.DB INDOORGROUP_CERULEAN_CITY
	.DB ((2 & $F) << 4) | (10 & $F)
	.DW CeruleanCityName
	.DB INDOORGROUP_ROUTE_4
	.DB ((2 & $F) << 4) | (5 & $F)
	.DW Route4Name
	.DB INDOORGROUP_CERULEAN_CITY_2
	.DB ((2 & $F) << 4) | (10 & $F)
	.DW CeruleanCityName
	.DB INDOORGROUP_ROUTE_5
	.DB ((4 & $F) << 4) | (10 & $F)
	.DW Route5Name
	.DB INDOORGROUP_ROUTE_6
	.DB ((6 & $F) << 4) | (10 & $F)
	.DW Route6Name
	.DB INDOORGROUP_ROUTE_7
	.DB ((5 & $F) << 4) | (9 & $F)
	.DW Route7Name
	.DB INDOORGROUP_ROUTE_8
	.DB ((5 & $F) << 4) | (11 & $F)
	.DW Route8Name
	.DB INDOORGROUP_ROCK_TUNNEL
	.DB ((3 & $F) << 4) | (14 & $F)
	.DW RockTunnelName
	.DB INDOORGROUP_POWER_PLANT
	.DB ((4 & $F) << 4) | (15 & $F)
	.DW PowerPlantName
	.DB INDOORGROUP_ROUTE_11
	.DB ((9 & $F) << 4) | (13 & $F)
	.DW Route11Name
	.DB INDOORGROUP_ROUTE_12
	.DB ((7 & $F) << 4) | (14 & $F)
	.DW Route12Name
	.DB INDOORGROUP_SEA_COTTAGE
	.DB ((0 & $F) << 4) | (12 & $F)
	.DW SeaCottageName
	.DB INDOORGROUP_VERMILION_CITY
	.DB ((9 & $F) << 4) | (10 & $F)
	.DW VermilionCityName
	.DB INDOORGROUP_SS_ANNE
	.DB ((10 & $F) << 4) | (9 & $F)
	.DW SSAnneName
	.DB INDOORGROUP_VICTORY_ROAD
	.DB ((4 & $F) << 4) | (0 & $F)
	.DW VictoryRoadName
	.DB INDOORGROUP_POKEMON_LEAGUE
	.DB ((2 & $F) << 4) | (0 & $F)
	.DW PokemonLeagueName
	.DB INDOORGROUP_UNDERGROUND_PATH
	.DB ((5 & $F) << 4) | (10 & $F)
	.DW UndergroundPathName
	.DB INDOORGROUP_POKEMON_LEAGUE_2
	.DB ((2 & $F) << 4) | (0 & $F)
	.DW PokemonLeagueName
	.DB INDOORGROUP_UNDERGROUND_PATH_2
	.DB ((5 & $F) << 4) | (10 & $F)
	.DW UndergroundPathName
	.DB INDOORGROUP_CELADON_CITY
	.DB ((5 & $F) << 4) | (7 & $F)
	.DW CeladonCityName
	.DB INDOORGROUP_LAVENDER_TOWN
	.DB ((5 & $F) << 4) | (14 & $F)
	.DW LavenderTownName
	.DB INDOORGROUP_POKEMON_TOWER
	.DB ((5 & $F) << 4) | (15 & $F)
	.DW PokemonTowerName
	.DB INDOORGROUP_LAVENDER_TOWN_2
	.DB ((5 & $F) << 4) | (14 & $F)
	.DW LavenderTownName
	.DB INDOORGROUP_FUCHSIA_CITY
	.DB ((13 & $F) << 4) | (8 & $F)
	.DW FuchsiaCityName
	.DB INDOORGROUP_SAFARI_ZONE
	.DB ((12 & $F) << 4) | (8 & $F)
	.DW SafariZoneName
	.DB INDOORGROUP_FUCHSIA_CITY_2
	.DB ((13 & $F) << 4) | (8 & $F)
	.DW FuchsiaCityName
	.DB INDOORGROUP_SEAFOAM_ISLANDS
	.DB ((15 & $F) << 4) | (5 & $F)
	.DW SeafoamIslandsName
	.DB INDOORGROUP_VERMILION_CITY_2
	.DB ((9 & $F) << 4) | (10 & $F)
	.DW VermilionCityName
	.DB INDOORGROUP_FUCHSIA_CITY_3
	.DB ((13 & $F) << 4) | (8 & $F)
	.DW FuchsiaCityName
	.DB INDOORGROUP_POKEMON_MANSION
	.DB ((15 & $F) << 4) | (2 & $F)
	.DW PokemonMansionName
	.DB INDOORGROUP_CINNABAR_ISLAND
	.DB ((15 & $F) << 4) | (2 & $F)
	.DW CinnabarIslandName
	.DB INDOORGROUP_INDIGO_PLATEAU
	.DB ((2 & $F) << 4) | (0 & $F)
	.DW IndigoPlateauName
	.DB INDOORGROUP_SAFFRON_CITY
	.DB ((5 & $F) << 4) | (10 & $F)
	.DW SaffronCityName
	.DB INDOORGROUP_ROUTE_15
	.DB ((13 & $F) << 4) | (9 & $F)
	.DW Route15Name
	.DB INDOORGROUP_ROUTE_16
	.DB ((5 & $F) << 4) | (4 & $F)
	.DW Route16Name
	.DB INDOORGROUP_ROUTE_12_2
	.DB ((10 & $F) << 4) | (14 & $F)
	.DW Route12Name
	.DB INDOORGROUP_ROUTE_18
	.DB ((13 & $F) << 4) | (7 & $F)
	.DW Route18Name
	.DB INDOORGROUP_SEAFOAM_ISLANDS_2
	.DB ((15 & $F) << 4) | (5 & $F)
	.DW SeafoamIslandsName
	.DB INDOORGROUP_ROUTE_22
	.DB ((7 & $F) << 4) | (0 & $F)
	.DW Route22Name
	.DB INDOORGROUP_VICTORY_ROAD_2
	.DB ((4 & $F) << 4) | (0 & $F)
	.DW VictoryRoadName
	.DB INDOORGROUP_ROUTE_12_3
	.DB ((7 & $F) << 4) | (14 & $F)
	.DW Route12Name
	.DB INDOORGROUP_VERMILION_CITY_3
	.DB ((9 & $F) << 4) | (10 & $F)
	.DW VermilionCityName
	.DB INDOORGROUP_DIGLETTS_CAVE
	.DB ((4 & $F) << 4) | (3 & $F)
	.DW DiglettsCaveName
	.DB INDOORGROUP_VICTORY_ROAD_3
	.DB ((4 & $F) << 4) | (0 & $F)
	.DW VictoryRoadName
	.DB INDOORGROUP_ROCKET_HQ
	.DB ((5 & $F) << 4) | (7 & $F)
	.DW RocketHQName
	.DB INDOORGROUP_SILPH_CO
	.DB ((5 & $F) << 4) | (10 & $F)
	.DW SilphCoName
	.DB INDOORGROUP_POKEMON_MANSION_2
	.DB ((15 & $F) << 4) | (2 & $F)
	.DW PokemonMansionName
	.DB INDOORGROUP_SAFARI_ZONE_2
	.DB ((12 & $F) << 4) | (8 & $F)
	.DW SafariZoneName
	.DB INDOORGROUP_CERULEAN_CAVE
	.DB ((1 & $F) << 4) | (9 & $F)
	.DW CeruleanCaveName
	.DB INDOORGROUP_LAVENDER_TOWN_3
	.DB ((5 & $F) << 4) | (14 & $F)
	.DW LavenderTownName
	.DB INDOORGROUP_CERULEAN_CITY_3
	.DB ((2 & $F) << 4) | (10 & $F)
	.DW CeruleanCityName
	.DB INDOORGROUP_ROCK_TUNNEL_2
	.DB ((3 & $F) << 4) | (14 & $F)
	.DW RockTunnelName
	.DB INDOORGROUP_SILPH_CO_2
	.DB ((5 & $F) << 4) | (10 & $F)
	.DW SilphCoName
	.DB INDOORGROUP_POKEMON_LEAGUE_3
	.DB ((2 & $F) << 4) | (0 & $F)
	.DW PokemonLeagueName
	.DB -1 ; end
