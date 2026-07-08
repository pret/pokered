; Reconciled from master RGBDS source: data/events/hidden_events.asm
; RGBDS source is untouched.
; WLA-DX representation for reconciliation only.

; HiddenEventMaps table - map IDs with hidden events
; MACRO hidden_event_map definition dropped (RGBDS-only)
; DEF num_hidden_event_maps side-effect constant dropped

HiddenEventMaps:
.DB REDS_HOUSE_2F
.DB BLUES_HOUSE
.DB OAKS_LAB
.DB VIRIDIAN_POKECENTER
.DB VIRIDIAN_MART
.DB VIRIDIAN_SCHOOL_HOUSE
.DB VIRIDIAN_GYM
.DB MUSEUM_1F
.DB PEWTER_GYM
.DB PEWTER_MART
.DB PEWTER_POKECENTER
.DB CERULEAN_POKECENTER
.DB CERULEAN_GYM
.DB CERULEAN_MART
.DB LAVENDER_POKECENTER
.DB VERMILION_POKECENTER
.DB VERMILION_GYM
.DB CELADON_MANSION_2F
.DB CELADON_POKECENTER
.DB CELADON_GYM
.DB GAME_CORNER
.DB CELADON_HOTEL
.DB FUCHSIA_POKECENTER
.DB FUCHSIA_GYM
.DB CINNABAR_GYM
.DB CINNABAR_POKECENTER
.DB SAFFRON_GYM
.DB MT_MOON_POKECENTER
.DB ROCK_TUNNEL_POKECENTER
.DB TRADE_CENTER
.DB COLOSSEUM
.DB VIRIDIAN_FOREST
.DB MT_MOON_B2F
.DB INDIGO_PLATEAU
.DB ROUTE_25
.DB ROUTE_9
.DB SS_ANNE_KITCHEN
.DB SS_ANNE_B1F_ROOMS
.DB ROCKET_HIDEOUT_B1F
.DB ROCKET_HIDEOUT_B3F
.DB ROCKET_HIDEOUT_B4F
.DB SAFFRON_POKECENTER
.DB POKEMON_TOWER_5F
.DB ROUTE_13
.DB SAFARI_ZONE_GATE
.DB SAFARI_ZONE_WEST
.DB SILPH_CO_5F
.DB SILPH_CO_9F
.DB COPYCATS_HOUSE_2F
.DB CERULEAN_CAVE_1F
.DB CERULEAN_CAVE_B1F
.DB POWER_PLANT
.DB SEAFOAM_ISLANDS_B2F
.DB SEAFOAM_ISLANDS_B4F
.DB POKEMON_MANSION_1F
.DB POKEMON_MANSION_3F
.DB ROUTE_23
.DB VICTORY_ROAD_2F
.DB UNUSED_MAP_6F
.DB BILLS_HOUSE
.DB VIRIDIAN_CITY
.DB SAFARI_ZONE_WEST_REST_HOUSE
.DB SAFARI_ZONE_EAST_REST_HOUSE
.DB SAFARI_ZONE_NORTH_REST_HOUSE
.DB ROUTE_15_GATE_2F
.DB MR_FUJIS_HOUSE
.DB CELADON_MANSION_ROOF_HOUSE
.DB FIGHTING_DOJO
.DB INDIGO_PLATEAU_LOBBY
.DB CINNABAR_LAB_FOSSIL_ROOM
.DB BIKE_SHOP
.DB ROUTE_11
.DB ROUTE_12
.DB SILPH_CO_11F
.DB ROUTE_17
.DB UNDERGROUND_PATH_NORTH_SOUTH
.DB UNDERGROUND_PATH_WEST_EAST
.DB CELADON_CITY
.DB SEAFOAM_ISLANDS_B3F
.DB VERMILION_CITY
.DB CERULEAN_CITY
.DB ROUTE_4
.DB -1

; HiddenEventsFor sections - each map's hidden events
; MACRO hidden_events_for definition dropped (RGBDS-only)
; MACRO hidden_event definition dropped (RGBDS-only)
; MACRO hidden_text_predef definition dropped (RGBDS-only)
; DEF ANY_FACING side-effect constant dropped
; DEF SPRITE_FACING_* constants preserved as-is

