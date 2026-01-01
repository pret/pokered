HiddenEventMaps:
	db REDS_HOUSE_2F
	db BLUES_HOUSE
	db OAKS_LAB
	db VIRIDIAN_POKECENTER
	db VIRIDIAN_MART
	db VIRIDIAN_SCHOOL_HOUSE
	db VIRIDIAN_GYM
	db MUSEUM_1F
	db PEWTER_GYM
	db PEWTER_MART
	db PEWTER_POKECENTER
	db CERULEAN_POKECENTER
	db CERULEAN_GYM
	db CERULEAN_MART
	db LAVENDER_POKECENTER
	db VERMILION_POKECENTER
	db VERMILION_GYM
	db CELADON_MANSION_2F
	db CELADON_POKECENTER
	db CELADON_GYM
	db GAME_CORNER
	db CELADON_HOTEL
	db FUCHSIA_POKECENTER
	db FUCHSIA_GYM
	db CINNABAR_GYM
	db CINNABAR_POKECENTER
	db SAFFRON_GYM
	db MT_MOON_POKECENTER
	db ROCK_TUNNEL_POKECENTER
	db TRADE_CENTER
	db COLOSSEUM
	db VIRIDIAN_FOREST
	db MT_MOON_B2F
	db INDIGO_PLATEAU
	db ROUTE_25
	db ROUTE_9
	db SS_ANNE_KITCHEN
	db SS_ANNE_B1F_ROOMS
	db ROCKET_HIDEOUT_B1F
	db ROCKET_HIDEOUT_B3F
	db ROCKET_HIDEOUT_B4F
	db SAFFRON_POKECENTER
	db POKEMON_TOWER_5F
	db ROUTE_13
	db SAFARI_ZONE_GATE
	db SAFARI_ZONE_WEST
	db SILPH_CO_5F
	db SILPH_CO_9F
	db COPYCATS_HOUSE_2F
	db CERULEAN_CAVE_1F
	db CERULEAN_CAVE_B1F
	db POWER_PLANT
	db SEAFOAM_ISLANDS_B2F
	db SEAFOAM_ISLANDS_B4F
	db POKEMON_MANSION_1F
	db POKEMON_MANSION_3F
	db ROUTE_23
	db VICTORY_ROAD_2F
	db UNUSED_MAP_6F
	db BILLS_HOUSE
	db VIRIDIAN_CITY
	db SAFARI_ZONE_WEST_REST_HOUSE
	db SAFARI_ZONE_EAST_REST_HOUSE
	db SAFARI_ZONE_NORTH_REST_HOUSE
	db ROUTE_15_GATE_2F
	db MR_FUJIS_HOUSE
	db CELADON_MANSION_ROOF_HOUSE
	db FIGHTING_DOJO
	db ROUTE_10
	db INDIGO_PLATEAU_LOBBY
	db CINNABAR_LAB_FOSSIL_ROOM
	db BIKE_SHOP
	db ROUTE_11
	db ROUTE_12
	db POKEMON_MANSION_2F
	db POKEMON_MANSION_B1F
	db SILPH_CO_11F
	db ROUTE_17
	db UNDERGROUND_PATH_NORTH_SOUTH
	db UNDERGROUND_PATH_WEST_EAST
	db CELADON_CITY
	db SEAFOAM_ISLANDS_B3F
	db VERMILION_CITY
	db CERULEAN_CITY
	db ROUTE_4
	db -1 ; end

