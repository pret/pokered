DEF OFF EQU $11
DEF ON  EQU $15

MACRO toggle_consts_for
	DEF TOGGLEMAP{\1} EQU const_value
ENDM

; ToggleableObjects indexes (see data/maps/toggle_data.asm)
; This lists the object_events that can be toggled by ShowObject/HideObject.
; The constants marked with an X are never used, because those object_events
; are not toggled on/off in any map's script.
; (The X-ed ones are either items or static Pokemon encounters that deactivate
; after battle and are detected in wToggleableObjectList.)

	const_def

	toggle_consts_for PALLET_TOWN
	const TOGGLE_PALLET_TOWN_OAK               ; 00

	toggle_consts_for VIRIDIAN_CITY
	const TOGGLE_LYING_OLD_MAN                 ; 01
	const TOGGLE_OLD_MAN                       ; 02

	toggle_consts_for PEWTER_CITY
	const TOGGLE_MUSEUM_GUY                    ; 03
	const TOGGLE_GYM_GUY                       ; 04

	toggle_consts_for CERULEAN_CITY
	const TOGGLE_CERULEAN_RIVAL                ; 05
	const TOGGLE_CERULEAN_ROCKET               ; 06
	const TOGGLE_CERULEAN_GUARD_1              ; 07
	const TOGGLE_CERULEAN_CAVE_GUY             ; 08
	const TOGGLE_CERULEAN_GUARD_2              ; 09

	toggle_consts_for SAFFRON_CITY
	const TOGGLE_SAFFRON_CITY_1                ; 0A
	const TOGGLE_SAFFRON_CITY_2                ; 0B
	const TOGGLE_SAFFRON_CITY_3                ; 0C
	const TOGGLE_SAFFRON_CITY_4                ; 0D
	const TOGGLE_SAFFRON_CITY_5                ; 0E
	const TOGGLE_SAFFRON_CITY_6                ; 0F
	const TOGGLE_SAFFRON_CITY_7                ; 10
	const TOGGLE_SAFFRON_CITY_8                ; 11
	const TOGGLE_SAFFRON_CITY_9                ; 12
	const TOGGLE_SAFFRON_CITY_A                ; 13
	const TOGGLE_SAFFRON_CITY_B                ; 14
	const TOGGLE_SAFFRON_CITY_C                ; 15
	const TOGGLE_SAFFRON_CITY_D                ; 16
	const TOGGLE_SAFFRON_CITY_E                ; 17
	const TOGGLE_SAFFRON_CITY_F                ; 18

	toggle_consts_for ROUTE_2
	const TOGGLE_ROUTE_2_ITEM_1                ; 19 X
	const TOGGLE_ROUTE_2_ITEM_2                ; 1A X

	toggle_consts_for ROUTE_4
	const TOGGLE_ROUTE_4_ITEM                  ; 1B X

	toggle_consts_for ROUTE_9
	const TOGGLE_ROUTE_9_ITEM                  ; 1C X

	toggle_consts_for ROUTE_12
	const TOGGLE_ROUTE_12_SNORLAX              ; 1D
	const TOGGLE_ROUTE_12_ITEM_1               ; 1E X
	const TOGGLE_ROUTE_12_ITEM_2               ; 1F X

	toggle_consts_for ROUTE_15
	const TOGGLE_ROUTE_15_ITEM                 ; 20 X

	toggle_consts_for ROUTE_16
	const TOGGLE_ROUTE_16_SNORLAX              ; 21

	toggle_consts_for ROUTE_22
	const TOGGLE_ROUTE_22_RIVAL_1              ; 22
	const TOGGLE_ROUTE_22_RIVAL_2              ; 23

	toggle_consts_for ROUTE_24
	const TOGGLE_NUGGET_BRIDGE_GUY             ; 24
	const TOGGLE_ROUTE_24_ITEM                 ; 25 X

	toggle_consts_for ROUTE_25
	const TOGGLE_ROUTE_25_ITEM                 ; 26 X

	toggle_consts_for BLUES_HOUSE
	const TOGGLE_DAISY_SITTING                 ; 27
	const TOGGLE_DAISY_WALKING                 ; 28
	const TOGGLE_TOWN_MAP                      ; 29

	toggle_consts_for OAKS_LAB
	const TOGGLE_OAKS_LAB_RIVAL                ; 2A
	const TOGGLE_STARTER_BALL_1                ; 2B
	const TOGGLE_STARTER_BALL_2                ; 2C
	const TOGGLE_STARTER_BALL_3                ; 2D
	const TOGGLE_OAKS_LAB_OAK_1                ; 2E
	const TOGGLE_POKEDEX_1                     ; 2F
	const TOGGLE_POKEDEX_2                     ; 30
	const TOGGLE_OAKS_LAB_OAK_2                ; 31

	toggle_consts_for VIRIDIAN_GYM
	const TOGGLE_VIRIDIAN_GYM_GIOVANNI         ; 32
	const TOGGLE_VIRIDIAN_GYM_ITEM             ; 33 X

	toggle_consts_for MUSEUM_1F
	const TOGGLE_OLD_AMBER                     ; 34

	toggle_consts_for CERULEAN_CAVE_1F
	const TOGGLE_CERULEAN_CAVE_1F_ITEM_1       ; 35 X
	const TOGGLE_CERULEAN_CAVE_1F_ITEM_2       ; 36 X
	const TOGGLE_CERULEAN_CAVE_1F_ITEM_3       ; 37 X

	toggle_consts_for POKEMON_TOWER_2F
	const TOGGLE_POKEMON_TOWER_2F_RIVAL        ; 38

	toggle_consts_for POKEMON_TOWER_3F
	const TOGGLE_POKEMON_TOWER_3F_ITEM         ; 39 X

	toggle_consts_for POKEMON_TOWER_4F
	const TOGGLE_POKEMON_TOWER_4F_ITEM_1       ; 3A X
	const TOGGLE_POKEMON_TOWER_4F_ITEM_2       ; 3B X
	const TOGGLE_POKEMON_TOWER_4F_ITEM_3       ; 3C X

	toggle_consts_for POKEMON_TOWER_5F
	const TOGGLE_POKEMON_TOWER_5F_ITEM         ; 3D X

	toggle_consts_for POKEMON_TOWER_6F
	const TOGGLE_POKEMON_TOWER_6F_ITEM_1       ; 3E X
	const TOGGLE_POKEMON_TOWER_6F_ITEM_2       ; 3F X

	toggle_consts_for POKEMON_TOWER_7F
	const TOGGLE_POKEMON_TOWER_7F_ROCKET_1     ; 40 X
	const TOGGLE_POKEMON_TOWER_7F_ROCKET_2     ; 41 X
	const TOGGLE_POKEMON_TOWER_7F_ROCKET_3     ; 42 X
	const TOGGLE_POKEMON_TOWER_7F_MR_FUJI      ; 43

	toggle_consts_for MR_FUJIS_HOUSE
	const TOGGLE_MR_FUJIS_HOUSE_MR_FUJI        ; 44

	toggle_consts_for CELADON_MANSION_ROOF_HOUSE
	const TOGGLE_CELADON_MANSION_EEVEE_GIFT    ; 45

	toggle_consts_for GAME_CORNER
	const TOGGLE_GAME_CORNER_ROCKET            ; 46

	toggle_consts_for WARDENS_HOUSE
	const TOGGLE_WARDENS_HOUSE_ITEM            ; 47 X

	toggle_consts_for POKEMON_MANSION_1F
	const TOGGLE_POKEMON_MANSION_1F_ITEM_1     ; 48 X
	const TOGGLE_POKEMON_MANSION_1F_ITEM_2     ; 49 X

	toggle_consts_for FIGHTING_DOJO
	const TOGGLE_FIGHTING_DOJO_GIFT_1          ; 4A
	const TOGGLE_FIGHTING_DOJO_GIFT_2          ; 4B

	toggle_consts_for SILPH_CO_1F
	const TOGGLE_SILPH_CO_1F_RECEPTIONIST      ; 4C

	toggle_consts_for POWER_PLANT
	const TOGGLE_VOLTORB_1                     ; 4D X
	const TOGGLE_VOLTORB_2                     ; 4E X
	const TOGGLE_VOLTORB_3                     ; 4F X
	const TOGGLE_ELECTRODE_1                   ; 50 X
	const TOGGLE_VOLTORB_4                     ; 51 X
	const TOGGLE_VOLTORB_5                     ; 52 X
	const TOGGLE_ELECTRODE_2                   ; 53 X
	const TOGGLE_VOLTORB_6                     ; 54 X
	const TOGGLE_ZAPDOS                        ; 55 X
	const TOGGLE_POWER_PLANT_ITEM_1            ; 56 X
	const TOGGLE_POWER_PLANT_ITEM_2            ; 57 X
	const TOGGLE_POWER_PLANT_ITEM_3            ; 58 X
	const TOGGLE_POWER_PLANT_ITEM_4            ; 59 X
	const TOGGLE_POWER_PLANT_ITEM_5            ; 5A X

	toggle_consts_for VICTORY_ROAD_2F
	const TOGGLE_MOLTRES                       ; 5B X
	const TOGGLE_VICTORY_ROAD_2F_ITEM_1        ; 5C X
	const TOGGLE_VICTORY_ROAD_2F_ITEM_2        ; 5D X
	const TOGGLE_VICTORY_ROAD_2F_ITEM_3        ; 5E X
	const TOGGLE_VICTORY_ROAD_2F_ITEM_4        ; 5F X
	const TOGGLE_VICTORY_ROAD_2F_BOULDER       ; 60

	toggle_consts_for BILLS_HOUSE
	const TOGGLE_BILL_POKEMON                  ; 61
	const TOGGLE_BILL_1                        ; 62
	const TOGGLE_BILL_2                        ; 63

	toggle_consts_for VIRIDIAN_FOREST
	const TOGGLE_VIRIDIAN_FOREST_ITEM_1        ; 64 X
	const TOGGLE_VIRIDIAN_FOREST_ITEM_2        ; 65 X
	const TOGGLE_VIRIDIAN_FOREST_ITEM_3        ; 66 X

	toggle_consts_for MT_MOON_1F
	const TOGGLE_MT_MOON_1F_ITEM_1             ; 67 X
	const TOGGLE_MT_MOON_1F_ITEM_2             ; 68 X
	const TOGGLE_MT_MOON_1F_ITEM_3             ; 69 X
	const TOGGLE_MT_MOON_1F_ITEM_4             ; 6A X
	const TOGGLE_MT_MOON_1F_ITEM_5             ; 6B X
	const TOGGLE_MT_MOON_1F_ITEM_6             ; 6C X

	toggle_consts_for MT_MOON_B2F
	const TOGGLE_MT_MOON_B2F_FOSSIL_1          ; 6D
	const TOGGLE_MT_MOON_B2F_FOSSIL_2          ; 6E
	const TOGGLE_MT_MOON_B2F_ITEM_1            ; 6F X
	const TOGGLE_MT_MOON_B2F_ITEM_2            ; 70 X

	toggle_consts_for SS_ANNE_2F
	const TOGGLE_SS_ANNE_2F_RIVAL              ; 71

	toggle_consts_for SS_ANNE_1F_ROOMS
	const TOGGLE_SS_ANNE_1F_ROOMS_ITEM         ; 72 X

	toggle_consts_for SS_ANNE_2F_ROOMS
	const TOGGLE_SS_ANNE_2F_ROOMS_ITEM_1       ; 73 X
	const TOGGLE_SS_ANNE_2F_ROOMS_ITEM_2       ; 74 X

	toggle_consts_for SS_ANNE_B1F_ROOMS
	const TOGGLE_SS_ANNE_B1F_ROOMS_ITEM_1      ; 75 X
	const TOGGLE_SS_ANNE_B1F_ROOMS_ITEM_2      ; 76 X
	const TOGGLE_SS_ANNE_B1F_ROOMS_ITEM_3      ; 77 X

	toggle_consts_for VICTORY_ROAD_3F
	const TOGGLE_VICTORY_ROAD_3F_ITEM_1        ; 78 X
	const TOGGLE_VICTORY_ROAD_3F_ITEM_2        ; 79 X
	const TOGGLE_VICTORY_ROAD_3F_BOULDER       ; 7A

	toggle_consts_for ROCKET_HIDEOUT_B1F
	const TOGGLE_ROCKET_HIDEOUT_B1F_ITEM_1     ; 7B X
	const TOGGLE_ROCKET_HIDEOUT_B1F_ITEM_2     ; 7C X

	toggle_consts_for ROCKET_HIDEOUT_B2F
	const TOGGLE_ROCKET_HIDEOUT_B2F_ITEM_1     ; 7D X
	const TOGGLE_ROCKET_HIDEOUT_B2F_ITEM_2     ; 7E X
	const TOGGLE_ROCKET_HIDEOUT_B2F_ITEM_3     ; 7F X
	const TOGGLE_ROCKET_HIDEOUT_B2F_ITEM_4     ; 80 X

	toggle_consts_for ROCKET_HIDEOUT_B3F
	const TOGGLE_ROCKET_HIDEOUT_B3F_ITEM_1     ; 81 X
	const TOGGLE_ROCKET_HIDEOUT_B3F_ITEM_2     ; 82 X

	toggle_consts_for ROCKET_HIDEOUT_B4F
	const TOGGLE_ROCKET_HIDEOUT_B4F_GIOVANNI   ; 83
	const TOGGLE_ROCKET_HIDEOUT_B4F_ITEM_1     ; 84 X
	const TOGGLE_ROCKET_HIDEOUT_B4F_ITEM_2     ; 85 X
	const TOGGLE_ROCKET_HIDEOUT_B4F_ITEM_3     ; 86 X
	const TOGGLE_ROCKET_HIDEOUT_B4F_ITEM_4     ; 87
	const TOGGLE_ROCKET_HIDEOUT_B4F_ITEM_5     ; 88

	toggle_consts_for SILPH_CO_2F
	const TOGGLE_SILPH_CO_2F_1                 ; 89 XXX never (de)activated?
	const TOGGLE_SILPH_CO_2F_2                 ; 8A
	const TOGGLE_SILPH_CO_2F_3                 ; 8B
	const TOGGLE_SILPH_CO_2F_4                 ; 8C
	const TOGGLE_SILPH_CO_2F_5                 ; 8D

	toggle_consts_for SILPH_CO_3F
	const TOGGLE_SILPH_CO_3F_1                 ; 8E
	const TOGGLE_SILPH_CO_3F_2                 ; 8F
	const TOGGLE_SILPH_CO_3F_ITEM              ; 90 X

	toggle_consts_for SILPH_CO_4F
	const TOGGLE_SILPH_CO_4F_1                 ; 91
	const TOGGLE_SILPH_CO_4F_2                 ; 92
	const TOGGLE_SILPH_CO_4F_3                 ; 93
	const TOGGLE_SILPH_CO_4F_ITEM_1            ; 94 X
	const TOGGLE_SILPH_CO_4F_ITEM_2            ; 95 X
	const TOGGLE_SILPH_CO_4F_ITEM_3            ; 96 X

	toggle_consts_for SILPH_CO_5F
	const TOGGLE_SILPH_CO_5F_1                 ; 97
	const TOGGLE_SILPH_CO_5F_2                 ; 98
	const TOGGLE_SILPH_CO_5F_3                 ; 99
	const TOGGLE_SILPH_CO_5F_4                 ; 9A
	const TOGGLE_SILPH_CO_5F_ITEM_1            ; 9B X
	const TOGGLE_SILPH_CO_5F_ITEM_2            ; 9C X
	const TOGGLE_SILPH_CO_5F_ITEM_3            ; 9D X

	toggle_consts_for SILPH_CO_6F
	const TOGGLE_SILPH_CO_6F_1                 ; 9E
	const TOGGLE_SILPH_CO_6F_2                 ; 9F
	const TOGGLE_SILPH_CO_6F_3                 ; A0
	const TOGGLE_SILPH_CO_6F_ITEM_1            ; A1 X
	const TOGGLE_SILPH_CO_6F_ITEM_2            ; A2 X

	toggle_consts_for SILPH_CO_7F
	const TOGGLE_SILPH_CO_7F_1                 ; A3
	const TOGGLE_SILPH_CO_7F_2                 ; A4
	const TOGGLE_SILPH_CO_7F_3                 ; A5
	const TOGGLE_SILPH_CO_7F_4                 ; A6
	const TOGGLE_SILPH_CO_7F_RIVAL             ; A7
	const TOGGLE_SILPH_CO_7F_ITEM_1            ; A8 X
	const TOGGLE_SILPH_CO_7F_ITEM_2            ; A9 X
	const TOGGLE_SILPH_CO_7F_8                 ; AA XXX sprite doesn't exist

	toggle_consts_for SILPH_CO_8F
	const TOGGLE_SILPH_CO_8F_1                 ; AB
	const TOGGLE_SILPH_CO_8F_2                 ; AC
	const TOGGLE_SILPH_CO_8F_3                 ; AD

	toggle_consts_for SILPH_CO_9F
	const TOGGLE_SILPH_CO_9F_1                 ; AE
	const TOGGLE_SILPH_CO_9F_2                 ; AF
	const TOGGLE_SILPH_CO_9F_3                 ; B0

	toggle_consts_for SILPH_CO_10F
	const TOGGLE_SILPH_CO_10F_1                ; B1
	const TOGGLE_SILPH_CO_10F_2                ; B2
	const TOGGLE_SILPH_CO_10F_3                ; B3 XXX never (de)activated?
	const TOGGLE_SILPH_CO_10F_ITEM_1           ; B4 X
	const TOGGLE_SILPH_CO_10F_ITEM_2           ; B5 X
	const TOGGLE_SILPH_CO_10F_ITEM_3           ; B6 X

	toggle_consts_for SILPH_CO_11F
	const TOGGLE_SILPH_CO_11F_1                ; B7
	const TOGGLE_SILPH_CO_11F_2                ; B8
	const TOGGLE_SILPH_CO_11F_3                ; B9

	toggle_consts_for UNUSED_MAP_F4
	const TOGGLE_UNUSED_MAP_F4_1               ; BA XXX sprite doesn't exist

	toggle_consts_for POKEMON_MANSION_2F
	const TOGGLE_POKEMON_MANSION_2F_ITEM       ; BB X

	toggle_consts_for POKEMON_MANSION_3F
	const TOGGLE_POKEMON_MANSION_3F_ITEM_1     ; BC X
	const TOGGLE_POKEMON_MANSION_3F_ITEM_2     ; BD X

	toggle_consts_for POKEMON_MANSION_B1F
	const TOGGLE_POKEMON_MANSION_B1F_ITEM_1    ; BE X
	const TOGGLE_POKEMON_MANSION_B1F_ITEM_2    ; BF X
	const TOGGLE_POKEMON_MANSION_B1F_ITEM_3    ; C0 X
	const TOGGLE_POKEMON_MANSION_B1F_ITEM_4    ; C1 X
	const TOGGLE_POKEMON_MANSION_B1F_ITEM_5    ; C2 X

	toggle_consts_for SAFARI_ZONE_EAST
	const TOGGLE_SAFARI_ZONE_EAST_ITEM_1       ; C3 X
	const TOGGLE_SAFARI_ZONE_EAST_ITEM_2       ; C4 X
	const TOGGLE_SAFARI_ZONE_EAST_ITEM_3       ; C5 X
	const TOGGLE_SAFARI_ZONE_EAST_ITEM_4       ; C6 X

	toggle_consts_for SAFARI_ZONE_NORTH
	const TOGGLE_SAFARI_ZONE_NORTH_ITEM_1      ; C7 X
	const TOGGLE_SAFARI_ZONE_NORTH_ITEM_2      ; C8 X

	toggle_consts_for SAFARI_ZONE_WEST
	const TOGGLE_SAFARI_ZONE_WEST_ITEM_1       ; C9 X
	const TOGGLE_SAFARI_ZONE_WEST_ITEM_2       ; CA X
	const TOGGLE_SAFARI_ZONE_WEST_ITEM_3       ; CB X
	const TOGGLE_SAFARI_ZONE_WEST_ITEM_4       ; CC X

	toggle_consts_for SAFARI_ZONE_CENTER
	const TOGGLE_SAFARI_ZONE_CENTER_ITEM       ; CD X

	toggle_consts_for CERULEAN_CAVE_2F
	const TOGGLE_CERULEAN_CAVE_2F_ITEM_1       ; CE X
	const TOGGLE_CERULEAN_CAVE_2F_ITEM_2       ; CF X
	const TOGGLE_CERULEAN_CAVE_2F_ITEM_3       ; D0 X

	toggle_consts_for CERULEAN_CAVE_B1F
	const TOGGLE_MEWTWO                        ; D1 X
	const TOGGLE_CERULEAN_CAVE_B1F_ITEM_1      ; D2 X
	const TOGGLE_CERULEAN_CAVE_B1F_ITEM_2      ; D3 X

	toggle_consts_for VICTORY_ROAD_1F
	const TOGGLE_VICTORY_ROAD_1F_ITEM_1        ; D4 X
	const TOGGLE_VICTORY_ROAD_1F_ITEM_2        ; D5 X

	toggle_consts_for CHAMPIONS_ROOM
	const TOGGLE_CHAMPIONS_ROOM_OAK            ; D6

	toggle_consts_for SEAFOAM_ISLANDS_1F
	const TOGGLE_SEAFOAM_ISLANDS_1F_BOULDER_1  ; D7
	const TOGGLE_SEAFOAM_ISLANDS_1F_BOULDER_2  ; D8

	toggle_consts_for SEAFOAM_ISLANDS_B1F
	const TOGGLE_SEAFOAM_ISLANDS_B1F_BOULDER_1 ; D9
	const TOGGLE_SEAFOAM_ISLANDS_B1F_BOULDER_2 ; DA

	toggle_consts_for SEAFOAM_ISLANDS_B2F
	const TOGGLE_SEAFOAM_ISLANDS_B2F_BOULDER_1 ; DB
	const TOGGLE_SEAFOAM_ISLANDS_B2F_BOULDER_2 ; DC

	toggle_consts_for SEAFOAM_ISLANDS_B3F
	const TOGGLE_SEAFOAM_ISLANDS_B3F_BOULDER_1 ; DD
	const TOGGLE_SEAFOAM_ISLANDS_B3F_BOULDER_2 ; DE
	const TOGGLE_SEAFOAM_ISLANDS_B3F_BOULDER_3 ; DF
	const TOGGLE_SEAFOAM_ISLANDS_B3F_BOULDER_4 ; E0

	toggle_consts_for SEAFOAM_ISLANDS_B4F
	const TOGGLE_SEAFOAM_ISLANDS_B4F_BOULDER_1 ; E1
	const TOGGLE_SEAFOAM_ISLANDS_B4F_BOULDER_2 ; E2
	const TOGGLE_ARTICUNO                      ; E3 X

DEF NUM_TOGGLEABLE_OBJECTS EQU const_value