HiddenEventsFor_TRADE_CENTER:
.DB 5, 4, CableClubRightGameboy, ANY_FACING
.DB 4, 4, CableClubLeftGameboy, ANY_FACING
.DB -1

HiddenEventsFor_COLOSSEUM:
.DB 5, 4, CableClubRightGameboy, ANY_FACING
.DB 4, 4, CableClubLeftGameboy, ANY_FACING
.DB -1

HiddenEventsFor_REDS_HOUSE_2F:
.DB 0, 1, OpenRedsPC, SPRITE_FACING_UP
.DB 3, 5, PrintRedSNESText, ANY_FACING
.DB -1

HiddenEventsFor_BLUES_HOUSE:
.DB 0, 1, PrintBookcaseText, SPRITE_FACING_UP
.DB 1, 1, PrintBookcaseText, SPRITE_FACING_UP
.DB 7, 1, PrintBookcaseText, SPRITE_FACING_UP
.DB -1

HiddenEventsFor_OAKS_LAB:
.DB 4, 0, DisplayOakLabLeftPoster, SPRITE_FACING_UP
.DB 5, 0, DisplayOakLabRightPoster, SPRITE_FACING_UP
.DB 0, 1, DisplayOakLabEmailText, SPRITE_FACING_UP
.DB 1, 1, DisplayOakLabEmailText, SPRITE_FACING_UP
.DB -1

HiddenEventsFor_VIRIDIAN_POKECENTER:
.DB 0, 4, PrintBenchGuyText, SPRITE_FACING_LEFT
.DB 13, 3, OpenPokemonCenterPC, SPRITE_FACING_UP
.DB -1

HiddenEventsFor_VIRIDIAN_MART:
.DB -1

HiddenEventsFor_VIRIDIAN_SCHOOL_HOUSE:
.DB 3, 4, PrintNotebookText, ViridianSchoolNotebook
.DB 3, 0, PrintBlackboardLinkCableText, ViridianSchoolBlackboard
.DB -1

HiddenEventsFor_VIRIDIAN_GYM:
.DB 15, 15, GymStatues, SPRITE_FACING_UP
.DB 18, 15, GymStatues, SPRITE_FACING_UP
.DB -1

HiddenEventsFor_MUSEUM_1F:
.DB 2, 3, AerodactylFossil, SPRITE_FACING_UP
.DB 2, 6, KabutopsFossil, SPRITE_FACING_UP
.DB -1

HiddenEventsFor_PEWTER_GYM:
.DB 3, 10, GymStatues, SPRITE_FACING_UP
.DB 6, 10, GymStatues, SPRITE_FACING_UP
.DB -1

HiddenEventsFor_PEWTER_MART:
.DB -1

HiddenEventsFor_PEWTER_POKECENTER:
.DB 0, 4, PrintBenchGuyText, SPRITE_FACING_LEFT
.DB 13, 3, OpenPokemonCenterPC, SPRITE_FACING_UP
.DB -1

HiddenEventsFor_CERULEAN_POKECENTER:
.DB 0, 4, PrintBenchGuyText, SPRITE_FACING_LEFT
.DB 13, 3, OpenPokemonCenterPC, SPRITE_FACING_UP
.DB -1

HiddenEventsFor_CERULEAN_GYM:
.DB 3, 11, GymStatues, SPRITE_FACING_UP
.DB 6, 11, GymStatues, SPRITE_FACING_UP
.DB -1

HiddenEventsFor_CERULEAN_MART:
.DB -1

HiddenEventsFor_LAVENDER_POKECENTER:
.DB 0, 4, PrintBenchGuyText, SPRITE_FACING_LEFT
.DB 13, 3, OpenPokemonCenterPC, SPRITE_FACING_UP
.DB -1

HiddenEventsFor_VERMILION_POKECENTER:
.DB 13, 3, OpenPokemonCenterPC, SPRITE_FACING_UP
.DB 0, 4, PrintBenchGuyText, SPRITE_FACING_UP
.DB -1