HiddenEventPointers:
; each of these pointers is for the corresponding map in HiddenEventMaps
	dw RedsHouse2FHiddenEvents
	dw BluesHouseHiddenEvents
	dw OaksLabHiddenEvents
	dw ViridianPokecenterHiddenEvents
	dw ViridianMartHiddenEvents
	dw ViridianSchoolHiddenEvents
	dw ViridianGymHiddenEvents
	dw Museum1FHiddenEvents
	dw PewterGymHiddenEvents
	dw PewterMartHiddenEvents
	dw PewterPokecenterHiddenEvents
	dw CeruleanPokecenterHiddenEvents
	dw CeruleanGymHiddenEvents
	dw CeruleanMartHiddenEvents
	dw LavenderPokecenterHiddenEvents
	dw VermilionPokecenterHiddenEvents
	dw VermilionGymHiddenEvents
	dw CeladonMansion2HiddenEvents
	dw CeladonPokecenterHiddenEvents
	dw CeladonGymHiddenEvents
	dw GameCornerHiddenEvents
	dw CeladonHotelHiddenEvents
	dw FuchsiaPokecenterHiddenEvents
	dw FuchsiaGymHiddenEvents
	dw CinnabarGymHiddenEvents
	dw CinnabarPokecenterHiddenEvents
	dw SaffronGymHiddenEvents
	dw MtMoonPokecenterHiddenEvents
	dw RockTunnelPokecenterHiddenEvents
	dw TradeCenterHiddenEvents
	dw ColosseumHiddenEvents
	dw ViridianForestHiddenEvents
	dw MtMoon3HiddenEvents
	dw IndigoPlateauHiddenEvents
	dw Route25HiddenEvents
	dw Route9HiddenEvents
	dw SSAnne6HiddenEvents
	dw SSAnne10HiddenEvents
	dw RocketHideout1HiddenEvents
	dw RocketHideout3HiddenEvents
	dw RocketHideout4HiddenEvents
	dw SaffronPokecenterHiddenEvents
	dw PokemonTower5HiddenEvents
	dw Route13HiddenEvents
	dw SafariZoneEntranceHiddenEvents
	dw SafariZoneWestHiddenEvents
	dw SilphCo5FHiddenEvents
	dw SilphCo9FHiddenEvents
	dw CopycatsHouse2FHiddenEvents
	dw CeruleanCave1HiddenEvents
	dw CeruleanCave3HiddenEvents
	dw PowerPlantHiddenEvents
	dw SeafoamIslands3HiddenEvents
	dw SeafoamIslands5HiddenEvents
	dw Mansion1HiddenEvents
	dw Mansion3HiddenEvents
	dw Route23HiddenEvents
	dw VictoryRoad2HiddenEvents
	dw Unused6FHiddenEvents
	dw BillsHouseHiddenEvents
	dw ViridianCityHiddenEvents
	dw SafariZoneRestHouse2HiddenEvents
	dw SafariZoneRestHouse3HiddenEvents
	dw SafariZoneRestHouse4HiddenEvents
	dw Route15GateUpstairsHiddenEvents
	dw LavenderHouse1HiddenEvents
	dw CeladonMansion5HiddenEvents
	dw FightingDojoHiddenEvents
	dw Route10HiddenEvents
	dw IndigoPlateauLobbyHiddenEvents
	dw CinnabarLab4HiddenEvents
	dw BikeShopHiddenEvents
	dw Route11HiddenEvents
	dw Route12HiddenEvents
	dw Mansion2HiddenEvents
	dw Mansion4HiddenEvents
	dw SilphCo11FHiddenEvents
	dw Route17HiddenEvents
	dw UndergroundPathNsHiddenEvents
	dw UndergroundPathWeHiddenEvents
	dw CeladonCityHiddenEvents
	dw SeafoamIslands4HiddenEvents
	dw VermilionCityHiddenEvents
	dw CeruleanCityHiddenEvents
	dw Route4HiddenEvents

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

TradeCenterHiddenEvents:
	hidden_event  5,  4, ANY_FACING, CableClubRightGameboy
	hidden_event  4,  4, ANY_FACING, CableClubLeftGameboy
	db -1 ; end

ColosseumHiddenEvents:
	hidden_event  5,  4, ANY_FACING, CableClubRightGameboy
	hidden_event  4,  4, ANY_FACING, CableClubLeftGameboy
	db -1 ; end

