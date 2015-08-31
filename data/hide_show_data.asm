; data for default hidden/shown
; objects for each map ($00-$F8)

; Table of 2-Byte pointers, one pointer per map,
; goes up to Map_F7, ends with $FFFF.
; points to table listing all missable object in the area
MapHSPointers: ; c8f5 (3:48f5)
	dw MapHS00
	dw MapHS01
	dw MapHS02
	dw MapHS03
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHS0A
	dw MapHSXX
	dw MapHSXX
	dw MapHS0D
	dw MapHSXX
	dw MapHS0F
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHS14
	dw MapHSXX
	dw MapHSXX
	dw MapHS17
	dw MapHSXX
	dw MapHSXX
	dw MapHS1A
	dw MapHS1B
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHS21
	dw MapHSXX
	dw MapHS23
	dw MapHS24
	dw MapHSXX
	dw MapHSXX
	dw MapHS27
	dw MapHS28
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHS2D
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHS33
	dw MapHS34
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHS3B
	dw MapHSXX
	dw MapHS3D
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHS53
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHS58
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHS60
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHS66
	dw MapHS67
	dw MapHS68
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHS6C
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHS78
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHS84
	dw MapHSXX
	dw MapHSXX
	dw MapHS87
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHS8F
	dw MapHS90
	dw MapHS91
	dw MapHS92
	dw MapHS93
	dw MapHS94
	dw MapHS95
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHS9B
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHS9F
	dw MapHSA0
	dw MapHSA1
	dw MapHSA2
	dw MapHSXX
	dw MapHSXX
	dw MapHSA5
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSB1
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSB5
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSC0
	dw MapHSXX
	dw MapHSC2
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSC6
	dw MapHSC7
	dw MapHSC8
	dw MapHSC9
	dw MapHSCA
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSCF
	dw MapHSD0
	dw MapHSD1
	dw MapHSD2
	dw MapHSD3
	dw MapHSD4
	dw MapHSD5
	dw MapHSD6
	dw MapHSD7
	dw MapHSD8
	dw MapHSD9
	dw MapHSDA
	dw MapHSDB
	dw MapHSDC
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSE2
	dw MapHSE3
	dw MapHSE4
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSE9
	dw MapHSEA
	dw MapHSEB
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSF4
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw $FFFF

; Structure:
; 3 bytes per object
; [Map_ID][Object_ID][H/S]
;
; Program stops reading when either:
; a) Map_ID = $FF
; b) Map_ID ≠ currentMapID
;
; This Data is loaded into RAM at wd5ce-$D5F?. (wMissableObjectList)

; These constants come from the bytes for Predef functions:
Hide	equ $11
Show	equ $15

MapHSXX: ; cae7 (3:4ae7)
	db $FF,$FF,$FF
MapHS00: ; caea (3:4aea)
	db PALLET_TOWN,$01,Hide
MapHS01: ; caed (3:4aed)
	db VIRIDIAN_CITY,$05,Show
	db VIRIDIAN_CITY,$07,Hide
MapHS02: ; caf3 (3:4af3)
	db PEWTER_CITY,$03,Show
	db PEWTER_CITY,$05,Show
MapHS03: ; caf9 (3:4af9)
	db CERULEAN_CITY,$01,Hide
	db CERULEAN_CITY,$02,Show
	db CERULEAN_CITY,$06,Hide
	db CERULEAN_CITY,$0A,Show
	db CERULEAN_CITY,$0B,Show
MapHS0A: ; cb08 (3:4b08)
	db SAFFRON_CITY,$01,Show
	db SAFFRON_CITY,$02,Show
	db SAFFRON_CITY,$03,Show
	db SAFFRON_CITY,$04,Show
	db SAFFRON_CITY,$05,Show
	db SAFFRON_CITY,$06,Show
	db SAFFRON_CITY,$07,Show
	db SAFFRON_CITY,$08,Hide
	db SAFFRON_CITY,$09,Hide
	db SAFFRON_CITY,$0A,Hide
	db SAFFRON_CITY,$0B,Hide
	db SAFFRON_CITY,$0C,Hide
	db SAFFRON_CITY,$0D,Hide
	db SAFFRON_CITY,$0E,Show
	db SAFFRON_CITY,$0F,Hide
MapHS0D: ; cb35 (3:4b35)
	db ROUTE_2,$01,Show
	db ROUTE_2,$02,Show
MapHS0F: ; cb3b (3:4b3b)
	db ROUTE_4,$03,Show
MapHS14: ; cb3e (3:4b3e)
	db ROUTE_9,$0A,Show
