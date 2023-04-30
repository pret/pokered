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
	const HS_SAFFRON_CITY_UP_GRADE         ; 19
	const HS_ROUTE_2_ITEM_1                ; 1A X
	const HS_ROUTE_2_ITEM_2                ; 1B X
	const HS_ROUTE_4_ITEM                  ; 1C X
	const HS_ROUTE_9_ITEM                  ; 1D X
	const HS_ROUTE_12_SNORLAX              ; 1E
	const HS_ROUTE_12_ITEM_1               ; 1F X
	const HS_ROUTE_12_ITEM_2               ; 20 X
	const HS_ROUTE_15_ITEM                 ; 21 X
	const HS_ROUTE_16_SNORLAX              ; 22
	const HS_ROUTE_22_RIVAL_1              ; 23
	const HS_ROUTE_22_RIVAL_2              ; 24
	const HS_NUGGET_BRIDGE_GUY             ; 25
	const HS_ROUTE_24_ITEM                 ; 26 X
	const HS_ROUTE_25_ITEM                 ; 27 X
	const HS_CACTUS                        ; 28 X
	const HS_BRUNSWICK_ZAPDOS_G            ; 29 X
	const HS_DAISY_SITTING                 ; 2A
	const HS_DAISY_WALKING                 ; 2B
	const HS_TOWN_MAP                      ; 2C
	const HS_OAKS_LAB_RIVAL                ; 2D
	const HS_STARTER_BALL_1                ; 2E
	const HS_STARTER_BALL_2                ; 2F
	const HS_STARTER_BALL_3                ; 30
	const HS_OAKS_LAB_OAK_1                ; 31
	const HS_STARTER_BALL_4                ; 32, was dex, pikachu
	const HS_STARTER_BALL_5                ; 33, was dex, eevee
	const HS_OAKS_LAB_OAK_2                ; 34
	const HS_VIRIDIAN_GYM_GIOVANNI         ; 35
	const HS_VIRIDIAN_GYM_ITEM             ; 36 X
	const HS_OLD_AMBER                     ; 37
	const HS_CERULEAN_CAVE_1F_ITEM_1       ; 38 X
	const HS_CERULEAN_CAVE_1F_ITEM_2       ; 39 X
	const HS_CERULEAN_CAVE_1F_ITEM_3       ; 3A X
	const HS_CELESTE_ZAPDOS_G              ; 3B
	const HS_CELESTE_ARTICUNO_G            ; 3C
	const HS_MOLTRES_G                     ; 3D X
	const HS_POKEMON_TOWER_2F_RIVAL        ; 3E
	const HS_POKEMON_TOWER_3F_ITEM         ; 3F X
	const HS_POKEMON_TOWER_4F_ITEM_1       ; 40 X
	const HS_POKEMON_TOWER_4F_ITEM_2       ; 41 X
	const HS_POKEMON_TOWER_4F_ITEM_3       ; 42 X
	const HS_POKEMON_TOWER_5F_ITEM         ; 43 X
	const HS_POKEMON_TOWER_6F_ITEM_1       ; 44 X
	const HS_POKEMON_TOWER_6F_ITEM_2       ; 45 X
	const HS_POKEMON_TOWER_7F_ROCKET_1     ; 46 X
	const HS_POKEMON_TOWER_7F_ROCKET_2     ; 47 X
	const HS_POKEMON_TOWER_7F_ROCKET_3     ; 48 X
	const HS_POKEMON_TOWER_7F_MR_FUJI      ; 49
	const HS_MR_FUJIS_HOUSE_MR_FUJI        ; 4A
	const HS_CELADON_MANSION_EEVEE_GIFT    ; 4B
	const HS_GAME_CORNER_ROCKET            ; 4C
	const HS_WARDENS_HOUSE_ITEM            ; 4D X
	const HS_POKEMON_MANSION_1F_ITEM_1     ; 4E X
	const HS_POKEMON_MANSION_1F_ITEM_2     ; 4F X
	const HS_FIGHTING_DOJO_GIFT_1          ; 50
	const HS_FIGHTING_DOJO_GIFT_2          ; 51
	const HS_SILPH_CO_1F_RECEPTIONIST      ; 52
	const HS_VOLTORB_1                     ; 53 X
	const HS_VOLTORB_2                     ; 54 X
	const HS_VOLTORB_3                     ; 55 X
	const HS_ELECTRODE_1                   ; 56 X
	const HS_VOLTORB_4                     ; 57 X
	const HS_VOLTORB_5                     ; 58 X
	const HS_ELECTRODE_2                   ; 59 X
	const HS_VOLTORB_6                     ; 5A X
	const HS_ZAPDOS                        ; 5B X
	const HS_POWER_PLANT_ITEM_1            ; 5C X
	const HS_POWER_PLANT_ITEM_2            ; 5D X
	const HS_POWER_PLANT_ITEM_3            ; 5E X
	const HS_POWER_PLANT_ITEM_4            ; 5F X
	const HS_POWER_PLANT_ITEM_5            ; 60 X
	const HS_GYAOON                        ; 61 X
	const HS_VICTORY_ROAD_2F_ITEM_1        ; 62 X
	const HS_VICTORY_ROAD_2F_ITEM_2        ; 63 X
	const HS_VICTORY_ROAD_2F_ITEM_3        ; 64 X
	const HS_VICTORY_ROAD_2F_ITEM_4        ; 65 X
	const HS_VICTORY_ROAD_2F_BOULDER       ; 66
	const HS_BILL_POKEMON                  ; 67
	const HS_BILL_1                        ; 68
	const HS_BILL_2                        ; 69
	const HS_BILLS_NIDORINO                ; 6A
	const HS_VIRIDIAN_FOREST_ITEM_1        ; 6B X
	const HS_VIRIDIAN_FOREST_ITEM_2        ; 6C X
	const HS_VIRIDIAN_FOREST_ITEM_3        ; 6D X
	const HS_MT_MOON_1F_ITEM_1             ; 6E X
	const HS_MT_MOON_1F_ITEM_2             ; 6F X
	const HS_MT_MOON_1F_ITEM_3             ; 70 X
	const HS_MT_MOON_1F_ITEM_4             ; 71 X
	const HS_MT_MOON_1F_ITEM_5             ; 72 X
	const HS_MT_MOON_1F_ITEM_6             ; 73 X
	const HS_MT_MOON_B2F_FOSSIL_1          ; 74
	const HS_MT_MOON_B2F_FOSSIL_2          ; 75
	const HS_MT_MOON_B2F_ITEM_1            ; 76 X
	const HS_MT_MOON_B2F_ITEM_2            ; 77 X
	const HS_MT_MOON_CRATER_GUARD          ; 78
	const HS_SS_ANNE_2F_RIVAL              ; 79
	const HS_SS_ANNE_1F_ROOMS_ITEM         ; 7A X
	const HS_SS_ANNE_2F_ROOMS_ITEM_1       ; 7B X
	const HS_SS_ANNE_2F_ROOMS_ITEM_2       ; 7C X
	const HS_SS_ANNE_B1F_ROOMS_ITEM_1      ; 7D X
	const HS_SS_ANNE_B1F_ROOMS_ITEM_2      ; 7E X
	const HS_SS_ANNE_B1F_ROOMS_ITEM_3      ; 7F X
	const HS_WUGTRIO                       ; 80 X 
	const HS_VICTORY_ROAD_3F_ITEM_1        ; 81 X
	const HS_VICTORY_ROAD_3F_ITEM_2        ; 82 X
	const HS_VICTORY_ROAD_3F_BOULDER       ; 83
	const HS_ROCKET_HIDEOUT_B1F_ITEM_1     ; 84 X
	const HS_ROCKET_HIDEOUT_B1F_ITEM_2     ; 85 X
	const HS_ROCKET_HIDEOUT_B2F_ITEM_1     ; 86 X
	const HS_ROCKET_HIDEOUT_B2F_ITEM_2     ; 87 X
	const HS_ROCKET_HIDEOUT_B2F_ITEM_3     ; 88 X
	const HS_ROCKET_HIDEOUT_B2F_ITEM_4     ; 89 X
	const HS_ROCKET_HIDEOUT_B3F_ITEM_1     ; 8A X
	const HS_ROCKET_HIDEOUT_B3F_ITEM_2     ; 8B X
	const HS_ROCKET_HIDEOUT_B4F_GIOVANNI   ; 8C
	const HS_ROCKET_HIDEOUT_B4F_ITEM_1     ; 8D X
	const HS_ROCKET_HIDEOUT_B4F_ITEM_2     ; 8E X
	const HS_ROCKET_HIDEOUT_B4F_ITEM_3     ; 8F X
	const HS_ROCKET_HIDEOUT_B4F_ITEM_4     ; 90
	const HS_ROCKET_HIDEOUT_B4F_ITEM_5     ; 91
	const HS_SILPH_CO_2F_1                 ; 92 XXX never (de)activated?
	const HS_SILPH_CO_2F_2                 ; 93
	const HS_SILPH_CO_3F_1                 ; 94
	const HS_SILPH_CO_3F_2                 ; 95
	const HS_SILPH_CO_3F_ITEM              ; 96 X
	const HS_SILPH_CO_4F_1                 ; 97
	const HS_SILPH_CO_4F_2                 ; 98
	const HS_SILPH_CO_4F_3                 ; 99
	const HS_SILPH_CO_4F_ITEM_1            ; 9A X
	const HS_SILPH_CO_4F_ITEM_2            ; 9B X
	const HS_SILPH_CO_4F_ITEM_3            ; 9C X
	const HS_SILPH_CO_5F_1                 ; 9D
	const HS_SILPH_CO_5F_2                 ; 9E
	const HS_SILPH_CO_5F_3                 ; 9F
	const HS_SILPH_CO_5F_4                 ; A0
	const HS_SILPH_CO_5F_ITEM_1            ; A1 X
	const HS_SILPH_CO_5F_ITEM_2            ; A2 X
	const HS_SILPH_CO_5F_ITEM_3            ; A3 X
	const HS_SILPH_CO_6F_1                 ; A4
	const HS_SILPH_CO_6F_2                 ; A5
	const HS_SILPH_CO_6F_3                 ; A6
	const HS_SILPH_CO_6F_ITEM_1            ; A7 X
	const HS_SILPH_CO_6F_ITEM_2            ; A8 X
	const HS_SILPH_CO_7F_1                 ; A9
	const HS_SILPH_CO_7F_2                 ; AA
	const HS_SILPH_CO_7F_3                 ; AB
	const HS_SILPH_CO_7F_4                 ; AC
	const HS_SILPH_CO_7F_RIVAL             ; AD
	const HS_SILPH_CO_7F_ITEM_1            ; AE X
	const HS_SILPH_CO_7F_ITEM_2            ; AF X
	const HS_SILPH_CO_7F_8                 ; B0 XXX sprite doesn't exist
	const HS_SILPH_CO_8F_1                 ; B1
	const HS_SILPH_CO_8F_2                 ; B2
	const HS_SILPH_CO_8F_3                 ; B3
	const HS_SILPH_CO_10F_1                ; B4
	const HS_SILPH_CO_10F_2                ; B5
	const HS_SILPH_CO_10F_3                ; B6 XXX never (de)activated?
	const HS_SILPH_CO_10F_ITEM_1           ; B7 X
	const HS_SILPH_CO_10F_ITEM_2           ; B8 X
	const HS_SILPH_CO_10F_ITEM_3           ; B9 X
	const HS_SILPH_CO_11F_1                ; BA
	const HS_SILPH_CO_11F_2                ; BB
	const HS_SILPH_CO_11F_3                ; BC
	const HS_OMEGA                         ; BD
	const HS_DRAGONITE                     ; BE
	const HS_MOLTRES                       ; BF 
	const HS_POKEMON_MANSION_2F_ITEM       ; C0 X
	const HS_POKEMON_MANSION_3F_ITEM_1     ; C1 X
	const HS_POKEMON_MANSION_3F_ITEM_2     ; C2 X
	const HS_POKEMON_MANSION_B1F_ITEM_1    ; C3 X
	const HS_POKEMON_MANSION_B1F_ITEM_2    ; C4 X
	const HS_POKEMON_MANSION_B1F_ITEM_3    ; C5 X
	const HS_POKEMON_MANSION_B1F_ITEM_4    ; C6 X
	const HS_POKEMON_MANSION_B1F_ITEM_5    ; C7 X
	const HS_MANSION_GUARD                 ; C8
	const HS_SAFARI_ZONE_EAST_ITEM_1       ; C9 X
	const HS_SAFARI_ZONE_EAST_ITEM_2       ; CA X
	const HS_SAFARI_ZONE_EAST_ITEM_3       ; CB X
	const HS_SAFARI_ZONE_EAST_ITEM_4       ; CC X
	const HS_SAFARI_ZONE_NORTH_ITEM_1      ; CD X
	const HS_SAFARI_ZONE_NORTH_ITEM_2      ; CE X
	const HS_SAFARI_ZONE_WEST_ITEM_1       ; CF X
	const HS_SAFARI_ZONE_WEST_ITEM_2       ; D0 X
	const HS_SAFARI_ZONE_WEST_ITEM_3       ; D1 X
	const HS_SAFARI_ZONE_WEST_ITEM_4       ; D2 X
	const HS_SAFARI_ZONE_CENTER_ITEM       ; D3 X
	const HS_CERULEAN_CAVE_2F_ITEM_1       ; D4 X
	const HS_CERULEAN_CAVE_2F_ITEM_2       ; D5 X
	const HS_CERULEAN_CAVE_2F_ITEM_3       ; D6 X
	const HS_MEWTWO                        ; D7 X
	const HS_CERULEAN_CAVE_B1F_ITEM_1      ; D8 X
	const HS_CERULEAN_CAVE_B1F_ITEM_2      ; D9 X
	const HS_VICTORY_ROAD_1F_ITEM_1        ; DA X
	const HS_VICTORY_ROAD_1F_ITEM_2        ; DB X
	const HS_CHAMPIONS_ROOM_OAK            ; DC
	const HS_SEAFOAM_ISLANDS_1F_BOULDER_1  ; DD
	const HS_SEAFOAM_ISLANDS_1F_BOULDER_2  ; DE
	const HS_SEAFOAM_ISLANDS_B1F_BOULDER_1 ; DF
	const HS_SEAFOAM_ISLANDS_B1F_BOULDER_2 ; E0
	const HS_SEAFOAM_ISLANDS_B2F_BOULDER_1 ; E1
	const HS_SEAFOAM_ISLANDS_B2F_BOULDER_2 ; E2
	const HS_SEAFOAM_ISLANDS_B3F_BOULDER_1 ; E3
	const HS_SEAFOAM_ISLANDS_B3F_BOULDER_2 ; E4
	const HS_SEAFOAM_ISLANDS_B3F_BOULDER_3 ; E5
	const HS_SEAFOAM_ISLANDS_B3F_BOULDER_4 ; E6
	const HS_SEAFOAM_ISLANDS_B4F_BOULDER_1 ; E7
	const HS_SEAFOAM_ISLANDS_B4F_BOULDER_2 ; E8
	const HS_ARTICUNO                      ; E9
	const HS_OLD_SEA_MAP                   ; EA
	const HS_MEW                           ; EB 
	const HS_POKEMON_MANSION_B2F_ITEM_1    ; EC
	const HS_POKEMON_MANSION_B2F_ITEM_2    ; ED
	const HS_ROUTE_1_OAK                   ; EE
	const HS_YUJIROU                       ; EF
	const HS_YUJIROU_REMATCH               ; F0
	const HS_MT_MOON_CRATER_ITEM_1         ; F1
	const HS_MT_MOON_CRATER_ITEM_2         ; F2
	const HS_MT_MOON_CRATER_ITEM_3         ; F3
	const HS_MT_MOON_CRATER_ITEM_4         ; F4
	const HS_MT_MOON_CRATER_ITEM_5         ; F5
	const HS_MT_MOON_CRATER_ITEM_6         ; F6
	const HS_MT_MOON_CRATER_ITEM_7         ; F7
	const HS_MT_MOON_CRATER_ITEM_8         ; F8
	const HS_MT_MOON_CRATER_ITEM_9         ; F9
	const HS_MT_MOON_CRATER_ITEM_10        ; FA
	const HS_MT_MOON_CRATER_ITEM_11        ; FB
	;const HS_GARNET_CAVERN_MOLTRES_G ; FC
DEF NUM_HS_OBJECTS EQU const_value
