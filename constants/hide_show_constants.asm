DEF HIDE EQU $11
DEF SHOW EQU $15

; MissableObjects indexes (see data/maps/hide_show_data.asm)
; this is a list of the sprites that can be enabled/disabled during the game
; sprites marked with an X are constants that are never used
; because those sprites are not (de)activated in a map's script
; (they are either items or sprites that deactivate after battle
; and are detected in wMissableObjectList)

	const_def
	const HS_PALLET_TOWN_OAK               ; 00
	const HS_LYING_OLD_MAN                 ; 01
	const HS_OLD_MAN                       ; 02
	const HS_MUSEUM_GUY                    ; 03
	const HS_GYM_GUY                       ; 04
	const HS_CERULEAN_RIVAL                ; 05
	const HS_CERULEAN_ROCKET               ; 06
	const HS_CERULEAN_GUARD_1              ; 07
	const HS_CERULEAN_CAVE_GUY             ; 08
	const HS_CERULEAN_GUARD_2              ; 09
	const HS_SAFFRON_CITY_1                ; 0A
	const HS_SAFFRON_CITY_2                ; 0B
	const HS_SAFFRON_CITY_3                ; 0C
	const HS_SAFFRON_CITY_4                ; 0D
	const HS_SAFFRON_CITY_5                ; 0E
	const HS_SAFFRON_CITY_6                ; 0F
	const HS_SAFFRON_CITY_7                ; 10
	const HS_SAFFRON_CITY_8                ; 11
	const HS_SAFFRON_CITY_9                ; 12
	const HS_SAFFRON_CITY_A                ; 13
	const HS_SAFFRON_CITY_B                ; 14
	const HS_SAFFRON_CITY_C                ; 15
	const HS_SAFFRON_CITY_D                ; 16
	const HS_SAFFRON_CITY_E                ; 17
	const HS_SAFFRON_CITY_F                ; 18
	const HS_ROUTE_2_ITEM_1                ; 19 X
	const HS_ROUTE_2_ITEM_2                ; 1A X
	const HS_ROUTE_4_ITEM                  ; 1B X
	const HS_ROUTE_9_ITEM                  ; 1C X
	const HS_ROUTE_12_SNORLAX              ; 1D
	const HS_ROUTE_12_ITEM_1               ; 1E X
	const HS_ROUTE_12_ITEM_2               ; 1F X
	const HS_ROUTE_15_ITEM                 ; 20 X
	const HS_ROUTE_16_SNORLAX              ; 21
	const HS_ROUTE_22_RIVAL_1              ; 22
	const HS_ROUTE_22_RIVAL_2              ; 23
	const HS_NUGGET_BRIDGE_GUY             ; 24
	const HS_ROUTE_24_ITEM                 ; 25 X
	const HS_ROUTE_25_ITEM                 ; 26 X
	const HS_DAISY_SITTING                 ; 27
	const HS_DAISY_WALKING                 ; 28
	const HS_TOWN_MAP                      ; 29
	const HS_OAKS_LAB_RIVAL                ; 2A
	const HS_STARTER_BALL_1                ; 2B
	const HS_STARTER_BALL_2                ; 2C
	const HS_STARTER_BALL_3                ; 2D
	const HS_OAKS_LAB_OAK_1                ; 2E
	const HS_POKEDEX_1                     ; 2F
	const HS_POKEDEX_2                     ; 30
	const HS_OAKS_LAB_OAK_2                ; 31
	const HS_VIRIDIAN_GYM_GIOVANNI         ; 32
	const HS_VIRIDIAN_GYM_ITEM             ; 33 X
	const HS_OLD_AMBER                     ; 34
	const HS_CERULEAN_CAVE_1F_ITEM_1       ; 35 X
	const HS_CERULEAN_CAVE_1F_ITEM_2       ; 36 X
	const HS_CERULEAN_CAVE_1F_ITEM_3       ; 37 X
	const HS_POKEMON_TOWER_2F_RIVAL        ; 38
	const HS_POKEMON_TOWER_3F_ITEM         ; 39 X
	const HS_POKEMON_TOWER_4F_ITEM_1       ; 3A X
	const HS_POKEMON_TOWER_4F_ITEM_2       ; 3B X
	const HS_POKEMON_TOWER_4F_ITEM_3       ; 3C X
	const HS_POKEMON_TOWER_5F_ITEM         ; 3D X
	const HS_POKEMON_TOWER_6F_ITEM_1       ; 3E X
	const HS_POKEMON_TOWER_6F_ITEM_2       ; 3F X
	const HS_POKEMON_TOWER_7F_ROCKET_1     ; 40 X
	const HS_POKEMON_TOWER_7F_ROCKET_2     ; 41 X
	const HS_POKEMON_TOWER_7F_ROCKET_3     ; 42 X
	const HS_POKEMON_TOWER_7F_MR_FUJI      ; 43
	const HS_MR_FUJIS_HOUSE_MR_FUJI        ; 44
	const HS_CELADON_MANSION_EEVEE_GIFT    ; 45
	const HS_GAME_CORNER_ROCKET            ; 46
	const HS_WARDENS_HOUSE_ITEM            ; 47 X
	const HS_POKEMON_MANSION_1F_ITEM_1     ; 48 X
	const HS_POKEMON_MANSION_1F_ITEM_2     ; 49 X
	const HS_FIGHTING_DOJO_GIFT_1          ; 4A
	const HS_FIGHTING_DOJO_GIFT_2          ; 4B
	const HS_SILPH_CO_1F_RECEPTIONIST      ; 4C
	const HS_VOLTORB_1                     ; 4D X
	const HS_VOLTORB_2                     ; 4E X
	const HS_VOLTORB_3                     ; 4F X
	const HS_ELECTRODE_1                   ; 50 X
	const HS_VOLTORB_4                     ; 51 X
	const HS_VOLTORB_5                     ; 52 X
	const HS_ELECTRODE_2                   ; 53 X
	const HS_VOLTORB_6                     ; 54 X
	const HS_ZAPDOS                        ; 55 X
	const HS_POWER_PLANT_ITEM_1            ; 56 X
	const HS_POWER_PLANT_ITEM_2            ; 57 X
	const HS_POWER_PLANT_ITEM_3            ; 58 X
	const HS_POWER_PLANT_ITEM_4            ; 59 X
	const HS_POWER_PLANT_ITEM_5            ; 5A X
	const HS_MOLTRES                       ; 5B X
	const HS_VICTORY_ROAD_2F_ITEM_1        ; 5C X
	const HS_VICTORY_ROAD_2F_ITEM_2        ; 5D X
	const HS_VICTORY_ROAD_2F_ITEM_3        ; 5E X
	const HS_VICTORY_ROAD_2F_ITEM_4        ; 5F X
	const HS_VICTORY_ROAD_2F_BOULDER       ; 60
	const HS_BILL_POKEMON                  ; 61
	const HS_BILL_1                        ; 62
	const HS_BILL_2                        ; 63
	const HS_VIRIDIAN_FOREST_ITEM_1        ; 64 X
	const HS_VIRIDIAN_FOREST_ITEM_2        ; 65 X
	const HS_VIRIDIAN_FOREST_ITEM_3        ; 66 X
	const HS_MT_MOON_1F_ITEM_1             ; 67 X
	const HS_MT_MOON_1F_ITEM_2             ; 68 X
	const HS_MT_MOON_1F_ITEM_3             ; 69 X
	const HS_MT_MOON_1F_ITEM_4             ; 6A X
	const HS_MT_MOON_1F_ITEM_5             ; 6B X
	const HS_MT_MOON_1F_ITEM_6             ; 6C X
	const HS_MT_MOON_B2F_FOSSIL_1          ; 6D
	const HS_MT_MOON_B2F_FOSSIL_2          ; 6E
	const HS_MT_MOON_B2F_ITEM_1            ; 6F X
	const HS_MT_MOON_B2F_ITEM_2            ; 70 X
	const HS_SS_ANNE_2F_RIVAL              ; 71
	const HS_SS_ANNE_1F_ROOMS_ITEM         ; 72 X
	const HS_SS_ANNE_2F_ROOMS_ITEM_1       ; 73 X
	const HS_SS_ANNE_2F_ROOMS_ITEM_2       ; 74 X
	const HS_SS_ANNE_B1F_ROOMS_ITEM_1      ; 75 X
	const HS_SS_ANNE_B1F_ROOMS_ITEM_2      ; 76 X
	const HS_SS_ANNE_B1F_ROOMS_ITEM_3      ; 77 X
	const HS_VICTORY_ROAD_3F_ITEM_1        ; 78 X
	const HS_VICTORY_ROAD_3F_ITEM_2        ; 79 X
	const HS_VICTORY_ROAD_3F_BOULDER       ; 7A
	const HS_ROCKET_HIDEOUT_B1F_ITEM_1     ; 7B X
	const HS_ROCKET_HIDEOUT_B1F_ITEM_2     ; 7C X
	const HS_ROCKET_HIDEOUT_B2F_ITEM_1     ; 7D X
	const HS_ROCKET_HIDEOUT_B2F_ITEM_2     ; 7E X
	const HS_ROCKET_HIDEOUT_B2F_ITEM_3     ; 7F X
	const HS_ROCKET_HIDEOUT_B2F_ITEM_4     ; 80 X
	const HS_ROCKET_HIDEOUT_B3F_ITEM_1     ; 81 X
	const HS_ROCKET_HIDEOUT_B3F_ITEM_2     ; 82 X
	const HS_ROCKET_HIDEOUT_B4F_GIOVANNI   ; 83
	const HS_ROCKET_HIDEOUT_B4F_ITEM_1     ; 84 X
	const HS_ROCKET_HIDEOUT_B4F_ITEM_2     ; 85 X
	const HS_ROCKET_HIDEOUT_B4F_ITEM_3     ; 86 X
	const HS_ROCKET_HIDEOUT_B4F_ITEM_4     ; 87
	const HS_ROCKET_HIDEOUT_B4F_ITEM_5     ; 88
	const HS_SILPH_CO_2F_1                 ; 89 XXX never (de)activated?
	const HS_SILPH_CO_2F_2                 ; 8A
	const HS_SILPH_CO_2F_3                 ; 8B
	const HS_SILPH_CO_2F_4                 ; 8C
	const HS_SILPH_CO_2F_5                 ; 8D
	const HS_SILPH_CO_3F_1                 ; 8E
	const HS_SILPH_CO_3F_2                 ; 8F
	const HS_SILPH_CO_3F_ITEM              ; 90 X
	const HS_SILPH_CO_4F_1                 ; 91
	const HS_SILPH_CO_4F_2                 ; 92
	const HS_SILPH_CO_4F_3                 ; 93
	const HS_SILPH_CO_4F_ITEM_1            ; 94 X
	const HS_SILPH_CO_4F_ITEM_2            ; 95 X
	const HS_SILPH_CO_4F_ITEM_3            ; 96 X
	const HS_SILPH_CO_5F_1                 ; 97
	const HS_SILPH_CO_5F_2                 ; 98
	const HS_SILPH_CO_5F_3                 ; 99
	const HS_SILPH_CO_5F_4                 ; 9A
	const HS_SILPH_CO_5F_ITEM_1            ; 9B X
	const HS_SILPH_CO_5F_ITEM_2            ; 9C X
	const HS_SILPH_CO_5F_ITEM_3            ; 9D X
	const HS_SILPH_CO_6F_1                 ; 9E
	const HS_SILPH_CO_6F_2                 ; 9F
	const HS_SILPH_CO_6F_3                 ; A0
	const HS_SILPH_CO_6F_ITEM_1            ; A1 X
	const HS_SILPH_CO_6F_ITEM_2            ; A2 X
	const HS_SILPH_CO_7F_1                 ; A3
	const HS_SILPH_CO_7F_2                 ; A4
	const HS_SILPH_CO_7F_3                 ; A5
	const HS_SILPH_CO_7F_4                 ; A6
	const HS_SILPH_CO_7F_RIVAL             ; A7
	const HS_SILPH_CO_7F_ITEM_1            ; A8 X
	const HS_SILPH_CO_7F_ITEM_2            ; A9 X
	const HS_SILPH_CO_7F_8                 ; AA XXX sprite doesn't exist
	const HS_SILPH_CO_8F_1                 ; AB
	const HS_SILPH_CO_8F_2                 ; AC
	const HS_SILPH_CO_8F_3                 ; AD
	const HS_SILPH_CO_9F_1                 ; AE
	const HS_SILPH_CO_9F_2                 ; AF
	const HS_SILPH_CO_9F_3                 ; B0
	const HS_SILPH_CO_10F_1                ; B1
	const HS_SILPH_CO_10F_2                ; B2
	const HS_SILPH_CO_10F_3                ; B3 XXX never (de)activated?
	const HS_SILPH_CO_10F_ITEM_1           ; B4 X
	const HS_SILPH_CO_10F_ITEM_2           ; B5 X
	const HS_SILPH_CO_10F_ITEM_3           ; B6 X
	const HS_SILPH_CO_11F_1                ; B7
	const HS_SILPH_CO_11F_2                ; B8
	const HS_SILPH_CO_11F_3                ; B9
	const HS_UNUSED_MAP_F4_1               ; BA XXX sprite doesn't exist
	const HS_POKEMON_MANSION_2F_ITEM       ; BB X
	const HS_POKEMON_MANSION_3F_ITEM_1     ; BC X
	const HS_POKEMON_MANSION_3F_ITEM_2     ; BD X
	const HS_POKEMON_MANSION_B1F_ITEM_1    ; BE X
	const HS_POKEMON_MANSION_B1F_ITEM_2    ; BF X
	const HS_POKEMON_MANSION_B1F_ITEM_3    ; C0 X
	const HS_POKEMON_MANSION_B1F_ITEM_4    ; C1 X
	const HS_POKEMON_MANSION_B1F_ITEM_5    ; C2 X
	const HS_SAFARI_ZONE_EAST_ITEM_1       ; C3 X
	const HS_SAFARI_ZONE_EAST_ITEM_2       ; C4 X
	const HS_SAFARI_ZONE_EAST_ITEM_3       ; C5 X
	const HS_SAFARI_ZONE_EAST_ITEM_4       ; C6 X
	const HS_SAFARI_ZONE_NORTH_ITEM_1      ; C7 X
	const HS_SAFARI_ZONE_NORTH_ITEM_2      ; C8 X
	const HS_SAFARI_ZONE_WEST_ITEM_1       ; C9 X
	const HS_SAFARI_ZONE_WEST_ITEM_2       ; CA X
	const HS_SAFARI_ZONE_WEST_ITEM_3       ; CB X
	const HS_SAFARI_ZONE_WEST_ITEM_4       ; CC X
	const HS_SAFARI_ZONE_CENTER_ITEM       ; CD X
	const HS_CERULEAN_CAVE_2F_ITEM_1       ; CE X
	const HS_CERULEAN_CAVE_2F_ITEM_2       ; CF X
	const HS_CERULEAN_CAVE_2F_ITEM_3       ; D0 X
	const HS_MEWTWO                        ; D1 X
	const HS_CERULEAN_CAVE_B1F_ITEM_1      ; D2 X
	const HS_CERULEAN_CAVE_B1F_ITEM_2      ; D3 X
	const HS_VICTORY_ROAD_1F_ITEM_1        ; D4 X
	const HS_VICTORY_ROAD_1F_ITEM_2        ; D5 X
	const HS_CHAMPIONS_ROOM_OAK            ; D6
	const HS_SEAFOAM_ISLANDS_1F_BOULDER_1  ; D7
	const HS_SEAFOAM_ISLANDS_1F_BOULDER_2  ; D8
	const HS_SEAFOAM_ISLANDS_B1F_BOULDER_1 ; D9
	const HS_SEAFOAM_ISLANDS_B1F_BOULDER_2 ; DA
	const HS_SEAFOAM_ISLANDS_B2F_BOULDER_1 ; DB
	const HS_SEAFOAM_ISLANDS_B2F_BOULDER_2 ; DC
	const HS_SEAFOAM_ISLANDS_B3F_BOULDER_1 ; DD
	const HS_SEAFOAM_ISLANDS_B3F_BOULDER_2 ; DE
	const HS_SEAFOAM_ISLANDS_B3F_BOULDER_3 ; DF
	const HS_SEAFOAM_ISLANDS_B3F_BOULDER_4 ; E0
	const HS_SEAFOAM_ISLANDS_B4F_BOULDER_1 ; E1
	const HS_SEAFOAM_ISLANDS_B4F_BOULDER_2 ; E2
	const HS_ARTICUNO                      ; E3 X
DEF NUM_HS_OBJECTS EQU const_value