RedsHouse2FHiddenEvents:
	hidden_event  0,  1, SPRITE_FACING_UP, OpenRedsPC
	hidden_event  3,  5, ANY_FACING, PrintRedSNESText
	db -1 ; end

BluesHouseHiddenEvents:
	hidden_event  0,  1, SPRITE_FACING_UP, PrintBookcaseText
	hidden_event  1,  1, SPRITE_FACING_UP, PrintBookcaseText
	hidden_event  7,  1, SPRITE_FACING_UP, PrintBookcaseText
	db -1 ; end

OaksLabHiddenEvents:
	hidden_event  4,  0, SPRITE_FACING_UP, DisplayOakLabLeftPoster
	hidden_event  5,  0, SPRITE_FACING_UP, DisplayOakLabRightPoster
	hidden_event  0,  1, SPRITE_FACING_UP, DisplayOakLabEmailText
	hidden_event  1,  1, SPRITE_FACING_UP, DisplayOakLabEmailText
	db -1 ; end

ViridianPokecenterHiddenEvents:
	hidden_event  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	hidden_event 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

ViridianMartHiddenEvents:
	db -1 ; end

ViridianSchoolHiddenEvents:
	hidden_text_predef  3,  4, ViridianSchoolNotebook, PrintNotebookText
	hidden_text_predef  3,  0, ViridianSchoolBlackboard, PrintBlackboardLinkCableText
	db -1 ; end

ViridianGymHiddenEvents:
	hidden_event 15, 15, SPRITE_FACING_UP, GymStatues
	hidden_event 18, 15, SPRITE_FACING_UP, GymStatues
	db -1 ; end

Museum1FHiddenEvents:
	hidden_event  2,  3, SPRITE_FACING_UP, AerodactylFossil
	hidden_event  2,  6, SPRITE_FACING_UP, KabutopsFossil
	db -1 ; end

PewterGymHiddenEvents:
	hidden_event  3, 10, SPRITE_FACING_UP, GymStatues
	hidden_event  6, 10, SPRITE_FACING_UP, GymStatues
	db -1 ; end

PewterMartHiddenEvents:
	db -1 ; end

PewterPokecenterHiddenEvents:
	hidden_event  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	hidden_event 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

CeruleanPokecenterHiddenEvents:
	hidden_event  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	hidden_event 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

CeruleanGymHiddenEvents:
	hidden_event  3, 11, SPRITE_FACING_UP, GymStatues
	hidden_event  6, 11, SPRITE_FACING_UP, GymStatues
	db -1 ; end

CeruleanMartHiddenEvents:
	db -1 ; end

LavenderPokecenterHiddenEvents:
	hidden_event  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	hidden_event 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

VermilionPokecenterHiddenEvents:
	hidden_event 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	hidden_event  0,  4, SPRITE_FACING_UP, PrintBenchGuyText
	db -1 ; end

VermilionGymHiddenEvents:
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

CeladonMansion2HiddenEvents:
	hidden_event  0,  5, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

CeladonPokecenterHiddenEvents:
	hidden_event  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	hidden_event 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

CeladonGymHiddenEvents:
	hidden_event  3, 15, SPRITE_FACING_UP, GymStatues
	hidden_event  6, 15, SPRITE_FACING_UP, GymStatues
	db -1 ; end

GameCornerHiddenEvents:
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
	hidden_event  0,  8, COIN+10, HiddenCoins
	hidden_event  1, 16, COIN+10, HiddenCoins
	hidden_event  3, 11, COIN+20, HiddenCoins
	hidden_event  3, 14, COIN+10, HiddenCoins
	hidden_event  4, 12, COIN+10, HiddenCoins
	hidden_event  9, 12, COIN+20, HiddenCoins
	hidden_event  9, 15, COIN+10, HiddenCoins
	hidden_event 16, 14, COIN+10, HiddenCoins
	hidden_event 10, 16, COIN+10, HiddenCoins
	hidden_event 11,  7, COIN+40, HiddenCoins
	hidden_event 15,  8, COIN+100, HiddenCoins
	hidden_event 12, 15, COIN+10, HiddenCoins
	db -1 ; end