MapHS17: ; cb41 (3:4b41)
	db ROUTE_12,$01,Show
	db ROUTE_12,$09,Show
	db ROUTE_12,$0A,Show
MapHS1A: ; cb4a (3:4b4a)
	db ROUTE_15,$0B,Show
MapHS1B: ; cb4d (3:4b4d)
	db ROUTE_16,$07,Show
MapHS21: ; cb50 (3:4b50)
	db ROUTE_22,$01,Hide
	db ROUTE_22,$02,Hide
MapHS23: ; cb56 (3:4b56)
	db ROUTE_24,$01,Show
	db ROUTE_24,$08,Show
MapHS24: ; cb5c (3:4b5c)
	db ROUTE_25,$0A,Show
MapHS27: ; cb5f (3:4b5f)
	db BLUES_HOUSE,$01,Show
	db BLUES_HOUSE,$02,Hide
	db BLUES_HOUSE,$03,Show
MapHS28: ; cb68 (3:4b68)
	db OAKS_LAB,$01,Show
	db OAKS_LAB,$02,Show
	db OAKS_LAB,$03,Show
	db OAKS_LAB,$04,Show
	db OAKS_LAB,$05,Hide
	db OAKS_LAB,$06,Show
	db OAKS_LAB,$07,Show
	db OAKS_LAB,$08,Hide
MapHS2D: ; cb80 (3:4b80)
	db VIRIDIAN_GYM,$01,Show
	db VIRIDIAN_GYM,$0B,Show
MapHS34: ; cb86 (3:4b86)
	db MUSEUM_1F,$05,Show
MapHSE4: ; cb89 (3:4b89)
	db UNKNOWN_DUNGEON_1,$01,Show
	db UNKNOWN_DUNGEON_1,$02,Show
	db UNKNOWN_DUNGEON_1,$03,Show
MapHS8F: ; cb92 (3:4b92)
	db POKEMONTOWER_2,$01,Show
MapHS90: ; cb95 (3:4b95)
	db POKEMONTOWER_3,$04,Show
MapHS91: ; cb98 (3:4b98)
	db POKEMONTOWER_4,$04,Show
	db POKEMONTOWER_4,$05,Show
	db POKEMONTOWER_4,$06,Show
MapHS92: ; cba1 (3:4ba1)
	db POKEMONTOWER_5,$06,Show
MapHS93: ; cba4 (3:4ba4)
	db POKEMONTOWER_6,$04,Show
	db POKEMONTOWER_6,$05,Show
MapHS94: ; cbaa (3:4baa)
	db POKEMONTOWER_7,$01,Show
	db POKEMONTOWER_7,$02,Show
	db POKEMONTOWER_7,$03,Show
	db POKEMONTOWER_7,$04,Show
MapHS95: ; cbb6 (3:4bb6)
	db LAVENDER_HOUSE_1,$05,Hide
MapHS84: ; cbb9 (3:4bb9)
	db CELADON_MANSION_5,$02,Show
MapHS87: ; cbbc (3:4bbc)
	db GAME_CORNER,$0B,Show
MapHS9B: ; cbbf (3:4bbf)
	db FUCHSIA_HOUSE_2,$02,Show
MapHSA5: ; cbc2 (3:4bc2)
	db MANSION_1,$02,Show
	db MANSION_1,$03,Show
MapHSB1: ; cbc8 (3:4bc8)
	db FIGHTING_DOJO,$06,Show
	db FIGHTING_DOJO,$07,Show
MapHSB5: ; cbce (3:4bce)
	db SILPH_CO_1F,$01,Hide
MapHS53: ; cbd1 (3:4bd1)
	db POWER_PLANT,$01,Show
	db POWER_PLANT,$02,Show
	db POWER_PLANT,$03,Show
	db POWER_PLANT,$04,Show
	db POWER_PLANT,$05,Show
	db POWER_PLANT,$06,Show
	db POWER_PLANT,$07,Show
	db POWER_PLANT,$08,Show
	db POWER_PLANT,$09,Show
	db POWER_PLANT,$0A,Show
	db POWER_PLANT,$0B,Show
	db POWER_PLANT,$0C,Show
	db POWER_PLANT,$0D,Show
	db POWER_PLANT,$0E,Show
MapHSC2: ; cbfb (3:4bfb)
	db VICTORY_ROAD_2,$06,Show
	db VICTORY_ROAD_2,$07,Show
	db VICTORY_ROAD_2,$08,Show
	db VICTORY_ROAD_2,$09,Show
	db VICTORY_ROAD_2,$0A,Show
	db VICTORY_ROAD_2,$0D,Show
