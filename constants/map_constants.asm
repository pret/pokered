MACRO mapconst
	const \1
	DEF \1_HEIGHT EQU \2
	DEF \1_WIDTH EQU \3
ENDM

; map ids
; indexes for:
; - MapHeaderBanks (see data/maps/map_header_banks.asm)
; - MapHeaderPointers (see data/maps/map_header_pointers.asm)
; - MapSongBanks (see data/maps/songs.asm)
; - MapHSPointers (see data/maps/hide_show_data.asm)
; - MapSpriteSets (see data/maps/sprite_sets.asm)
; - ExternalMapEntries (see data/maps/town_map_entries.asm)
; - WildDataPointers (see data/wild/grass_water.asm)
; Each map also has associated data in maps.asm.
; Order: towns/cities, then routes, then indoor/dungeon maps
	const_def
	mapconst PALLET_TOWN,                    9, 10 ; $00
	mapconst VIRIDIAN_CITY,                 18, 20 ; $01
	mapconst PEWTER_CITY,                   18, 20 ; $02
	mapconst CERULEAN_CITY,                 18, 20 ; $03
	mapconst LAVENDER_TOWN,                  9, 10 ; $04
	mapconst VERMILION_CITY,                18, 20 ; $05
	mapconst CELADON_CITY,                  18, 25 ; $06
	mapconst FUCHSIA_CITY,                  18, 20 ; $07
	mapconst CINNABAR_ISLAND,               15, 14 ; $08
	mapconst INDIGO_PLATEAU,                 9, 10 ; $09
	mapconst SAFFRON_CITY,                  18, 20 ; $0A
	mapconst CITRINE_CITY,                  18, 20 ; $0B
DEF NUM_CITY_MAPS EQU const_value ; eorsunica: move this line under Celadon Uni Outside to include it in the Fly Map
	mapconst CELADON_UNIVERSITY_OUTSIDE,    20, 21 ; $0C
DEF FIRST_ROUTE_MAP EQU const_value
	mapconst ROUTE_1,                       18, 10 ; $0D
	mapconst ROUTE_2,                       36, 10 ; $0E
	mapconst ROUTE_3,                        9, 35 ; $0F
	mapconst ROUTE_4,                        9, 45 ; $10
	mapconst ROUTE_5,                       18, 10 ; $11
	mapconst ROUTE_6,                       18, 10 ; $12
	mapconst ROUTE_7,                        9, 10 ; $13
	mapconst ROUTE_8,                        9, 30 ; $14
	mapconst ROUTE_9,                       13, 30 ; $15
	mapconst ROUTE_10,                      40, 10 ; $16
	mapconst ROUTE_11,                       9, 30 ; $17
	mapconst ROUTE_12,                      54, 10 ; $18
	mapconst ROUTE_13,                       9, 30 ; $19
	mapconst ROUTE_14,                      27, 10 ; $1A
	mapconst ROUTE_15,                       9, 30 ; $1B
	mapconst ROUTE_16,                       9, 20 ; $1C
	mapconst ROUTE_17,                      72, 10 ; $1D
	mapconst ROUTE_18,                       9, 25 ; $1E
	mapconst ROUTE_19,                      27, 10 ; $1F
	mapconst ROUTE_20,                      15, 50 ; $10
	mapconst ROUTE_21,                      45, 10 ; $21
	mapconst ROUTE_22,                       9, 20 ; $22
	mapconst ROUTE_23,                      72, 10 ; $23
	mapconst ROUTE_24,                      18, 10 ; $24
	mapconst ROUTE_25,                       9, 37 ; $25