CeladonHotelHiddenEvents:
	hidden_event 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	hidden_event  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	db -1 ; end

FuchsiaPokecenterHiddenEvents:
	hidden_event 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	hidden_event  0,  4, SPRITE_FACING_UP, PrintBenchGuyText
	db -1 ; end

FuchsiaGymHiddenEvents:
	hidden_event  3, 15, SPRITE_FACING_UP, GymStatues
	hidden_event  6, 15, SPRITE_FACING_UP, GymStatues
	db -1 ; end

CinnabarGymHiddenEvents:
	hidden_event 17, 13, SPRITE_FACING_UP, GymStatues
	; third param: ([hGymGateAnswer] << 4) | [hGymGateIndex]
	hidden_event 15,  7, (FALSE << 4) | 1, PrintCinnabarQuiz
	hidden_event 10,  1, (TRUE  << 4) | 2, PrintCinnabarQuiz
	hidden_event  9,  7, (TRUE  << 4) | 3, PrintCinnabarQuiz
	hidden_event  9, 13, (TRUE  << 4) | 4, PrintCinnabarQuiz
	hidden_event  1, 13, (FALSE << 4) | 5, PrintCinnabarQuiz
	hidden_event  1,  7, (TRUE  << 4) | 6, PrintCinnabarQuiz
	db -1 ; end

CinnabarPokecenterHiddenEvents:
	hidden_event  0,  4, SPRITE_FACING_UP, PrintBenchGuyText
	hidden_event 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

SaffronGymHiddenEvents:
	hidden_event  9, 15, SPRITE_FACING_UP, GymStatues
	db -1 ; end

MtMoonPokecenterHiddenEvents:
	hidden_event  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	hidden_event 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

RockTunnelPokecenterHiddenEvents:
	hidden_event  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	hidden_event 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

ViridianForestHiddenEvents:
	hidden_event  1, 18, POTION, HiddenItems
	hidden_event 16, 42, ANTIDOTE, HiddenItems
	db -1 ; end

MtMoon3HiddenEvents:
	hidden_event 18, 12, MOON_STONE, HiddenItems
	hidden_event 33,  9, ETHER, HiddenItems
	db -1 ; end

IndigoPlateauHiddenEvents:
	hidden_event  8, 13, $ff, PrintIndigoPlateauHQText ; inaccessible
	hidden_event 11, 13, SPRITE_FACING_DOWN, PrintIndigoPlateauHQText ; inaccessible
	db -1 ; end

Route25HiddenEvents:
	hidden_event 38,  3, ETHER, HiddenItems
	hidden_event 10,  1, ELIXER, HiddenItems
	db -1 ; end

Route9HiddenEvents:
	hidden_event 14,  7, ETHER, HiddenItems
	db -1 ; end

SSAnne6HiddenEvents:
	hidden_event 13,  5, SPRITE_FACING_DOWN, PrintTrashText
	hidden_event 13,  7, SPRITE_FACING_DOWN, PrintTrashText
	hidden_event 13,  9, GREAT_BALL, HiddenItems
	db -1 ; end

SSAnne10HiddenEvents:
	hidden_event  3,  1, HYPER_POTION, HiddenItems
	db -1 ; end

Route10HiddenEvents:
	hidden_event  9, 17, SUPER_POTION, HiddenItems
	hidden_event 16, 53, MAX_ETHER, HiddenItems
	db -1 ; end

RocketHideout1HiddenEvents:
	hidden_event 21, 15, PP_UP, HiddenItems
	db -1 ; end

RocketHideout3HiddenEvents:
	hidden_event 27, 17, NUGGET, HiddenItems
	db -1 ; end

RocketHideout4HiddenEvents:
	hidden_event 25,  1, SUPER_POTION, HiddenItems
	db -1 ; end

