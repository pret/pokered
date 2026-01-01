DEF num_hidden_event_maps = 0

MACRO hidden_event_map
	db \1 ; map id
	DEF HIDDENEVENTMAP{num_hidden_event_maps} EQUS "\1"
	DEF num_hidden_event_maps += 1
ENDM

HiddenEventMaps:
	hidden_event_map REDS_HOUSE_2F
	hidden_event_map BLUES_HOUSE
	hidden_event_map OAKS_LAB
	hidden_event_map VIRIDIAN_POKECENTER
	hidden_event_map VIRIDIAN_MART
	hidden_event_map VIRIDIAN_SCHOOL_HOUSE
	hidden_event_map VIRIDIAN_GYM
	hidden_event_map MUSEUM_1F
	hidden_event_map PEWTER_GYM
	hidden_event_map PEWTER_MART
	hidden_event_map PEWTER_POKECENTER
	hidden_event_map CERULEAN_POKECENTER
	hidden_event_map CERULEAN_GYM
	hidden_event_map CERULEAN_MART
	hidden_event_map LAVENDER_POKECENTER
	hidden_event_map VERMILION_POKECENTER
	hidden_event_map VERMILION_GYM
	hidden_event_map CELADON_MANSION_2F
	hidden_event_map CELADON_POKECENTER
	hidden_event_map CELADON_GYM
	hidden_event_map GAME_CORNER
	hidden_event_map CELADON_HOTEL
	hidden_event_map FUCHSIA_POKECENTER
	hidden_event_map FUCHSIA_GYM
	hidden_event_map CINNABAR_GYM
	hidden_event_map CINNABAR_POKECENTER
	hidden_event_map SAFFRON_GYM
	hidden_event_map MT_MOON_POKECENTER
	hidden_event_map ROCK_TUNNEL_POKECENTER
	hidden_event_map TRADE_CENTER
	hidden_event_map COLOSSEUM
	hidden_event_map VIRIDIAN_FOREST
	hidden_event_map MT_MOON_B2F
	hidden_event_map INDIGO_PLATEAU
	hidden_event_map ROUTE_25
	hidden_event_map ROUTE_9
	hidden_event_map SS_ANNE_KITCHEN
	hidden_event_map SS_ANNE_B1F_ROOMS
	hidden_event_map ROCKET_HIDEOUT_B1F
	hidden_event_map ROCKET_HIDEOUT_B3F
	hidden_event_map ROCKET_HIDEOUT_B4F
	hidden_event_map SAFFRON_POKECENTER
	hidden_event_map POKEMON_TOWER_5F
	hidden_event_map ROUTE_13
	hidden_event_map SAFARI_ZONE_GATE
	hidden_event_map SAFARI_ZONE_WEST
	hidden_event_map SILPH_CO_5F
	hidden_event_map SILPH_CO_9F
	hidden_event_map COPYCATS_HOUSE_2F
	hidden_event_map CERULEAN_CAVE_1F
	hidden_event_map CERULEAN_CAVE_B1F
	hidden_event_map POWER_PLANT
	hidden_event_map SEAFOAM_ISLANDS_B2F
	hidden_event_map SEAFOAM_ISLANDS_B4F
	hidden_event_map POKEMON_MANSION_1F
	hidden_event_map POKEMON_MANSION_3F
	hidden_event_map ROUTE_23
	hidden_event_map VICTORY_ROAD_2F
	hidden_event_map UNUSED_MAP_6F
	hidden_event_map BILLS_HOUSE
	hidden_event_map VIRIDIAN_CITY
	hidden_event_map SAFARI_ZONE_WEST_REST_HOUSE
	hidden_event_map SAFARI_ZONE_EAST_REST_HOUSE
	hidden_event_map SAFARI_ZONE_NORTH_REST_HOUSE
	hidden_event_map ROUTE_15_GATE_2F
	hidden_event_map MR_FUJIS_HOUSE
	hidden_event_map CELADON_MANSION_ROOF_HOUSE
	hidden_event_map FIGHTING_DOJO
	hidden_event_map ROUTE_10
	hidden_event_map INDIGO_PLATEAU_LOBBY
	hidden_event_map CINNABAR_LAB_FOSSIL_ROOM
	hidden_event_map BIKE_SHOP
	hidden_event_map ROUTE_11
	hidden_event_map ROUTE_12
	hidden_event_map POKEMON_MANSION_2F
	hidden_event_map POKEMON_MANSION_B1F
	hidden_event_map SILPH_CO_11F
	hidden_event_map ROUTE_17
	hidden_event_map UNDERGROUND_PATH_NORTH_SOUTH
	hidden_event_map UNDERGROUND_PATH_WEST_EAST
	hidden_event_map CELADON_CITY
	hidden_event_map SEAFOAM_ISLANDS_B3F
	hidden_event_map VERMILION_CITY
	hidden_event_map CERULEAN_CITY
	hidden_event_map ROUTE_4
	db -1 ; end