HiddenEventsFor_VERMILION_GYM:
.DB 3, 14, GymStatues, SPRITE_FACING_UP
.DB 6, 14, GymStatues, SPRITE_FACING_UP
.DB 6, 1, PrintTrashText, SPRITE_FACING_DOWN
.DB 1, 7, GymTrashScript, 0
.DB 1, 9, GymTrashScript, 1
.DB 1, 11, GymTrashScript, 2
.DB 3, 7, GymTrashScript, 3
.DB 3, 9, GymTrashScript, 4
.DB 3, 11, GymTrashScript, 5
.DB 5, 7, GymTrashScript, 6
.DB 5, 9, GymTrashScript, 7
.DB 5, 11, GymTrashScript, 8
.DB 7, 7, GymTrashScript, 9
.DB 7, 9, GymTrashScript, 10
.DB 7, 11, GymTrashScript, 11
.DB 9, 7, GymTrashScript, 12
.DB 9, 9, GymTrashScript, 13
.DB 9, 11, GymTrashScript, 14
.DB -1

HiddenEventsFor_CELADON_MANSION_2F:
.DB 0, 5, OpenPokemonCenterPC, SPRITE_FACING_UP
.DB -1

HiddenEventsFor_CELADON_POKECENTER:
.DB 0, 4, PrintBenchGuyText, SPRITE_FACING_LEFT
.DB 13, 3, OpenPokemonCenterPC, SPRITE_FACING_UP
.DB -1

HiddenEventsFor_CELADON_GYM:
.DB 3, 15, GymStatues, SPRITE_FACING_UP
.DB 6, 15, GymStatues, SPRITE_FACING_UP
.DB -1

HiddenEventsFor_GAME_CORNER:
.DB 18, 15, StartSlotMachine, ANY_FACING
.DB 18, 14, StartSlotMachine, ANY_FACING
.DB 18, 13, StartSlotMachine, ANY_FACING
.DB 18, 12, StartSlotMachine, ANY_FACING
.DB 18, 11, StartSlotMachine, ANY_FACING
.DB 13, 10, StartSlotMachine, ANY_FACING
.DB 13, 11, StartSlotMachine, ANY_FACING
.DB 13, 12, StartSlotMachine, SLOTS_OUTTOLUNCH
.DB 13, 13, StartSlotMachine, ANY_FACING
.DB 13, 14, StartSlotMachine, ANY_FACING
.DB 13, 15, StartSlotMachine, ANY_FACING
.DB 12, 15, StartSlotMachine, ANY_FACING
.DB 12, 14, StartSlotMachine, ANY_FACING
.DB 12, 13, StartSlotMachine, ANY_FACING
.DB 12, 12, StartSlotMachine, ANY_FACING
.DB 12, 11, StartSlotMachine, ANY_FACING
.DB 12, 10, StartSlotMachine, ANY_FACING
.DB 7, 10, StartSlotMachine, ANY_FACING
.DB 7, 11, StartSlotMachine, ANY_FACING
.DB 7, 12, StartSlotMachine, ANY_FACING
.DB 7, 13, StartSlotMachine, ANY_FACING
.DB 7, 14, StartSlotMachine, ANY_FACING
.DB 7, 15, StartSlotMachine, ANY_FACING
.DB 6, 15, StartSlotMachine, ANY_FACING
.DB 6, 14, StartSlotMachine, ANY_FACING
.DB 6, 13, StartSlotMachine, ANY_FACING
.DB 6, 12, StartSlotMachine, SLOTS_OUTOFORDER
.DB 6, 11, StartSlotMachine, ANY_FACING
.DB 6, 10, StartSlotMachine, ANY_FACING
.DB 1, 10, StartSlotMachine, ANY_FACING
.DB 1, 11, StartSlotMachine, ANY_FACING
.DB 1, 12, StartSlotMachine, ANY_FACING
.DB 1, 13, StartSlotMachine, ANY_FACING
.DB 1, 14, StartSlotMachine, ANY_FACING
.DB 1, 15, StartSlotMachine, ANY_FACING
.DB 0, 8, HiddenCoins, COIN + 10
.DB 1, 16, HiddenCoins, COIN + 10
.DB 3, 11, HiddenCoins, COIN + 20
.DB 3, 14, HiddenCoins, COIN + 10
.DB 4, 12, HiddenCoins, COIN + 10
.DB 9, 12, HiddenCoins, COIN + 20
.DB 9, 15, HiddenCoins, COIN + 10
.DB 16, 14, HiddenCoins, COIN + 10
.DB 10, 16, HiddenCoins, COIN + 10
.DB 11, 7, HiddenCoins, COIN + 40
.DB 15, 8, HiddenCoins, COIN + 100
.DB 12, 15, HiddenCoins, COIN + 10
.DB -1