MapHS58: ; cc0d (3:4c0d)
	db BILLS_HOUSE,$01,Show
	db BILLS_HOUSE,$02,Hide
	db BILLS_HOUSE,$03,Hide
MapHS33: ; cc16 (3:4c16)
	db VIRIDIAN_FOREST,$05,Show
	db VIRIDIAN_FOREST,$06,Show
	db VIRIDIAN_FOREST,$07,Show
MapHS3B: ; cc1f (3:4c1f)
	db MT_MOON_1,$08,Show
	db MT_MOON_1,$09,Show
	db MT_MOON_1,$0A,Show
	db MT_MOON_1,$0B,Show
	db MT_MOON_1,$0C,Show
	db MT_MOON_1,$0D,Show
MapHS3D: ; cc31 (3:4c31)
	db MT_MOON_3,$06,Show
	db MT_MOON_3,$07,Show
	db MT_MOON_3,$08,Show
	db MT_MOON_3,$09,Show
MapHS60: ; cc3d (3:4c3d)
	db SS_ANNE_2,$02,Hide
MapHS66: ; cc40 (3:4c40)
	db SS_ANNE_8,$0A,Show
MapHS67: ; cc43 (3:4c43)
	db SS_ANNE_9,$06,Show
	db SS_ANNE_9,$09,Show
MapHS68: ; cc49 (3:4c49)
	db SS_ANNE_10,$09,Show
	db SS_ANNE_10,$0A,Show
	db SS_ANNE_10,$0B,Show
MapHSC6: ; cc52 (3:4c52)
	db VICTORY_ROAD_3,$05,Show
	db VICTORY_ROAD_3,$06,Show
	db VICTORY_ROAD_3,$0A,Show
MapHSC7: ; cc5b (3:4c5b)
	db ROCKET_HIDEOUT_1,$06,Show
	db ROCKET_HIDEOUT_1,$07,Show
MapHSC8: ; cc61 (3:4c61)
	db ROCKET_HIDEOUT_2,$02,Show
	db ROCKET_HIDEOUT_2,$03,Show
	db ROCKET_HIDEOUT_2,$04,Show
	db ROCKET_HIDEOUT_2,$05,Show
MapHSC9: ; cc6d (3:4c6d)
	db ROCKET_HIDEOUT_3,$03,Show
	db ROCKET_HIDEOUT_3,$04,Show
MapHSCA: ; cc73 (3:4c73)
	db ROCKET_HIDEOUT_4,$01,Show
	db ROCKET_HIDEOUT_4,$05,Show
	db ROCKET_HIDEOUT_4,$06,Show
	db ROCKET_HIDEOUT_4,$07,Show
	db ROCKET_HIDEOUT_4,$08,Hide
	db ROCKET_HIDEOUT_4,$09,Hide
MapHSCF: ; cc85 (3:4c85)
	db SILPH_CO_2F,$01,Show
	db SILPH_CO_2F,$02,Show
	db SILPH_CO_2F,$03,Show
	db SILPH_CO_2F,$04,Show
	db SILPH_CO_2F,$05,Show
MapHSD0: ; cc94 (3:4c94)
	db SILPH_CO_3F,$02,Show
	db SILPH_CO_3F,$03,Show
	db SILPH_CO_3F,$04,Show
MapHSD1: ; cc9d (3:4c9d)
	db SILPH_CO_4F,$02,Show
	db SILPH_CO_4F,$03,Show
	db SILPH_CO_4F,$04,Show
	db SILPH_CO_4F,$05,Show
	db SILPH_CO_4F,$06,Show
	db SILPH_CO_4F,$07,Show
MapHSD2: ; ccaf (3:4caf)
	db SILPH_CO_5F,$02,Show
	db SILPH_CO_5F,$03,Show
	db SILPH_CO_5F,$04,Show
	db SILPH_CO_5F,$05,Show
	db SILPH_CO_5F,$06,Show
	db SILPH_CO_5F,$07,Show
	db SILPH_CO_5F,$08,Show
MapHSD3: ; ccc4 (3:4cc4)
	db SILPH_CO_6F,$06,Show
	db SILPH_CO_6F,$07,Show
	db SILPH_CO_6F,$08,Show
	db SILPH_CO_6F,$09,Show
	db SILPH_CO_6F,$0A,Show