SaffronPokecenterHiddenEvents:
	hidden_event  0,  4, SPRITE_FACING_UP, PrintBenchGuyText
	hidden_event 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

PokemonTower5HiddenEvents:
	hidden_event  4, 12, ELIXER, HiddenItems
	db -1 ; end

Route13HiddenEvents:
	hidden_event  1, 14, PP_UP, HiddenItems
	hidden_event 16, 13, CALCIUM, HiddenItems
	db -1 ; end

SafariZoneEntranceHiddenEvents:
	hidden_event 10,  1, NUGGET, HiddenItems ; inaccessible
	db -1 ; end

SafariZoneWestHiddenEvents:
	hidden_event  6,  5, REVIVE, HiddenItems
	db -1 ; end

SilphCo5FHiddenEvents:
	hidden_event 12,  3, ELIXER, HiddenItems
	db -1 ; end

SilphCo9FHiddenEvents:
	hidden_event  2, 15, MAX_POTION, HiddenItems
	db -1 ; end

CopycatsHouse2FHiddenEvents:
	hidden_event  1,  1, NUGGET, HiddenItems
	db -1 ; end

CeruleanCave1HiddenEvents:
	hidden_event 14, 11, RARE_CANDY, HiddenItems
	db -1 ; end

CeruleanCave3HiddenEvents:
	hidden_event 27,  3, ULTRA_BALL, HiddenItems
	db -1 ; end

PowerPlantHiddenEvents:
	hidden_event 17, 16, MAX_ELIXER, HiddenItems
	hidden_event 12,  1, PP_UP, HiddenItems
	db -1 ; end

SeafoamIslands3HiddenEvents:
	hidden_event 15, 15, NUGGET, HiddenItems
	db -1 ; end

SeafoamIslands5HiddenEvents:
	hidden_event 25, 17, ULTRA_BALL, HiddenItems
	db -1 ; end

Mansion1HiddenEvents:
	hidden_event  8, 16, MOON_STONE, HiddenItems
	hidden_event  2,  5, SPRITE_FACING_UP, Mansion1Script_Switches
	db -1 ; end

Mansion2HiddenEvents:
	hidden_event  2, 11, SPRITE_FACING_UP, Mansion2Script_Switches
	db -1 ; end

Mansion3HiddenEvents:
	hidden_event  1,  9, MAX_REVIVE, HiddenItems
	hidden_event 10,  5, SPRITE_FACING_UP, Mansion3Script_Switches
	db -1 ; end

Mansion4HiddenEvents:
	hidden_event  1,  9, RARE_CANDY, HiddenItems
	hidden_event 20,  3, SPRITE_FACING_UP, Mansion4Script_Switches
	hidden_event 18, 25, SPRITE_FACING_UP, Mansion4Script_Switches
	db -1 ; end

Route23HiddenEvents:
	hidden_event  9, 44, FULL_RESTORE, HiddenItems
	hidden_event 19, 70, ULTRA_BALL, HiddenItems
	hidden_event  8, 90, MAX_ETHER, HiddenItems
	db -1 ; end

VictoryRoad2HiddenEvents:
	hidden_event  5,  2, ULTRA_BALL, HiddenItems
	hidden_event 26,  7, FULL_RESTORE, HiddenItems
	db -1 ; end

Unused6FHiddenEvents:
	hidden_event 14, 11, MAX_ELIXER, HiddenItems
	db -1 ; end

BillsHouseHiddenEvents:
	hidden_event  1,  4, SPRITE_FACING_UP, BillsHousePC
	db -1 ; end

ViridianCityHiddenEvents:
	hidden_event 14,  4, POTION, HiddenItems
	db -1 ; end

SafariZoneRestHouse2HiddenEvents:
	hidden_event  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	hidden_event 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

SafariZoneRestHouse3HiddenEvents:
	hidden_event  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	hidden_event 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