HiddenEventsFor_CELADON_HOTEL:
.DB 13, 3, OpenPokemonCenterPC, SPRITE_FACING_UP
.DB 0, 4, PrintBenchGuyText, SPRITE_FACING_LEFT
.DB -1

HiddenEventsFor_FUCHSIA_POKECENTER:
.DB 13, 3, OpenPokemonCenterPC, SPRITE_FACING_UP
.DB 0, 4, PrintBenchGuyText, SPRITE_FACING_UP
.DB -1

HiddenEventsFor_FUCHSIA_GYM:
.DB 3, 15, GymStatues, SPRITE_FACING_UP
.DB 6, 15, GymStatues, SPRITE_FACING_UP
.DB -1

HiddenEventsFor_CINNABAR_GYM:
.DB 17, 13, GymStatues, SPRITE_FACING_UP
.DB 15, 7, PrintCinnabarQuiz, (FALSE << 4) | 1
.DB 10, 1, PrintCinnabarQuiz, (TRUE << 4) | 2
.DB 9, 7, PrintCinnabarQuiz, (TRUE << 4) | 3
.DB 9, 13, PrintCinnabarQuiz, (TRUE << 4) | 4
.DB 1, 13, PrintCinnabarQuiz, (FALSE << 4) | 5
.DB 1, 7, PrintCinnabarQuiz, (TRUE << 4) | 6
.DB -1

HiddenEventsFor_CINNABAR_POKECENTER:
.DB 0, 4, PrintBenchGuyText, SPRITE_FACING_UP
.DB 13, 3, OpenPokemonCenterPC, SPRITE_FACING_UP
.DB -1

HiddenEventsFor_SAFFRON_GYM:
.DB 9, 15, GymStatues, SPRITE_FACING_UP
.DB -1

HiddenEventsFor_MT_MOON_POKECENTER:
.DB 0, 4, PrintBenchGuyText, SPRITE_FACING_LEFT
.DB 13, 3, OpenPokemonCenterPC, SPRITE_FACING_UP
.DB -1

HiddenEventsFor_ROCK_TUNNEL_POKECENTER:
.DB 0, 4, PrintBenchGuyText, SPRITE_FACING_LEFT
.DB 13, 3, OpenPokemonCenterPC, SPRITE_FACING_UP
.DB -1

HiddenEventsFor_VIRIDIAN_FOREST:
.DB 1, 18, HiddenItems, POTION
.DB 16, 42, HiddenItems, ANTIDOTE
.DB -1

HiddenEventsFor_MT_MOON_B2F:
.DB 18, 12, HiddenItems, MOON_STONE
.DB 33, 9, HiddenItems, ETHER
.DB -1

HiddenEventsFor_INDIGO_PLATEAU:
.DB 8, 13, PrintIndigoPlateauHQText, $ff
.DB 11, 13, PrintIndigoPlateauHQText, SPRITE_FACING_DOWN
.DB -1

HiddenEventsFor_ROUTE_25:
.DB 38, 3, HiddenItems, ETHER
.DB 10, 1, HiddenItems, ELIXER
.DB -1

HiddenEventsFor_ROUTE_9:
.DB 14, 7, HiddenItems, ETHER
.DB -1

HiddenEventsFor_SS_ANNE_KITCHEN:
.DB 13, 5, PrintTrashText, SPRITE_FACING_DOWN
.DB 13, 7, PrintTrashText, SPRITE_FACING_DOWN
.DB 13, 9, HiddenItems, GREAT_BALL
.DB -1

HiddenEventsFor_SS_ANNE_B1F_ROOMS:
.DB 3, 1, HiddenItems, HYPER_POTION
.DB -1

HiddenEventsFor_ROUTE_10:
.DB 9, 17, HiddenItems, SUPER_POTION
.DB 16, 53, HiddenItems, MAX_ETHER
.DB -1

HiddenEventsFor_ROCKET_HIDEOUT_B1F:
.DB 21, 15, HiddenItems, PP_UP
.DB -1

HiddenEventsFor_ROCKET_HIDEOUT_B3F:
.DB 27, 17, HiddenItems, NUGGET
.DB -1

