; this is a list of the sprites that can be enabled/disabled during the game
; sprites marked with an X are constants that are never used
; because those sprites are not (de)activated in a map's script
; (they are either items or sprites that deactivate after battle
; and are detected in W_MISSABLEOBJECTLIST)

HS_PALLET_TOWN_OAK              EQU $00
HS_LYING_OLD_MAN                EQU $01
HS_OLD_MAN                      EQU $02
HS_MUSEUM_GUY                   EQU $03
HS_GYM_GUY                      EQU $04
HS_CERULEAN_RIVAL               EQU $05
HS_CERULEAN_ROCKET              EQU $06
HS_CERULEAN_GUARD_1             EQU $07
HS_UNKNOWN_DUNGEON_GUY          EQU $08
HS_CERULEAN_GUARD_2             EQU $09
HS_SAFFRON_CITY_1               EQU $0A
HS_SAFFRON_CITY_2               EQU $0B
HS_SAFFRON_CITY_3               EQU $0C
HS_SAFFRON_CITY_4               EQU $0D
HS_SAFFRON_CITY_5               EQU $0E
HS_SAFFRON_CITY_6               EQU $0F
HS_SAFFRON_CITY_7               EQU $10
HS_SAFFRON_CITY_8               EQU $11
HS_SAFFRON_CITY_9               EQU $12
HS_SAFFRON_CITY_A               EQU $13
HS_SAFFRON_CITY_B               EQU $14
HS_SAFFRON_CITY_C               EQU $15
HS_SAFFRON_CITY_D               EQU $16
HS_SAFFRON_CITY_E               EQU $17
HS_SAFFRON_CITY_F               EQU $18
HS_ROUTE_2_ITEM_1               EQU $19 ; X
HS_ROUTE_2_ITEM_2               EQU $1A ; X
HS_ROUTE_4_ITEM                 EQU $1B ; X
HS_ROUTE_9_ITEM                 EQU $1C ; X
HS_ROUTE_12_SNORLAX             EQU $1D
HS_ROUTE_12_ITEM_1              EQU $1E ; X
HS_ROUTE_12_ITEM_2              EQU $1F ; X
HS_ROUTE_15_ITEM                EQU $20 ; X
HS_ROUTE_16_SNORLAX             EQU $21
HS_ROUTE_22_RIVAL_1             EQU $22
HS_ROUTE_22_RIVAL_2             EQU $23
HS_NUGGET_BRIDGE_GUY            EQU $24
HS_ROUTE_24_ITEM                EQU $25 ; X
HS_ROUTE_25_ITEM                EQU $26 ; X
HS_DAISY_SITTING                EQU $27
HS_DAISY_WALKING                EQU $28
HS_TOWN_MAP                     EQU $29
HS_OAKS_LAB_RIVAL               EQU $2A
HS_STARTER_BALL_1               EQU $2B
HS_STARTER_BALL_2               EQU $2C
HS_STARTER_BALL_3               EQU $2D
HS_OAKS_LAB_OAK_1               EQU $2E
HS_POKEDEX_1                    EQU $2F
HS_POKEDEX_2                    EQU $30
HS_OAKS_LAB_OAK_2               EQU $31
HS_VIRIDIAN_GYM_GIOVANNI        EQU $32
HS_VIRIDIAN_GYM_ITEM            EQU $33 ; X
HS_OLD_AMBER                    EQU $34
HS_UNKNOWN_DUNGEON_1_ITEM_1     EQU $35 ; X
HS_UNKNOWN_DUNGEON_1_ITEM_2     EQU $36 ; X
HS_UNKNOWN_DUNGEON_1_ITEM_3     EQU $37 ; X
HS_POKEMONTOWER_2_RIVAL         EQU $38
HS_POKEMONTOWER_3_ITEM          EQU $39 ; X
HS_POKEMONTOWER_4_ITEM_1        EQU $3A ; X
HS_POKEMONTOWER_4_ITEM_2        EQU $3B ; X
HS_POKEMONTOWER_4_ITEM_3        EQU $3C ; X
HS_POKEMONTOWER_5_ITEM          EQU $3D ; X
HS_POKEMONTOWER_6_ITEM_1        EQU $3E ; X
HS_POKEMONTOWER_6_ITEM_2        EQU $3F ; X
HS_POKEMONTOWER_7_ROCKET_1      EQU $40 ; X
HS_POKEMONTOWER_7_ROCKET_2      EQU $41 ; X
HS_POKEMONTOWER_7_ROCKET_3      EQU $42 ; X
HS_POKEMONTOWER_7_MR_FUJI       EQU $43
HS_LAVENDER_HOUSE_1_MR_FUJI     EQU $44
HS_CELADON_MANSION_5_GIFT       EQU $45
HS_GAME_CORNER_ROCKET           EQU $46
HS_FUCHSIA_HOUSE_2_ITEM         EQU $47 ; X
HS_MANSION_1_ITEM_1             EQU $48 ; X
HS_MANSION_1_ITEM_2             EQU $49 ; X
HS_FIGHTING_DOJO_GIFT_1         EQU $4A
HS_FIGHTING_DOJO_GIFT_2         EQU $4B
HS_SILPH_CO_1F_1                EQU $4C
HS_VOLTORB_1                    EQU $4D ; X
HS_VOLTORB_2                    EQU $4E ; X
HS_VOLTORB_3                    EQU $4F ; X
HS_ELECTRODE_1                  EQU $50 ; X
HS_VOLTORB_4                    EQU $51 ; X
HS_VOLTORB_5                    EQU $52 ; X
HS_ELECTRODE_2                  EQU $53 ; X
HS_VOLTORB_6                    EQU $54 ; X
HS_ZAPDOS                       EQU $55 ; X
HS_POWER_PLANT_ITEM_1           EQU $56 ; X
HS_POWER_PLANT_ITEM_2           EQU $57 ; X
HS_POWER_PLANT_ITEM_3           EQU $58 ; X
HS_POWER_PLANT_ITEM_4           EQU $59 ; X
HS_POWER_PLANT_ITEM_5           EQU $5A ; X
HS_MOLTRES                      EQU $5B ; X
HS_VICTORY_ROAD_2_ITEM_1        EQU $5C ; X
HS_VICTORY_ROAD_2_ITEM_2        EQU $5D ; X
HS_VICTORY_ROAD_2_ITEM_3        EQU $5E ; X
HS_VICTORY_ROAD_2_ITEM_4        EQU $5F ; X
HS_VICTORY_ROAD_2_BOULDER       EQU $60
HS_BILL_POKEMON                 EQU $61
HS_BILL_1                       EQU $62
HS_BILL_2                       EQU $63
HS_VIRIDIAN_FOREST_ITEM_1       EQU $64 ; X
HS_VIRIDIAN_FOREST_ITEM_2       EQU $65 ; X
HS_VIRIDIAN_FOREST_ITEM_3       EQU $66 ; X
HS_MT_MOON_1_ITEM_1             EQU $67 ; X
HS_MT_MOON_1_ITEM_2             EQU $68 ; X
HS_MT_MOON_1_ITEM_3             EQU $69 ; X
HS_MT_MOON_1_ITEM_4             EQU $6A ; X
HS_MT_MOON_1_ITEM_5             EQU $6B ; X
HS_MT_MOON_1_ITEM_6             EQU $6C ; X
HS_MT_MOON_3_FOSSIL_1           EQU $6D
HS_MT_MOON_3_FOSSIL_2           EQU $6E
HS_MT_MOON_3_ITEM_1             EQU $6F ; X
HS_MT_MOON_3_ITEM_2             EQU $70 ; X
HS_SS_ANNE_2_RIVAL              EQU $71
HS_SS_ANNE_8_ITEM               EQU $72 ; X
HS_SS_ANNE_9_ITEM_1             EQU $73 ; X
HS_SS_ANNE_9_ITEM_2             EQU $74 ; X
HS_SS_ANNE_10_ITEM_1            EQU $75 ; X
HS_SS_ANNE_10_ITEM_2            EQU $76 ; X
HS_SS_ANNE_10_ITEM_3            EQU $77 ; X
HS_VICTORY_ROAD_3_ITEM_1        EQU $78 ; X
HS_VICTORY_ROAD_3_ITEM_2        EQU $79 ; X
HS_VICTORY_ROAD_3_BOULDER       EQU $7A
HS_ROCKET_HIDEOUT_1_ITEM_1      EQU $7B ; X
HS_ROCKET_HIDEOUT_1_ITEM_2      EQU $7C ; X
HS_ROCKET_HIDEOUT_2_ITEM_1      EQU $7D ; X
HS_ROCKET_HIDEOUT_2_ITEM_2      EQU $7E ; X
HS_ROCKET_HIDEOUT_2_ITEM_3      EQU $7F ; X
HS_ROCKET_HIDEOUT_2_ITEM_4      EQU $80 ; X
HS_ROCKET_HIDEOUT_3_ITEM_1      EQU $81 ; X
HS_ROCKET_HIDEOUT_3_ITEM_2      EQU $82 ; X
HS_ROCKET_HIDEOUT_4_GIOVANNI    EQU $83
HS_ROCKET_HIDEOUT_4_ITEM_1      EQU $84 ; X
HS_ROCKET_HIDEOUT_4_ITEM_2      EQU $85 ; X
HS_ROCKET_HIDEOUT_4_ITEM_3      EQU $86 ; X
HS_ROCKET_HIDEOUT_4_ITEM_4      EQU $87
HS_ROCKET_HIDEOUT_4_ITEM_5      EQU $88
HS_SILPH_CO_2F_1                EQU $89 ; XXX never (de)activated?
HS_SILPH_CO_2F_2                EQU $8A
HS_SILPH_CO_2F_3                EQU $8B
HS_SILPH_CO_2F_4                EQU $8C
HS_SILPH_CO_2F_5                EQU $8D
HS_SILPH_CO_3F_1                EQU $8E
HS_SILPH_CO_3F_2                EQU $8F
HS_SILPH_CO_3F_3                EQU $90 ; X
HS_SILPH_CO_4F_1                EQU $91
HS_SILPH_CO_4F_2                EQU $92
HS_SILPH_CO_4F_3                EQU $93
HS_SILPH_CO_4F_4                EQU $94 ; X
HS_SILPH_CO_4F_5                EQU $95 ; X
HS_SILPH_CO_4F_6                EQU $96 ; X
HS_SILPH_CO_5F_1                EQU $97
HS_SILPH_CO_5F_2                EQU $98
HS_SILPH_CO_5F_3                EQU $99
HS_SILPH_CO_5F_4                EQU $9A
HS_SILPH_CO_5F_5                EQU $9B ; X
HS_SILPH_CO_5F_6                EQU $9C ; X
HS_SILPH_CO_5F_7                EQU $9D ; X
HS_SILPH_CO_6F_1                EQU $9E
HS_SILPH_CO_6F_2                EQU $9F
HS_SILPH_CO_6F_3                EQU $A0
HS_SILPH_CO_6F_4                EQU $A1 ; X
HS_SILPH_CO_6F_5                EQU $A2 ; X
HS_SILPH_CO_7F_1                EQU $A3
HS_SILPH_CO_7F_2                EQU $A4
HS_SILPH_CO_7F_3                EQU $A5
HS_SILPH_CO_7F_4                EQU $A6
HS_SILPH_CO_7F_5                EQU $A7
HS_SILPH_CO_7F_6                EQU $A8 ; X
HS_SILPH_CO_7F_7                EQU $A9 ; X
HS_SILPH_CO_7F_8                EQU $AA ; X
HS_SILPH_CO_8F_1                EQU $AB
HS_SILPH_CO_8F_2                EQU $AC
HS_SILPH_CO_8F_3                EQU $AD
HS_SILPH_CO_9F_1                EQU $AE
HS_SILPH_CO_9F_2                EQU $AF
HS_SILPH_CO_9F_3                EQU $B0
HS_SILPH_CO_10F_1               EQU $B1
HS_SILPH_CO_10F_2               EQU $B2
HS_SILPH_CO_10F_3               EQU $B3 ; X
HS_SILPH_CO_10F_4               EQU $B4 ; X
HS_SILPH_CO_10F_5               EQU $B5 ; X
HS_SILPH_CO_10F_6               EQU $B6 ; X
HS_SILPH_CO_11F_1               EQU $B7
HS_SILPH_CO_11F_2               EQU $B8
HS_SILPH_CO_11F_3               EQU $B9
;HS_MAP_F4_1                    EQU $BA
HS_MANSION_2_ITEM               EQU $BB ; X
HS_MANSION_3_ITEM_1             EQU $BC ; X
HS_MANSION_3_ITEM_2             EQU $BD ; X
HS_MANSION_4_ITEM_1             EQU $BE ; X
HS_MANSION_4_ITEM_2             EQU $BF ; X
HS_MANSION_4_ITEM_3             EQU $C0 ; X
HS_MANSION_4_ITEM_4             EQU $C1 ; X
HS_MANSION_4_ITEM_5             EQU $C2 ; X
HS_SAFARI_ZONE_EAST_ITEM_1      EQU $C3 ; X
HS_SAFARI_ZONE_EAST_ITEM_2      EQU $C4 ; X
HS_SAFARI_ZONE_EAST_ITEM_3      EQU $C5 ; X
HS_SAFARI_ZONE_EAST_ITEM_4      EQU $C6 ; X
HS_SAFARI_ZONE_NORTH_ITEM_1     EQU $C7 ; X
HS_SAFARI_ZONE_NORTH_ITEM_2     EQU $C8 ; X
HS_SAFARI_ZONE_WEST_ITEM_1      EQU $C9 ; X
HS_SAFARI_ZONE_WEST_ITEM_2      EQU $CA ; X
HS_SAFARI_ZONE_WEST_ITEM_3      EQU $CB ; X
HS_SAFARI_ZONE_WEST_ITEM_4      EQU $CC ; X
HS_SAFARI_ZONE_CENTER_ITEM      EQU $CD ; X
HS_UNKNOWN_DUNGEON_2_ITEM_1     EQU $CE ; X
HS_UNKNOWN_DUNGEON_2_ITEM_2     EQU $CF ; X
HS_UNKNOWN_DUNGEON_2_ITEM_3     EQU $D0 ; X
HS_MEWTWO                       EQU $D1 ; X
HS_UNKNOWN_DUNGEON_3_ITEM_1     EQU $D2 ; X
HS_UNKNOWN_DUNGEON_3_ITEM_2     EQU $D3 ; X
HS_VICTORY_ROAD_1_ITEM_1        EQU $D4 ; X
HS_VICTORY_ROAD_1_ITEM_2        EQU $D5 ; X
HS_CHAMPIONS_ROOM_OAK           EQU $D6
HS_SEAFOAM_ISLANDS_1_BOULDER_1  EQU $D7
HS_SEAFOAM_ISLANDS_1_BOULDER_2  EQU $D8
HS_SEAFOAM_ISLANDS_2_BOULDER_1  EQU $D9
HS_SEAFOAM_ISLANDS_2_BOULDER_2  EQU $DA
HS_SEAFOAM_ISLANDS_3_BOULDER_1  EQU $DB
HS_SEAFOAM_ISLANDS_3_BOULDER_2  EQU $DC
HS_SEAFOAM_ISLANDS_4_BOULDER_1  EQU $DD
HS_SEAFOAM_ISLANDS_4_BOULDER_2  EQU $DE
HS_SEAFOAM_ISLANDS_4_BOULDER_3  EQU $DF
HS_SEAFOAM_ISLANDS_4_BOULDER_4  EQU $E0
HS_SEAFOAM_ISLANDS_5_BOULDER_1  EQU $E1
HS_SEAFOAM_ISLANDS_5_BOULDER_2  EQU $E2
HS_ARTICUNO                     EQU $E3 ; X