DEF FIRST_INDOOR_MAP EQU const_value
	mapconst REDS_HOUSE_1F,                  4,  4 ; $26
	mapconst REDS_HOUSE_2F,                  4,  4 ; $27
	mapconst BLUES_HOUSE,                    4,  4 ; $28
	mapconst OAKS_LAB,                       6,  7 ; $29
	mapconst VIRIDIAN_POKECENTER,            4,  7 ; $2A
	mapconst VIRIDIAN_MART,                  4,  4 ; $2B
	mapconst VIRIDIAN_SCHOOL_HOUSE,          4,  4 ; $2C
	mapconst VIRIDIAN_NICKNAME_HOUSE,        4,  4 ; $2D
	mapconst VIRIDIAN_GYM,                   9, 10 ; $2E
	mapconst DIGLETTS_CAVE_ROUTE_2,          4,  4 ; $2F
	mapconst VIRIDIAN_FOREST_NORTH_GATE,     4,  5 ; $20
	mapconst ROUTE_2_TRADE_HOUSE,            4,  4 ; $31
	mapconst ROUTE_2_GATE,                   4,  5 ; $32
	mapconst VIRIDIAN_FOREST_SOUTH_GATE,     4,  5 ; $33
	mapconst VIRIDIAN_FOREST,               24, 17 ; $34
	mapconst MUSEUM_1F,                      4, 10 ; $35
	mapconst MUSEUM_2F,                      4,  7 ; $36
	mapconst PEWTER_GYM,                     7,  5 ; $37
	mapconst PEWTER_NIDORAN_HOUSE,           4,  4 ; $38
	mapconst PEWTER_MART,                    4,  4 ; $39
	mapconst PEWTER_SPEECH_HOUSE,            4,  4 ; $3A
	mapconst PEWTER_POKECENTER,              4,  7 ; $3B
	mapconst MT_MOON_1F,                    18, 20 ; $3C
	mapconst MT_MOON_B1F,                   14, 14 ; $3D
	mapconst MT_MOON_B2F,                   18, 20 ; $3E
	mapconst CERULEAN_TRASHED_HOUSE,         4,  4 ; $3F
	mapconst CERULEAN_TRADE_HOUSE,           4,  4 ; $30
	mapconst CERULEAN_POKECENTER,            4,  7 ; $41
	mapconst CERULEAN_GYM,                   7,  5 ; $42
	mapconst BIKE_SHOP,                      4,  4 ; $43
	mapconst CERULEAN_MART,                  4,  4 ; $44
	mapconst MT_MOON_POKECENTER,             4,  7 ; $45
	mapconst VIRIDIAN_PRE_GYM,			     7,  5 ; $46	- was CERULEAN_TRASHED_HOUSE_COPY
	mapconst ROUTE_5_GATE,                   3,  4 ; $47
	mapconst UNDERGROUND_PATH_ROUTE_5,       4,  4 ; $48
	mapconst DAYCARE,                        4,  4 ; $49
	mapconst ROUTE_6_GATE,                   3,  4 ; $4A
	mapconst UNDERGROUND_PATH_ROUTE_6,       4,  4 ; $4B
	mapconst UNDERGROUND_PATH_ROUTE_6_COPY,  4,  4 ; $4C	- Unused
	mapconst ROUTE_7_GATE,                   4,  3 ; $4D
	mapconst UNDERGROUND_PATH_ROUTE_7,       4,  4 ; $4E
	mapconst UNDERGROUND_PATH_ROUTE_7_COPY,  4,  4 ; $4F	- Unused
	mapconst ROUTE_8_GATE,                   4,  3 ; $40
	mapconst UNDERGROUND_PATH_ROUTE_8,       4,  4 ; $51
	mapconst ROCK_TUNNEL_POKECENTER,         4,  7 ; $52
	mapconst ROCK_TUNNEL_1F,                18, 20 ; $53
	mapconst POWER_PLANT,                   18, 20 ; $54
	mapconst ROUTE_11_GATE_1F,               5,  4 ; $55
	mapconst DIGLETTS_CAVE_ROUTE_11,         4,  4 ; $56
	mapconst ROUTE_11_GATE_2F,               4,  4 ; $57
	mapconst ROUTE_12_GATE_1F,               4,  5 ; $58
	mapconst BILLS_HOUSE,                    4,  7 ; $59
	mapconst VERMILION_POKECENTER,           4,  7 ; $5A
	mapconst POKEMON_FAN_CLUB,               4,  4 ; $5B
	mapconst VERMILION_MART,                 4,  4 ; $5C
	mapconst VERMILION_GYM,                  9,  5 ; $5D
	mapconst VERMILION_PIDGEY_HOUSE,         4,  4 ; $5E
	mapconst VERMILION_DOCK,                 6, 14 ; $5F
	mapconst SS_ANNE_1F,                     9, 20 ; $50
	mapconst SS_ANNE_2F,                     9, 20 ; $61
	mapconst SS_ANNE_3F,                     3, 10 ; $62
	mapconst SS_ANNE_B1F,                    4, 15 ; $63
	mapconst SS_ANNE_BOW,                    7, 10 ; $64
	mapconst SS_ANNE_KITCHEN,                8,  7 ; $65
	mapconst SS_ANNE_CAPTAINS_ROOM,          4,  3 ; $66
	mapconst SS_ANNE_1F_ROOMS,               8, 12 ; $67
	mapconst SS_ANNE_2F_ROOMS,               8, 12 ; $68
	mapconst SS_ANNE_B1F_ROOMS,              8, 12 ; $69
	mapconst SILPH_GAUNTLET_1F,              9, 10 ; $6A	- Was UNUSED_MAP_69
	mapconst SILPH_GAUNTLET_2F,             10, 13 ; $6B	- Was UNUSED_MAP_6A
	mapconst SILPH_GAUNTLET_3F,             13, 17 ; $6C	- Was UNUSED_MAP_6B
	mapconst VICTORY_ROAD_1F,                9, 10 ; $6D
	mapconst SILPH_GAUNTLET_4F,              9, 10 ; $6E	- Was UNUSED_MAP_6D
	mapconst SILPH_GAUNTLET_5F,              9, 10 ; $6F	- Was UNUSED_MAP_6E
	mapconst SILPH_GAUNTLET_6F,             12, 12 ; $60	- Was UNUSED_MAP_6F
	mapconst SILPH_GAUNTLET_7F,              5,  6 ; $71	- Was UNUSED_MAP_70
	mapconst LANCES_ROOM,                   13, 13 ; $72
	mapconst FARAWAY_ISLAND_OUTSIDE,       18,  15 ; $73	- Was UNUSED_MAP_72
	mapconst FARAWAY_ISLAND_INSIDE,        11,  15 ; $74	- Was UNUSED_MAP_73
	mapconst POKEMON_MANSION_B2F,          12,  15 ; $75	- Was UNUSED_MAP_74
	mapconst MT_MOON_CRATER,               25,  25 ; $76	- Was UNUSED_MAP_75
	mapconst HALL_OF_FAME,                   4,  5 ; $77
	mapconst UNDERGROUND_PATH_NORTH_SOUTH,  24,  4 ; $78
	mapconst CHAMPIONS_ROOM,                 4,  4 ; $79
	mapconst UNDERGROUND_PATH_WEST_EAST,     4, 25 ; $7A
	mapconst CELADON_MART_1F,                4, 10 ; $7B
	mapconst CELADON_MART_2F,                4, 10 ; $7C
	mapconst CELADON_MART_3F,                4, 10 ; $7D
	mapconst CELADON_MART_4F,                4, 10 ; $7E
	mapconst CELADON_MART_ROOF,              4, 10 ; $7F
	mapconst CELADON_MART_ELEVATOR,          2,  2 ; $70
	mapconst CELADON_MANSION_1F,             6,  4 ; $81
	mapconst CELADON_MANSION_2F,             6,  4 ; $82
	mapconst CELADON_MANSION_3F,             6,  4 ; $83
	mapconst CELADON_MANSION_ROOF,           6,  4 ; $84
	mapconst CELADON_MANSION_ROOF_HOUSE,     4,  4 ; $85
	mapconst CELADON_POKECENTER,             4,  7 ; $86
	mapconst CELADON_GYM,                    9,  5 ; $87
	mapconst GAME_CORNER,                    9, 10 ; $88
	mapconst CELADON_MART_5F,                4, 10 ; $89
	mapconst GAME_CORNER_PRIZE_ROOM,         4,  5 ; $8A
	mapconst CELADON_DINER,                  4,  5 ; $8B
	mapconst CELADON_CHIEF_HOUSE,            4,  4 ; $8C
	mapconst CELADON_HOTEL,                  4,  7 ; $8D
	mapconst LAVENDER_POKECENTER,            4,  7 ; $8E
	mapconst POKEMON_TOWER_1F,               9, 10 ; $8F
	mapconst POKEMON_TOWER_2F,               9, 10 ; $80
	mapconst POKEMON_TOWER_3F,               9, 10 ; $91	- Now unused
	mapconst POKEMON_TOWER_4F,               9, 10 ; $92	- Now unused
	mapconst POKEMON_TOWER_5F,               9, 10 ; $93	- Now unused
	mapconst POKEMON_TOWER_6F,               9, 10 ; $94
	mapconst POKEMON_TOWER_7F,               9, 10 ; $95
	mapconst MR_FUJIS_HOUSE,                 4,  4 ; $96
	mapconst LAVENDER_MART,                  4,  4 ; $97
	mapconst LAVENDER_CUBONE_HOUSE,          4,  4 ; $98
	mapconst FUCHSIA_MART,                   4,  4 ; $99
	mapconst FUCHSIA_BILLS_GRANDPAS_HOUSE,   4,  4 ; $9A
	mapconst FUCHSIA_POKECENTER,             4,  7 ; $9B
	mapconst WARDENS_HOUSE,                  4,  5 ; $9C
	mapconst SAFARI_ZONE_GATE,               3,  4 ; $9D
	mapconst FUCHSIA_GYM,                    9,  5 ; $9E
	mapconst FUCHSIA_MEETING_ROOM,           4,  7 ; $9F
	mapconst SEAFOAM_ISLANDS_B1F,            9, 15 ; $90
	mapconst SEAFOAM_ISLANDS_B2F,            9, 15 ; $A1
	mapconst SEAFOAM_ISLANDS_B3F,            9, 15 ; $A2
	mapconst SEAFOAM_ISLANDS_B4F,            9, 15 ; $A3
	mapconst VERMILION_OLD_ROD_HOUSE,        4,  4 ; $A4	- Now unused
	mapconst FUCHSIA_GOOD_ROD_HOUSE,         4,  4 ; $A5
	mapconst POKEMON_MANSION_1F,            14, 15 ; $A6
	mapconst CINNABAR_GYM,                   9, 10 ; $A7
	mapconst CINNABAR_LAB,                   4,  9 ; $A8
	mapconst CINNABAR_LAB_TRADE_ROOM,        4,  4 ; $A9
	mapconst CINNABAR_LAB_METRONOME_ROOM,    4,  4 ; $AA
	mapconst CINNABAR_LAB_FOSSIL_ROOM,       4,  4 ; $AB
	mapconst CINNABAR_POKECENTER,            4,  7 ; $AC
	mapconst CINNABAR_MART,                  4,  4 ; $AD
	mapconst CINNABAR_MART_COPY,             4,  4 ; $AE	- Unused
	mapconst INDIGO_PLATEAU_LOBBY,           6,  8 ; $AF
	mapconst COPYCATS_HOUSE_1F,              4,  4 ; $A0
	mapconst COPYCATS_HOUSE_2F,              4,  4 ; $B1
	mapconst FIGHTING_DOJO,                  6,  5 ; $B2
	mapconst SAFFRON_GYM,                    9, 10 ; $B3
	mapconst SAFFRON_PIDGEY_HOUSE,           4,  4 ; $B4
	mapconst SAFFRON_MART,                   4,  4 ; $B5
	mapconst SILPH_CO_1F,                    9, 15 ; $B6
	mapconst SAFFRON_POKECENTER,             4,  7 ; $B7
	mapconst MR_PSYCHICS_HOUSE,              4,  4 ; $B8
	mapconst ROUTE_15_GATE_1F,               5,  4 ; $B9
	mapconst ROUTE_15_GATE_2F,               4,  4 ; $BA
	mapconst ROUTE_16_GATE_1F,               7,  4 ; $BB
	mapconst ROUTE_16_GATE_2F,               4,  4 ; $BC
	mapconst ROUTE_16_FLY_HOUSE,             4,  4 ; $BD
	mapconst ROUTE_12_SUPER_ROD_HOUSE,       4,  4 ; $BE
	mapconst ROUTE_18_GATE_1F,               5,  4 ; $BF
	mapconst ROUTE_18_GATE_2F,               4,  4 ; $B0
	mapconst SEAFOAM_ISLANDS_1F,             9, 15 ; $C1
	mapconst ROUTE_22_GATE,                  4,  5 ; $C2
	mapconst VICTORY_ROAD_2F,                9, 15 ; $C3
	mapconst ROUTE_12_GATE_2F,               4,  4 ; $C4
	mapconst VERMILION_TRADE_HOUSE,          4,  4 ; $C5
	mapconst DIGLETTS_CAVE,                 18, 20 ; $C6
	mapconst VICTORY_ROAD_3F,                9, 15 ; $C7
	mapconst ROCKET_HIDEOUT_B1F,            14, 11 ; $C8
	mapconst ROCKET_HIDEOUT_B2F,            14, 15 ; $C9	- Now unused, Citrine PokeCenter?
	mapconst ROCKET_HIDEOUT_B3F,            14, 15 ; $CA	- Now unused, Citrine PokeMart?
	mapconst ROCKET_HIDEOUT_B4F,            12, 15 ; $CB	- Now unused, Citrine House 1?
	mapconst ROCKET_HIDEOUT_ELEVATOR,        4,  3 ; $CC	- Now unused, Citrine Dock?
	mapconst UNUSED_MAP_CC,                  0,  0 ; $CD	- Unused, Citrine House 2?
	mapconst UNUSED_MAP_CD,                  0,  0 ; $CE	- Unused, Citrine Cave 1F?
	mapconst UNUSED_MAP_CE,                  0,  0 ; $CF	- Unused, Citrine Cave B1F?
	mapconst SILPH_CO_2F,                    9, 15 ; $C0
	mapconst SILPH_CO_3F,                    9, 15 ; $D1
	mapconst SILPH_CO_4F,                    9, 15 ; $D2
	mapconst SILPH_CO_5F,                    9, 15 ; $D3
	mapconst SILPH_CO_6F,                    9, 13 ; $D4
	mapconst SILPH_CO_7F,                    9, 13 ; $D5
	mapconst SILPH_CO_8F,                    9, 13 ; $D6
	mapconst POKEMON_MANSION_2F,            14, 15 ; $D7
	mapconst POKEMON_MANSION_3F,             9, 15 ; $D8
	mapconst POKEMON_MANSION_B1F,           14, 15 ; $D9
	mapconst SAFARI_ZONE_EAST,              13, 15 ; $DA
	mapconst SAFARI_ZONE_NORTH,             18, 20 ; $DB
	mapconst SAFARI_ZONE_WEST,              13, 15 ; $DC
	mapconst SAFARI_ZONE_CENTER,            13, 15 ; $DD
	mapconst SAFARI_ZONE_CENTER_REST_HOUSE,  4,  4 ; $DE
	mapconst SAFARI_ZONE_SECRET_HOUSE,       4,  4 ; $DF
	mapconst SAFARI_ZONE_WEST_REST_HOUSE,    4,  4 ; $D0
	mapconst SAFARI_ZONE_EAST_REST_HOUSE,    4,  4 ; $E1
	mapconst SAFARI_ZONE_NORTH_REST_HOUSE,   4,  4 ; $E2
	mapconst CERULEAN_CAVE_2F,               9, 15 ; $E3
	mapconst CERULEAN_CAVE_B1F,              9, 15 ; $E4
	mapconst CERULEAN_CAVE_1F,               9, 15 ; $E5
	mapconst NAME_RATERS_HOUSE,              4,  4 ; $E6
	mapconst CERULEAN_BADGE_HOUSE,           4,  4 ; $E7
	mapconst CINNABAR_VOLCANO,              12, 14 ; $E8	- Was UNUSED_MAP_E7
	mapconst ROCK_TUNNEL_B1F,               18, 20 ; $E9
	mapconst SILPH_CO_9F,                    9, 13 ; $EA
	mapconst SILPH_CO_10F,                   9,  8 ; $EB
	mapconst SILPH_CO_11F,                   9,  9 ; $EC
	mapconst SILPH_CO_ELEVATOR,              2,  2 ; $ED
	mapconst UNUSED_MAP_ED,                  0,  0 ; $EE	- Unused
	mapconst UNDERWATER_TUNNEL,              9, 15 ; $EF	- Was UNUSED_MAP_EE
	mapconst TRADE_CENTER,                   4,  5 ; $E0
	mapconst COLOSSEUM,                      4,  5 ; $F2
	mapconst CELADON_UNIVERSITY_INSIDE,     10, 11 ; $F3	- Was UNUSED_MAP_F1
	mapconst CELADON_UNIVERSITY_POKECENTER,  4,  7 ; $F4	- Was UNUSED_MAP_F2
	mapconst BILLS_GARDEN,                   9,  8 ; $F5	- Was UNUSED_MAP_F3
	mapconst LORELEIS_ROOM,                  6,  5 ; $F6
	mapconst BRUNOS_ROOM,                    6,  5 ; $F7
	mapconst AGATHAS_ROOM,                   6,  5 ; $F8	- Maps F9 - FE currently have no data
DEF NUM_MAPS EQU const_value

; Indoor maps, such as houses, use this as the Map ID in their exit warps
; This map ID takes the player back to the last outdoor map they were on, stored in wLastMap
DEF LAST_MAP EQU -1