HiddenEventPointers:
; each of these pointers is for the corresponding map in HiddenEventMaps
FOR n, num_hidden_event_maps
	dw HiddenEventsFor_{HIDDENEVENTMAP{n}}
ENDR

MACRO hidden_events_for
	HiddenEventsFor_\1:
ENDM

MACRO hidden_event
	db \2 ; y coord
	db \1 ; x coord
	db \3 ; item id
	dba \4 ; event function
ENDM

MACRO hidden_text_predef
	db \2 ; y coord
	db \1 ; x coord
	db_tx_pre \3 ; text id
	dba \4 ; event function
ENDM

; Some hidden events use SPRITE_FACING_* values,
; but these do not actually prevent the player
; from interacting with them in any direction.
DEF ANY_FACING EQU $d0

	hidden_events_for TRADE_CENTER
	hidden_event  5,  4, ANY_FACING, CableClubRightGameboy
	hidden_event  4,  4, ANY_FACING, CableClubLeftGameboy
	db -1 ; end

	hidden_events_for COLOSSEUM
	hidden_event  5,  4, ANY_FACING, CableClubRightGameboy
	hidden_event  4,  4, ANY_FACING, CableClubLeftGameboy
	db -1 ; end

	hidden_events_for REDS_HOUSE_2F
	hidden_event  0,  1, SPRITE_FACING_UP, OpenRedsPC
	hidden_event  3,  5, ANY_FACING, PrintRedSNESText
	db -1 ; end

	hidden_events_for BLUES_HOUSE
	hidden_event  0,  1, SPRITE_FACING_UP, PrintBookcaseText
	hidden_event  1,  1, SPRITE_FACING_UP, PrintBookcaseText
	hidden_event  7,  1, SPRITE_FACING_UP, PrintBookcaseText
	db -1 ; end

	hidden_events_for OAKS_LAB
	hidden_event  4,  0, SPRITE_FACING_UP, DisplayOakLabLeftPoster
	hidden_event  5,  0, SPRITE_FACING_UP, DisplayOakLabRightPoster
	hidden_event  0,  1, SPRITE_FACING_UP, DisplayOakLabEmailText
	hidden_event  1,  1, SPRITE_FACING_UP, DisplayOakLabEmailText
	db -1 ; end

	hidden_events_for VIRIDIAN_POKECENTER
	hidden_event  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	hidden_event 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

	hidden_events_for VIRIDIAN_MART
	db -1 ; end

	hidden_events_for VIRIDIAN_SCHOOL_HOUSE
	hidden_text_predef  3,  4, ViridianSchoolNotebook, PrintNotebookText
	hidden_text_predef  3,  0, ViridianSchoolBlackboard, PrintBlackboardLinkCableText
	db -1 ; end

	hidden_events_for VIRIDIAN_GYM
	hidden_event 15, 15, SPRITE_FACING_UP, GymStatues
	hidden_event 18, 15, SPRITE_FACING_UP, GymStatues
	db -1 ; end

	hidden_events_for MUSEUM_1F
	hidden_event  2,  3, SPRITE_FACING_UP, AerodactylFossil
	hidden_event  2,  6, SPRITE_FACING_UP, KabutopsFossil
	db -1 ; end

	hidden_events_for PEWTER_GYM
	hidden_event  3, 10, SPRITE_FACING_UP, GymStatues
	hidden_event  6, 10, SPRITE_FACING_UP, GymStatues
	db -1 ; end

	hidden_events_for PEWTER_MART
	db -1 ; end

	hidden_events_for PEWTER_POKECENTER
	hidden_event  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	hidden_event 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

	hidden_events_for CERULEAN_POKECENTER
	hidden_event  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	hidden_event 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

	hidden_events_for CERULEAN_GYM
	hidden_event  3, 11, SPRITE_FACING_UP, GymStatues
	hidden_event  6, 11, SPRITE_FACING_UP, GymStatues
	db -1 ; end

	hidden_events_for CERULEAN_MART
	db -1 ; end

	hidden_events_for LAVENDER_POKECENTER
	hidden_event  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	hidden_event 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

	hidden_events_for VERMILION_POKECENTER
	hidden_event 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	hidden_event  0,  4, SPRITE_FACING_UP, PrintBenchGuyText
	db -1 ; end

	hidden_events_for VERMILION_GYM
	hidden_event  3, 14, SPRITE_FACING_UP, GymStatues
	hidden_event  6, 14, SPRITE_FACING_UP, GymStatues
	hidden_event  6,  1, SPRITE_FACING_DOWN, PrintTrashText
	; third param: [wGymTrashCanIndex]
	hidden_event  1,  7,  0, GymTrashScript
	hidden_event  1,  9,  1, GymTrashScript
	hidden_event  1, 11,  2, GymTrashScript
	hidden_event  3,  7,  3, GymTrashScript
	hidden_event  3,  9,  4, GymTrashScript
	hidden_event  3, 11,  5, GymTrashScript
	hidden_event  5,  7,  6, GymTrashScript
	hidden_event  5,  9,  7, GymTrashScript
	hidden_event  5, 11,  8, GymTrashScript
	hidden_event  7,  7,  9, GymTrashScript
	hidden_event  7,  9, 10, GymTrashScript
	hidden_event  7, 11, 11, GymTrashScript
	hidden_event  9,  7, 12, GymTrashScript
	hidden_event  9,  9, 13, GymTrashScript
	hidden_event  9, 11, 14, GymTrashScript
	db -1 ; end

	hidden_events_for CELADON_MANSION_2F
	hidden_event  0,  5, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

	hidden_events_for CELADON_POKECENTER
	hidden_event  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	hidden_event 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

	hidden_events_for CELADON_GYM
	hidden_event  3, 15, SPRITE_FACING_UP, GymStatues
	hidden_event  6, 15, SPRITE_FACING_UP, GymStatues
	db -1 ; end

	hidden_events_for GAME_CORNER
	hidden_event 18, 15, ANY_FACING, StartSlotMachine
	hidden_event 18, 14, ANY_FACING, StartSlotMachine
	hidden_event 18, 13, ANY_FACING, StartSlotMachine
	hidden_event 18, 12, ANY_FACING, StartSlotMachine
	hidden_event 18, 11, ANY_FACING, StartSlotMachine
	hidden_event 18, 10, SLOTS_SOMEONESKEYS, StartSlotMachine
	hidden_event 13, 10, ANY_FACING, StartSlotMachine
	hidden_event 13, 11, ANY_FACING, StartSlotMachine
	hidden_event 13, 12, SLOTS_OUTTOLUNCH, StartSlotMachine
	hidden_event 13, 13, ANY_FACING, StartSlotMachine
	hidden_event 13, 14, ANY_FACING, StartSlotMachine
	hidden_event 13, 15, ANY_FACING, StartSlotMachine
	hidden_event 12, 15, ANY_FACING, StartSlotMachine
	hidden_event 12, 14, ANY_FACING, StartSlotMachine
	hidden_event 12, 13, ANY_FACING, StartSlotMachine
	hidden_event 12, 12, ANY_FACING, StartSlotMachine
	hidden_event 12, 11, ANY_FACING, StartSlotMachine
	hidden_event 12, 10, ANY_FACING, StartSlotMachine
	hidden_event  7, 10, ANY_FACING, StartSlotMachine
	hidden_event  7, 11, ANY_FACING, StartSlotMachine
	hidden_event  7, 12, ANY_FACING, StartSlotMachine
	hidden_event  7, 13, ANY_FACING, StartSlotMachine
	hidden_event  7, 14, ANY_FACING, StartSlotMachine
	hidden_event  7, 15, ANY_FACING, StartSlotMachine
	hidden_event  6, 15, ANY_FACING, StartSlotMachine
	hidden_event  6, 14, ANY_FACING, StartSlotMachine
	hidden_event  6, 13, ANY_FACING, StartSlotMachine
	hidden_event  6, 12, SLOTS_OUTOFORDER, StartSlotMachine
	hidden_event  6, 11, ANY_FACING, StartSlotMachine
	hidden_event  6, 10, ANY_FACING, StartSlotMachine
	hidden_event  1, 10, ANY_FACING, StartSlotMachine
	hidden_event  1, 11, ANY_FACING, StartSlotMachine
	hidden_event  1, 12, ANY_FACING, StartSlotMachine
	hidden_event  1, 13, ANY_FACING, StartSlotMachine
	hidden_event  1, 14, ANY_FACING, StartSlotMachine
	hidden_event  1, 15, ANY_FACING, StartSlotMachine
	; third param: COIN + <number of coins>
	hidden_event  0,  8, COIN + 10, HiddenCoins
	hidden_event  1, 16, COIN + 10, HiddenCoins
	hidden_event  3, 11, COIN + 20, HiddenCoins
	hidden_event  3, 14, COIN + 10, HiddenCoins
	hidden_event  4, 12, COIN + 10, HiddenCoins
	hidden_event  9, 12, COIN + 20, HiddenCoins
	hidden_event  9, 15, COIN + 10, HiddenCoins
	hidden_event 16, 14, COIN + 10, HiddenCoins
	hidden_event 10, 16, COIN + 10, HiddenCoins
	hidden_event 11,  7, COIN + 40, HiddenCoins
	hidden_event 15,  8, COIN + 100, HiddenCoins
	hidden_event 12, 15, COIN + 10, HiddenCoins
	db -1 ; end

	hidden_events_for CELADON_HOTEL
	hidden_event 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	hidden_event  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	db -1 ; end

	hidden_events_for FUCHSIA_POKECENTER
	hidden_event 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	hidden_event  0,  4, SPRITE_FACING_UP, PrintBenchGuyText
	db -1 ; end

	hidden_events_for FUCHSIA_GYM
	hidden_event  3, 15, SPRITE_FACING_UP, GymStatues
	hidden_event  6, 15, SPRITE_FACING_UP, GymStatues
	db -1 ; end

	hidden_events_for CINNABAR_GYM
	hidden_event 17, 13, SPRITE_FACING_UP, GymStatues
	; third param: ([hGymGateAnswer] << 4) | [hGymGateIndex]
	hidden_event 15,  7, (FALSE << 4) | 1, PrintCinnabarQuiz
	hidden_event 10,  1, (TRUE  << 4) | 2, PrintCinnabarQuiz
	hidden_event  9,  7, (TRUE  << 4) | 3, PrintCinnabarQuiz
	hidden_event  9, 13, (TRUE  << 4) | 4, PrintCinnabarQuiz
	hidden_event  1, 13, (FALSE << 4) | 5, PrintCinnabarQuiz
	hidden_event  1,  7, (TRUE  << 4) | 6, PrintCinnabarQuiz
	db -1 ; end

	hidden_events_for CINNABAR_POKECENTER
	hidden_event  0,  4, SPRITE_FACING_UP, PrintBenchGuyText
	hidden_event 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

	hidden_events_for SAFFRON_GYM
	hidden_event  9, 15, SPRITE_FACING_UP, GymStatues
	db -1 ; end

	hidden_events_for MT_MOON_POKECENTER
	hidden_event  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	hidden_event 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

	hidden_events_for ROCK_TUNNEL_POKECENTER
	hidden_event  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	hidden_event 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

	hidden_events_for VIRIDIAN_FOREST
	hidden_event  1, 18, POTION, HiddenItems
	hidden_event 16, 42, ANTIDOTE, HiddenItems
	db -1 ; end

	hidden_events_for MT_MOON_B2F
	hidden_event 18, 12, MOON_STONE, HiddenItems
	hidden_event 33,  9, ETHER, HiddenItems
	db -1 ; end

	hidden_events_for INDIGO_PLATEAU
	hidden_event  8, 13, $ff, PrintIndigoPlateauHQText ; inaccessible
	hidden_event 11, 13, SPRITE_FACING_DOWN, PrintIndigoPlateauHQText ; inaccessible
	db -1 ; end

	hidden_events_for ROUTE_25
	hidden_event 38,  3, ETHER, HiddenItems
	hidden_event 10,  1, ELIXER, HiddenItems
	db -1 ; end

	hidden_events_for ROUTE_9
	hidden_event 14,  7, ETHER, HiddenItems
	db -1 ; end

	hidden_events_for SS_ANNE_KITCHEN
	hidden_event 13,  5, SPRITE_FACING_DOWN, PrintTrashText
	hidden_event 13,  7, SPRITE_FACING_DOWN, PrintTrashText
	hidden_event 13,  9, GREAT_BALL, HiddenItems
	db -1 ; end

	hidden_events_for SS_ANNE_B1F_ROOMS
	hidden_event  3,  1, HYPER_POTION, HiddenItems
	db -1 ; end

	hidden_events_for ROUTE_10
	hidden_event  9, 17, SUPER_POTION, HiddenItems
	hidden_event 16, 53, MAX_ETHER, HiddenItems
	db -1 ; end

	hidden_events_for ROCKET_HIDEOUT_B1F
	hidden_event 21, 15, PP_UP, HiddenItems
	db -1 ; end

	hidden_events_for ROCKET_HIDEOUT_B3F
	hidden_event 27, 17, NUGGET, HiddenItems
	db -1 ; end

	hidden_events_for ROCKET_HIDEOUT_B4F
	hidden_event 25,  1, SUPER_POTION, HiddenItems
	db -1 ; end

	hidden_events_for SAFFRON_POKECENTER
	hidden_event  0,  4, SPRITE_FACING_UP, PrintBenchGuyText
	hidden_event 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

	hidden_events_for POKEMON_TOWER_5F
	hidden_event  4, 12, ELIXER, HiddenItems
	db -1 ; end

	hidden_events_for ROUTE_13
	hidden_event  1, 14, PP_UP, HiddenItems
	hidden_event 16, 13, CALCIUM, HiddenItems
	db -1 ; end

	hidden_events_for SAFARI_ZONE_GATE
	hidden_event 10,  1, NUGGET, HiddenItems ; inaccessible
	db -1 ; end

	hidden_events_for SAFARI_ZONE_WEST
	hidden_event  6,  5, REVIVE, HiddenItems
	db -1 ; end

	hidden_events_for SILPH_CO_5F
	hidden_event 12,  3, ELIXER, HiddenItems
	db -1 ; end

	hidden_events_for SILPH_CO_9F
	hidden_event  2, 15, MAX_POTION, HiddenItems
	db -1 ; end

	hidden_events_for COPYCATS_HOUSE_2F
	hidden_event  1,  1, NUGGET, HiddenItems
	db -1 ; end

	hidden_events_for CERULEAN_CAVE_1F
	hidden_event 14, 11, RARE_CANDY, HiddenItems
	db -1 ; end

	hidden_events_for CERULEAN_CAVE_B1F
	hidden_event 27,  3, ULTRA_BALL, HiddenItems
	db -1 ; end

	hidden_events_for POWER_PLANT
	hidden_event 17, 16, MAX_ELIXER, HiddenItems
	hidden_event 12,  1, PP_UP, HiddenItems
	db -1 ; end

	hidden_events_for SEAFOAM_ISLANDS_B2F
	hidden_event 15, 15, NUGGET, HiddenItems
	db -1 ; end

	hidden_events_for SEAFOAM_ISLANDS_B4F
	hidden_event 25, 17, ULTRA_BALL, HiddenItems
	db -1 ; end

	hidden_events_for POKEMON_MANSION_1F
	hidden_event  8, 16, MOON_STONE, HiddenItems
	hidden_event  2,  5, SPRITE_FACING_UP, Mansion1Script_Switches
	db -1 ; end

	hidden_events_for POKEMON_MANSION_2F
	hidden_event  2, 11, SPRITE_FACING_UP, Mansion2Script_Switches
	db -1 ; end

	hidden_events_for POKEMON_MANSION_3F
	hidden_event  1,  9, MAX_REVIVE, HiddenItems
	hidden_event 10,  5, SPRITE_FACING_UP, Mansion3Script_Switches
	db -1 ; end

	hidden_events_for POKEMON_MANSION_B1F
	hidden_event  1,  9, RARE_CANDY, HiddenItems
	hidden_event 20,  3, SPRITE_FACING_UP, Mansion4Script_Switches
	hidden_event 18, 25, SPRITE_FACING_UP, Mansion4Script_Switches
	db -1 ; end

	hidden_events_for ROUTE_23
	hidden_event  9, 44, FULL_RESTORE, HiddenItems
	hidden_event 19, 70, ULTRA_BALL, HiddenItems
	hidden_event  8, 90, MAX_ETHER, HiddenItems
	db -1 ; end

	hidden_events_for VICTORY_ROAD_2F
	hidden_event  5,  2, ULTRA_BALL, HiddenItems
	hidden_event 26,  7, FULL_RESTORE, HiddenItems
	db -1 ; end

	hidden_events_for UNUSED_MAP_6F
	hidden_event 14, 11, MAX_ELIXER, HiddenItems
	db -1 ; end

	hidden_events_for BILLS_HOUSE
	hidden_event  1,  4, SPRITE_FACING_UP, BillsHousePC
	db -1 ; end

	hidden_events_for VIRIDIAN_CITY
	hidden_event 14,  4, POTION, HiddenItems
	db -1 ; end

	hidden_events_for SAFARI_ZONE_WEST_REST_HOUSE
	hidden_event  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	hidden_event 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

	hidden_events_for SAFARI_ZONE_EAST_REST_HOUSE
	hidden_event  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	hidden_event 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

	hidden_events_for SAFARI_ZONE_NORTH_REST_HOUSE
	hidden_event  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	hidden_event 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

	hidden_events_for ROUTE_15_GATE_2F
	hidden_event  1,  2, SPRITE_FACING_UP, Route15GateLeftBinoculars
	db -1 ; end

	hidden_events_for MR_FUJIS_HOUSE
	hidden_event  0,  1, SPRITE_FACING_DOWN, PrintMagazinesText
	hidden_event  1,  1, SPRITE_FACING_DOWN, PrintMagazinesText
	hidden_event  7,  1, SPRITE_FACING_DOWN, PrintMagazinesText
	db -1 ; end

	hidden_events_for CELADON_MANSION_ROOF_HOUSE
	hidden_text_predef  3,  0, LinkCableHelp, PrintBlackboardLinkCableText
	hidden_text_predef  4,  0, LinkCableHelp, PrintBlackboardLinkCableText
	hidden_text_predef  3,  4, TMNotebook, PrintNotebookText
	db -1 ; end

	hidden_events_for FIGHTING_DOJO
	hidden_event  3,  9, SPRITE_FACING_UP, PrintFightingDojoText
	hidden_event  6,  9, SPRITE_FACING_UP, PrintFightingDojoText
	hidden_event  4,  0, SPRITE_FACING_UP, PrintFightingDojoText2
	hidden_event  5,  0, SPRITE_FACING_UP, PrintFightingDojoText3
	db -1 ; end

	hidden_events_for INDIGO_PLATEAU_LOBBY
	hidden_event 15,  7, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

	hidden_events_for CINNABAR_LAB_FOSSIL_ROOM
	hidden_event  0,  4, SPRITE_FACING_UP, OpenPokemonCenterPC
	hidden_event  2,  4, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

	hidden_events_for BIKE_SHOP
	hidden_event  1,  0, ANY_FACING, PrintNewBikeText
	hidden_event  2,  1, ANY_FACING, PrintNewBikeText
	hidden_event  1,  2, ANY_FACING, PrintNewBikeText
	hidden_event  3,  2, ANY_FACING, PrintNewBikeText
	hidden_event  0,  4, ANY_FACING, PrintNewBikeText
	hidden_event  1,  5, ANY_FACING, PrintNewBikeText
	db -1 ; end

	hidden_events_for ROUTE_11
	hidden_event 48,  5, ESCAPE_ROPE, HiddenItems
	db -1 ; end

	hidden_events_for ROUTE_12
	hidden_event  2, 63, HYPER_POTION, HiddenItems
	db -1 ; end

	hidden_events_for SILPH_CO_11F
	hidden_event 10, 12, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

	hidden_events_for ROUTE_17
	hidden_event 15,  14, RARE_CANDY, HiddenItems
	hidden_event  8,  45, FULL_RESTORE, HiddenItems
	hidden_event 17,  72, PP_UP, HiddenItems
	hidden_event  4,  91, MAX_REVIVE, HiddenItems
	hidden_event  8, 121, MAX_ELIXER, HiddenItems
	db -1 ; end

	hidden_events_for UNDERGROUND_PATH_NORTH_SOUTH
	hidden_event  3,  4, FULL_RESTORE, HiddenItems
	hidden_event  4, 34, X_SPECIAL, HiddenItems
	db -1 ; end

	hidden_events_for UNDERGROUND_PATH_WEST_EAST
	hidden_event 12,  2, NUGGET, HiddenItems
	hidden_event 21,  5, ELIXER, HiddenItems
	db -1 ; end

	hidden_events_for CELADON_CITY
	hidden_event 48, 15, PP_UP, HiddenItems
	db -1 ; end

	hidden_events_for SEAFOAM_ISLANDS_B3F
	hidden_event  9, 16, MAX_ELIXER, HiddenItems
	db -1 ; end

	hidden_events_for VERMILION_CITY
	hidden_event 14, 11, MAX_ETHER, HiddenItems
	db -1 ; end

	hidden_events_for CERULEAN_CITY
	hidden_event 15,  8, RARE_CANDY, HiddenItems
	db -1 ; end

	hidden_events_for ROUTE_4
	hidden_event 40,  3, GREAT_BALL, HiddenItems
	db -1 ; end

FOR n, num_hidden_event_maps
	ASSERT DEF(HiddenEventsFor_{HIDDENEVENTMAP{n}}), \
		"`hidden_events_for {HIDDENEVENTMAP{n}}` is not defined"
ENDR