HiddenEventsFor_ROCKET_HIDEOUT_B4F:
.DB 25, 1, HiddenItems, SUPER_POTION
.DB -1

HiddenEventsFor_SAFFRON_POKECENTER:
.DB 0, 4, PrintBenchGuyText, SPRITE_FACING_UP
.DB 13, 3, OpenPokemonCenterPC, SPRITE_FACING_UP
.DB -1

HiddenEventsFor_POKEMON_TOWER_5F:
.DB 4, 12, HiddenItems, ELIXER
.DB -1

HiddenEventsFor_ROUTE_13:
.DB 1, 14, HiddenItems, PP_UP
.DB 16, 13, HiddenItems, CALCIUM
.DB -1

HiddenEventsFor_SAFARI_ZONE_GATE:
.DB 10, 1, HiddenItems, NUGGET
.DB -1

HiddenEventsFor_SAFARI_ZONE_WEST:
.DB 6, 5, HiddenItems, REVIVE
.DB -1

HiddenEventsFor_SILPH_CO_5F:
.DB 12, 3, HiddenItems, ELIXER
.DB -1

HiddenEventsFor_SILPH_CO_9F:
.DB 2, 15, HiddenItems, MAX_POTION
.DB -1

HiddenEventsFor_COPYCATS_HOUSE_2F:
.DB 1, 1, HiddenItems, NUGGET
.DB -1

HiddenEventsFor_CERULEAN_CAVE_1F:
.DB 14, 11, HiddenItems, RARE_CANDY
.DB -1

HiddenEventsFor_CERULEAN_CAVE_B1F:
.DB 27, 3, HiddenItems, ULTRA_BALL
.DB -1

HiddenEventsFor_POWER_PLANT:
.DB 17, 16, HiddenItems, MAX_ELIXER
.DB 12, 1, HiddenItems, PP_UP
.DB -1

HiddenEventsFor_SEAFOAM_ISLANDS_B2F:
.DB 15, 15, HiddenItems, NUGGET
.DB -1

HiddenEventsFor_SEAFOAM_ISLANDS_B4F:
.DB 25, 17, HiddenItems, ULTRA_BALL
.DB -1

HiddenEventsFor_POKEMON_MANSION_1F:
.DB 8, 16, HiddenItems, MOON_STONE
.DB 2, 5, Mansion1Script_Switches, SPRITE_FACING_UP
.DB -1

HiddenEventsFor_POKEMON_MANSION_2F:
.DB 2, 11, Mansion2Script_Switches, SPRITE_FACING_UP
.DB -1

HiddenEventsFor_POKEMON_MANSION_3F:
.DB 1, 9, HiddenItems, MAX_REVIVE
.DB 10, 5, Mansion3Script_Switches, SPRITE_FACING_UP
.DB -1

HiddenEventsFor_POKEMON_MANSION_B1F:
.DB 1, 9, HiddenItems, RARE_CANDY
.DB 20, 3, Mansion4Script_Switches, SPRITE_FACING_UP
.DB 18, 25, Mansion4Script_Switches, SPRITE_FACING_UP
.DB -1

HiddenEventsFor_ROUTE_23:
.DB 9, 44, HiddenItems, FULL_RESTORE
.DB 19, 70, HiddenItems, ULTRA_BALL
.DB 8, 90, HiddenItems, MAX_ETHER
.DB -1

HiddenEventsFor_VICTORY_ROAD_2F:
.DB 5, 2, HiddenItems, ULTRA_BALL
.DB 26, 7, HiddenItems, FULL_RESTORE
.DB -1

HiddenEventsFor_UNUSED_MAP_6F:
.DB 14, 11, HiddenItems, MAX_ELIXER
.DB -1

HiddenEventsFor_BILLS_HOUSE:
.DB 1, 4, BillsHousePC, SPRITE_FACING_UP
.DB -1

HiddenEventsFor_VIRIDIAN_CITY:
.DB 14, 4, HiddenItems, POTION
.DB -1

HiddenEventsFor_SAFARI_ZONE_WEST_REST_HOUSE:
.DB 0, 4, PrintBenchGuyText, SPRITE_FACING_LEFT
.DB 13, 3, OpenPokemonCenterPC, SPRITE_FACING_UP
.DB -1