SafariZoneRestHouse4HiddenEvents:
	hidden_event  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	hidden_event 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

Route15GateUpstairsHiddenEvents:
	hidden_event  1,  2, SPRITE_FACING_UP, Route15GateLeftBinoculars
	db -1 ; end

LavenderHouse1HiddenEvents:
	hidden_event  0,  1, SPRITE_FACING_DOWN, PrintMagazinesText
	hidden_event  1,  1, SPRITE_FACING_DOWN, PrintMagazinesText
	hidden_event  7,  1, SPRITE_FACING_DOWN, PrintMagazinesText
	db -1 ; end

CeladonMansion5HiddenEvents:
	hidden_text_predef  3,  0, LinkCableHelp, PrintBlackboardLinkCableText
	hidden_text_predef  4,  0, LinkCableHelp, PrintBlackboardLinkCableText
	hidden_text_predef  3,  4, TMNotebook, PrintNotebookText
	db -1 ; end

FightingDojoHiddenEvents:
	hidden_event  3,  9, SPRITE_FACING_UP, PrintFightingDojoText
	hidden_event  6,  9, SPRITE_FACING_UP, PrintFightingDojoText
	hidden_event  4,  0, SPRITE_FACING_UP, PrintFightingDojoText2
	hidden_event  5,  0, SPRITE_FACING_UP, PrintFightingDojoText3
	db -1 ; end

IndigoPlateauLobbyHiddenEvents:
	hidden_event 15,  7, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

CinnabarLab4HiddenEvents:
	hidden_event  0,  4, SPRITE_FACING_UP, OpenPokemonCenterPC
	hidden_event  2,  4, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

BikeShopHiddenEvents:
	hidden_event  1,  0, ANY_FACING, PrintNewBikeText
	hidden_event  2,  1, ANY_FACING, PrintNewBikeText
	hidden_event  1,  2, ANY_FACING, PrintNewBikeText
	hidden_event  3,  2, ANY_FACING, PrintNewBikeText
	hidden_event  0,  4, ANY_FACING, PrintNewBikeText
	hidden_event  1,  5, ANY_FACING, PrintNewBikeText
	db -1 ; end

Route11HiddenEvents:
	hidden_event 48,  5, ESCAPE_ROPE, HiddenItems
	db -1 ; end

Route12HiddenEvents:
	hidden_event  2, 63, HYPER_POTION, HiddenItems
	db -1 ; end

SilphCo11FHiddenEvents:
	hidden_event 10, 12, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

Route17HiddenEvents:
	hidden_event 15,  14, RARE_CANDY, HiddenItems
	hidden_event  8,  45, FULL_RESTORE, HiddenItems
	hidden_event 17,  72, PP_UP, HiddenItems
	hidden_event  4,  91, MAX_REVIVE, HiddenItems
	hidden_event  8, 121, MAX_ELIXER, HiddenItems
	db -1 ; end

UndergroundPathNsHiddenEvents:
	hidden_event  3,  4, FULL_RESTORE, HiddenItems
	hidden_event  4, 34, X_SPECIAL, HiddenItems
	db -1 ; end

UndergroundPathWeHiddenEvents:
	hidden_event 12,  2, NUGGET, HiddenItems
	hidden_event 21,  5, ELIXER, HiddenItems
	db -1 ; end

CeladonCityHiddenEvents:
	hidden_event 48, 15, PP_UP, HiddenItems
	db -1 ; end

SeafoamIslands4HiddenEvents:
	hidden_event  9, 16, MAX_ELIXER, HiddenItems
	db -1 ; end

VermilionCityHiddenEvents:
	hidden_event 14, 11, MAX_ETHER, HiddenItems
	db -1 ; end

CeruleanCityHiddenEvents:
	hidden_event 15,  8, RARE_CANDY, HiddenItems
	db -1 ; end

Route4HiddenEvents:
	hidden_event 40,  3, GREAT_BALL, HiddenItems
	db -1 ; end