MapHSD4: ; ccd3 (3:4cd3)
	db SILPH_CO_7F,$05,Show
	db SILPH_CO_7F,$06,Show
	db SILPH_CO_7F,$07,Show
	db SILPH_CO_7F,$08,Show
	db SILPH_CO_7F,$09,Show
	db SILPH_CO_7F,$0A,Show
	db SILPH_CO_7F,$0B,Show
	db SILPH_CO_7F,$0C,Show
MapHSD5: ; cceb (3:4ceb)
	db SILPH_CO_8F,$02,Show
	db SILPH_CO_8F,$03,Show
	db SILPH_CO_8F,$04,Show
MapHSE9: ; ccf4 (3:4cf4)
	db SILPH_CO_9F,$02,Show
	db SILPH_CO_9F,$03,Show
	db SILPH_CO_9F,$04,Show
MapHSEA: ; ccfd (3:4cfd)
	db SILPH_CO_10F,$01,Show
	db SILPH_CO_10F,$02,Show
	db SILPH_CO_10F,$03,Show
	db SILPH_CO_10F,$04,Show
	db SILPH_CO_10F,$05,Show
	db SILPH_CO_10F,$06,Show
MapHSEB: ; cd0f (3:4d0f)
	db SILPH_CO_11F,$03,Show
	db SILPH_CO_11F,$04,Show
	db SILPH_CO_11F,$05,Show
MapHSF4: ; cd18 (3:4d18)
	db $F4,$02,Show
MapHSD6: ; cd1b (3:4d1b)
	db MANSION_2,$02,Show
MapHSD7: ; cd1e (3:4d1e)
	db MANSION_3,$03,Show
	db MANSION_3,$04,Show
MapHSD8: ; cd24 (3:4d24)
	db MANSION_4,$03,Show
	db MANSION_4,$04,Show
	db MANSION_4,$05,Show
	db MANSION_4,$06,Show
	db MANSION_4,$08,Show
MapHSD9: ; cd33 (3:4d33)
	db SAFARI_ZONE_EAST,$01,Show
	db SAFARI_ZONE_EAST,$02,Show
	db SAFARI_ZONE_EAST,$03,Show
	db SAFARI_ZONE_EAST,$04,Show
MapHSDA: ; cd3f (3:4d3f)
	db SAFARI_ZONE_NORTH,$01,Show
	db SAFARI_ZONE_NORTH,$02,Show
MapHSDB: ; cd45 (3:4d45)
	db SAFARI_ZONE_WEST,$01,Show
	db SAFARI_ZONE_WEST,$02,Show
	db SAFARI_ZONE_WEST,$03,Show
	db SAFARI_ZONE_WEST,$04,Show
MapHSDC: ; cd51 (3:4d51)
	db SAFARI_ZONE_CENTER,$01,Show
MapHSE2: ; cd54 (3:4d54)
	db UNKNOWN_DUNGEON_2,$01,Show
	db UNKNOWN_DUNGEON_2,$02,Show
	db UNKNOWN_DUNGEON_2,$03,Show
MapHSE3: ; cd5d (3:4d5d)
	db UNKNOWN_DUNGEON_3,$01,Show
	db UNKNOWN_DUNGEON_3,$02,Show
	db UNKNOWN_DUNGEON_3,$03,Show
MapHS6C: ; cd66 (3:4d66)
	db VICTORY_ROAD_1,$03,Show
	db VICTORY_ROAD_1,$04,Show
MapHS78: ; cd6c (3:4d6c)
	db CHAMPIONS_ROOM,$02,Hide
MapHSC0: ; cd6f (3:4d6f)
	db SEAFOAM_ISLANDS_1,$01,Show
	db SEAFOAM_ISLANDS_1,$02,Show
MapHS9F: ; cd75 (3:4d75)
	db SEAFOAM_ISLANDS_2,$01,Hide
	db SEAFOAM_ISLANDS_2,$02,Hide
MapHSA0: ; cd7b (3:4d7b)
	db SEAFOAM_ISLANDS_3,$01,Hide
	db SEAFOAM_ISLANDS_3,$02,Hide
MapHSA1: ; cd81 (3:4d81)
	db SEAFOAM_ISLANDS_4,$02,Show
	db SEAFOAM_ISLANDS_4,$03,Show
	db SEAFOAM_ISLANDS_4,$05,Hide
	db SEAFOAM_ISLANDS_4,$06,Hide
MapHSA2: ; cd8d (3:4d8d)
	db SEAFOAM_ISLANDS_5,$01,Hide
	db SEAFOAM_ISLANDS_5,$02,Hide
	db SEAFOAM_ISLANDS_5,$03,Show

	db $FF,$01,Show