HiddenEventsFor_SAFARI_ZONE_NORTH_REST_HOUSE:
.DB 0, 4, PrintBenchGuyText, SPRITE_FACING_LEFT
.DB 13, 3, OpenPokemonCenterPC, SPRITE_FACING_UP
.DB -1

HiddenEventsFor_ROUTE_15_GATE_2F:
.DB 1, 2, Route15GateLeftBinoculars, SPRITE_FACING_UP
.DB -1

HiddenEventsFor_MR_FUJIS_HOUSE:
.DB 0, 1, PrintMagazinesText, SPRITE_FACING_DOWN
.DB 1, 1, PrintMagazinesText, SPRITE_FACING_DOWN
.DB 7, 1, PrintMagazinesText, SPRITE_FACING_DOWN
.DB -1

HiddenEventsFor_CELADON_MANSION_ROOF_HOUSE:
.DB 3, 0, PrintBlackboardLinkCableText, LinkCableHelp
.DB 4, 0, PrintBlackboardLinkCableText, LinkCableHelp
.DB 3, 4, PrintNotebookText, TMNotebook
.DB -1

HiddenEventsFor_FIGHTING_DOJO:
.DB 3, 9, PrintFightingDojoText, SPRITE_FACING_UP
.DB 6, 9, PrintFightingDojoText, SPRITE_FACING_UP
.DB 4, 0, PrintFightingDojoText2, SPRITE_FACING_UP
.DB 5, 0, PrintFightingDojoText3, SPRITE_FACING_UP
.DB -1

HiddenEventsFor_INDIGO_PLATEAU_LOBBY:
.DB 15, 7, OpenPokemonCenterPC, SPRITE_FACING_UP
.DB -1

HiddenEventsFor_CINNABAR_LAB_FOSSIL_ROOM:
.DB 0, 4, OpenPokemonCenterPC, SPRITE_FACING_UP
.DB 2, 4, OpenPokemonCenterPC, SPRITE_FACING_UP
.DB -1

HiddenEventsFor_BIKE_SHOP:
.DB 1, 0, PrintNewBikeText, ANY_FACING
.DB 2, 1, PrintNewBikeText, ANY_FACING
.DB 1, 2, PrintNewBikeText, ANY_FACING
.DB 3, 2, PrintNewBikeText, ANY_FACING
.DB 0, 4, PrintNewBikeText, ANY_FACING
.DB 1, 5, PrintNewBikeText, ANY_FACING
.DB -1

HiddenEventsFor_ROUTE_11:
.DB 48, 5, HiddenItems, ESCAPE_ROPE
.DB -1

HiddenEventsFor_ROUTE_12:
.DB 2, 63, HiddenItems, HYPER_POTION
.DB -1

HiddenEventsFor_SILPH_CO_11F:
.DB 10, 12, OpenPokemonCenterPC, SPRITE_FACING_UP
.DB -1

HiddenEventsFor_ROUTE_17:
.DB 15, 14, HiddenItems, RARE_CANDY
.DB 8, 45, HiddenItems, FULL_RESTORE
.DB 17, 72, HiddenItems, PP_UP
.DB 4, 91, HiddenItems, MAX_REVIVE
.DB 8, 121, HiddenItems, MAX_ELIXER
.DB -1

HiddenEventsFor_UNDERGROUND_PATH_NORTH_SOUTH:
.DB 3, 4, HiddenItems, FULL_RESTORE
.DB 4, 34, HiddenItems, X_SPECIAL
.DB -1

HiddenEventsFor_UNDERGROUND_PATH_WEST_EAST:
.DB 12, 2, HiddenItems, NUGGET
.DB 21, 5, HiddenItems, ELIXER
.DB -1

HiddenEventsFor_CELADON_CITY:
.DB 48, 15, HiddenItems, PP_UP
.DB -1

HiddenEventsFor_SEAFOAM_ISLANDS_B3F:
.DB 9, 16, HiddenItems, MAX_ELIXER
.DB -1

HiddenEventsFor_VERMILION_CITY:
.DB 14, 11, HiddenItems, MAX_ETHER
.DB -1

HiddenEventsFor_CERULEAN_CITY:
.DB 15, 8, HiddenItems, RARE_CANDY
.DB -1

HiddenEventsFor_ROUTE_4:
.DB 40, 3, HiddenItems, GREAT_BALL
.DB -1
