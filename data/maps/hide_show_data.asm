; default hidden/shown objects for each map

MapHSPointers:
; entries correspond to map ids
	table_width 2, MapHSPointers
	dw PalletTownHS
	dw ViridianCityHS
	dw PewterCityHS
	dw CeruleanCityHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw SaffronCityHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw Route1HS
	dw Route2HS
	dw NoHS
	dw Route4HS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw Route9HS
	dw NoHS
	dw NoHS
	dw Route12HS
	dw NoHS
	dw NoHS
	dw Route15HS
	dw Route16HS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw Route22HS
	dw NoHS
	dw Route24HS
	dw Route25HS
	dw BrunswickTrailHS
	dw NoHS
	dw NoHS
	dw BluesHouseHS
	dw OaksLabHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw ViridianGymHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw ViridianForestHS
	dw Museum1FHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw MtMoon1FHS
	dw NoHS
	dw MtMoonB2FHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw ViridianPreGymHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw CelesteHillHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw PowerPlantHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw BillsHouseHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw VermilionDockHS
	dw NoHS
	dw SSAnne2FHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw SSAnne1FRoomsHS
	dw SSAnne2FRoomsHS
	dw SSAnneB1FRoomsHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw VictoryRoad1FHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw FarawayIslandInsideHS
	dw PokemonMansionB2FHS
	dw MtMoonCraterHS
	dw NoHS
	dw NoHS
	dw ChampionsRoomHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw CeladonMansionRoofHouseHS
	dw NoHS
	dw NoHS
	dw GameCornerHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw PokemonTower2FHS
	dw PokemonTower3FHS
	dw PokemonTower4FHS
	dw PokemonTower5FHS
	dw PokemonTower6FHS
	dw PokemonTower7FHS
	dw MrFujisHouseHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw WardensHouseHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw SeafoamIslandsB1FHS
	dw SeafoamIslandsB2FHS
	dw SeafoamIslandsB3FHS
	dw SeafoamIslandsB4FHS
	dw NoHS
	dw NoHS
	dw PokemonMansion1FHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw FightingDojoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw SilphCo1FHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw SeafoamIslands1FHS
	dw NoHS
	dw VictoryRoad2FHS
	dw NoHS
	dw NoHS
	dw DiglettsCaveHS
	dw VictoryRoad3FHS
	dw RocketHideoutB1FHS
	dw RocketHideoutB2FHS
	dw RocketHideoutB3FHS
	dw RocketHideoutB4FHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw SilphCo2FHS
	dw SilphCo3FHS
	dw SilphCo4FHS
	dw SilphCo5FHS
	dw SilphCo6FHS
	dw SilphCo7FHS
	dw SilphCo8FHS
	dw PokemonMansion2FHS
	dw PokemonMansion3FHS
	dw PokemonMansionB1FHS
	dw SafariZoneEastHS
	dw SafariZoneNorthHS
	dw SafariZoneWestHS
	dw SafariZoneCenterHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw CeruleanCave2FHS
	dw CeruleanCaveB1FHS
	dw CeruleanCaveHS
	dw NoHS
	dw NoHS
	dw CinnabarVolcanoHS
	dw NoHS
	dw NoHS
	dw SilphCo10FHS
	dw SilphCo11FHS
	dw NoHS
	dw GarnetCavernB2FHS
	dw UnderwaterTunnelHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	assert_table_length NUM_MAPS
	dw -1 ; end

NoHS:
	db $FF, $FF, $FF

MissableObjects:
; entries correspond to HS_* constants (see constants/hide_show_constants)
	table_width 3, MissableObjects
; format: map id, object id, HIDE/SHOW

PalletTownHS:
	db PALLET_TOWN, $01, HIDE                 ; HS_PALLET_TOWN_OAK
ViridianCityHS:
	db VIRIDIAN_CITY, $05, SHOW               ; HS_LYING_OLD_MAN 
	db VIRIDIAN_CITY, $07, HIDE               ; HS_OLD_MAN 
PewterCityHS:
	db PEWTER_CITY, $03, SHOW                 ; HS_MUSEUM_GUY
	db PEWTER_CITY, $05, SHOW                 ; HS_GYM_GUY
CeruleanCityHS:
	db CERULEAN_CITY, $01, HIDE               ; HS_CERULEAN_RIVAL
	db CERULEAN_CITY, $02, SHOW               ; HS_CERULEAN_ROCKET
	db CERULEAN_CITY, $06, HIDE               ; HS_CERULEAN_GUARD_1
	db CERULEAN_CITY, $0A, SHOW               ; HS_CERULEAN_CAVE_GUY
	db CERULEAN_CITY, $0B, SHOW               ; HS_CERULEAN_GUARD_2
SaffronCityHS:
	db SAFFRON_CITY, $01, SHOW                ; HS_SAFFRON_CITY_1
	db SAFFRON_CITY, $02, SHOW                ; HS_SAFFRON_CITY_2
	db SAFFRON_CITY, $03, SHOW                ; HS_SAFFRON_CITY_3
	db SAFFRON_CITY, $04, SHOW                ; HS_SAFFRON_CITY_4
	db SAFFRON_CITY, $05, SHOW                ; HS_SAFFRON_CITY_5
	db SAFFRON_CITY, $06, SHOW                ; HS_SAFFRON_CITY_6
	db SAFFRON_CITY, $07, SHOW                ; HS_SAFFRON_CITY_7
	db SAFFRON_CITY, $08, HIDE                ; HS_SAFFRON_CITY_8
	db SAFFRON_CITY, $09, HIDE                ; HS_SAFFRON_CITY_9
	db SAFFRON_CITY, $0A, HIDE                ; HS_SAFFRON_CITY_A
	db SAFFRON_CITY, $0B, HIDE                ; HS_SAFFRON_CITY_B
	db SAFFRON_CITY, $0C, HIDE                ; HS_SAFFRON_CITY_C
	db SAFFRON_CITY, $0D, HIDE                ; HS_SAFFRON_CITY_D
	db SAFFRON_CITY, $0E, SHOW                ; HS_SAFFRON_CITY_E
	db SAFFRON_CITY, $0F, HIDE                ; HS_SAFFRON_CITY_F
	db SAFFRON_CITY, $1A, HIDE                ; HS_SAFFRON_CITY_UP_GRADE
Route2HS:
	db ROUTE_2, $01, SHOW                     ; HS_ROUTE_2_ITEM_1
	db ROUTE_2, $02, SHOW                     ; HS_ROUTE_2_ITEM_2
Route4HS:
	db ROUTE_4, $03, SHOW                     ; HS_ROUTE_4_ITEM
Route9HS:
	db ROUTE_9, $0A, SHOW                     ; HS_ROUTE_9_ITEM
Route12HS:
	db ROUTE_12, $01, SHOW                    ; HS_ROUTE_12_SNORLAX
	db ROUTE_12, $09, SHOW                    ; HS_ROUTE_12_ITEM_1
	db ROUTE_12, $0A, SHOW                    ; HS_ROUTE_12_ITEM_2
Route15HS:
	db ROUTE_15, $0B, SHOW                    ; HS_ROUTE_15_ITEM
Route16HS:
	db ROUTE_16, $07, SHOW                    ; HS_ROUTE_16_SNORLAX
Route22HS:
	db ROUTE_22, $01, HIDE                    ; HS_ROUTE_22_RIVAL_1
	db ROUTE_22, $02, HIDE                    ; HS_ROUTE_22_RIVAL_2
Route24HS:
	db ROUTE_24, $01, SHOW                    ; HS_NUGGET_BRIDGE_GUY
	db ROUTE_24, $08, SHOW                    ; HS_ROUTE_24_ITEM
Route25HS:
	db ROUTE_25, $0A, SHOW                    ; HS_ROUTE_25_ITEM
BrunswickTrailHS:
	db BRUNSWICK_TRAIL, $01, SHOW             ; HS_CACTUS
	db BRUNSWICK_TRAIL, $03, SHOW             ; HS_BRUNSWICK_ZAPDOS_G
BluesHouseHS:
	db BLUES_HOUSE, $01, SHOW                 ; HS_DAISY_SITTING
	db BLUES_HOUSE, $02, HIDE                 ; HS_DAISY_WALKING
	db BLUES_HOUSE, $03, SHOW                 ; HS_TOWN_MAP
OaksLabHS:
	db OAKS_LAB, $01, SHOW                    ; HS_OAKS_LAB_RIVAL
	db OAKS_LAB, $02, SHOW                    ; HS_STARTER_BALL_1
	db OAKS_LAB, $03, SHOW                    ; HS_STARTER_BALL_2
	db OAKS_LAB, $04, SHOW                    ; HS_STARTER_BALL_3
	db OAKS_LAB, $05, SHOW                    ; HS_OAKS_LAB_OAK_1
	db OAKS_LAB, $07, SHOW                    ; HS_STARTER_BALL_4
	db OAKS_LAB, $08, SHOW                    ; HS_STARTER_BALL_5
	db OAKS_LAB, $06, HIDE                    ; HS_OAKS_LAB_OAK_2
ViridianGymHS:
	db VIRIDIAN_GYM, $01, SHOW                ; HS_VIRIDIAN_GYM_GIOVANNI
	db VIRIDIAN_GYM, $0B, SHOW                ; HS_VIRIDIAN_GYM_ITEM
Museum1FHS:
	db MUSEUM_1F, $05, SHOW                   ; HS_OLD_AMBER
CeruleanCaveHS:
	db CERULEAN_CAVE_1F, $01, SHOW            ; HS_CERULEAN_CAVE_1F_ITEM_1
	db CERULEAN_CAVE_1F, $02, SHOW            ; HS_CERULEAN_CAVE_1F_ITEM_2
	db CERULEAN_CAVE_1F, $03, SHOW            ; HS_CERULEAN_CAVE_1F_ITEM_3
CelesteHillHS:
	db CELESTE_HILL, $01, SHOW                ; HS_CELESTE_ZAPDOS_G
	db CELESTE_HILL, $02, SHOW                ; HS_CELESTE_ARTICUNO_G
	db CELESTE_HILL, $03, SHOW                ; HS_MOLTRES_G
PokemonTower2FHS:
	db POKEMON_TOWER_2F, $01, SHOW            ; HS_POKEMON_TOWER_2F_RIVAL
PokemonTower3FHS:
	db POKEMON_TOWER_3F, $04, SHOW            ; HS_POKEMON_TOWER_3F_ITEM
PokemonTower4FHS:
	db POKEMON_TOWER_4F, $04, SHOW            ; HS_POKEMON_TOWER_4F_ITEM_1
	db POKEMON_TOWER_4F, $05, SHOW            ; HS_POKEMON_TOWER_4F_ITEM_2
	db POKEMON_TOWER_4F, $06, SHOW            ; HS_POKEMON_TOWER_4F_ITEM_3
PokemonTower5FHS:
	db POKEMON_TOWER_5F, $06, SHOW            ; HS_POKEMON_TOWER_5F_ITEM
PokemonTower6FHS:
	db POKEMON_TOWER_6F, $04, SHOW            ; HS_POKEMON_TOWER_6F_ITEM_1
	db POKEMON_TOWER_6F, $05, SHOW            ; HS_POKEMON_TOWER_6F_ITEM_2
PokemonTower7FHS:
	db POKEMON_TOWER_7F, $01, SHOW            ; HS_POKEMON_TOWER_7F_ROCKET_1
	db POKEMON_TOWER_7F, $02, SHOW            ; HS_POKEMON_TOWER_7F_ROCKET_2
	db POKEMON_TOWER_7F, $03, SHOW            ; HS_POKEMON_TOWER_7F_ROCKET_3
	db POKEMON_TOWER_7F, $04, SHOW            ; HS_POKEMON_TOWER_7F_MR_FUJI
MrFujisHouseHS:
	db MR_FUJIS_HOUSE, $05, HIDE              ; HS_MR_FUJIS_HOUSE_MR_FUJI
CeladonMansionRoofHouseHS:
	db CELADON_MANSION_ROOF_HOUSE, $02, SHOW  ; HS_CELADON_MANSION_EEVEE_GIFT
GameCornerHS:
	db GAME_CORNER, $0B, SHOW                 ; HS_GAME_CORNER_ROCKET
WardensHouseHS:
	db WARDENS_HOUSE, $02, SHOW               ; HS_WARDENS_HOUSE_ITEM
PokemonMansion1FHS:
	db POKEMON_MANSION_1F, $02, SHOW          ; HS_POKEMON_MANSION_1F_ITEM_1
	db POKEMON_MANSION_1F, $03, SHOW          ; HS_POKEMON_MANSION_1F_ITEM_2
FightingDojoHS:
	db FIGHTING_DOJO, $06, SHOW               ; HS_FIGHTING_DOJO_GIFT_1
	db FIGHTING_DOJO, $07, SHOW               ; HS_FIGHTING_DOJO_GIFT_2
SilphCo1FHS:
	db SILPH_CO_1F, $01, HIDE                 ; HS_SILPH_CO_1F_RECEPTIONIST
PowerPlantHS:
	db POWER_PLANT, $01, SHOW                 ; HS_VOLTORB_1
	db POWER_PLANT, $02, SHOW                 ; HS_VOLTORB_2
	db POWER_PLANT, $03, SHOW                 ; HS_VOLTORB_3
	db POWER_PLANT, $04, SHOW                 ; HS_ELECTRODE_1
	db POWER_PLANT, $05, SHOW                 ; HS_VOLTORB_4
	db POWER_PLANT, $06, SHOW                 ; HS_VOLTORB_5
	db POWER_PLANT, $07, SHOW                 ; HS_ELECTRODE_2
	db POWER_PLANT, $08, SHOW                 ; HS_VOLTORB_6
	db POWER_PLANT, $09, SHOW                 ; HS_ZAPDOS
	db POWER_PLANT, $0A, SHOW                 ; HS_POWER_PLANT_ITEM_1
	db POWER_PLANT, $0B, SHOW                 ; HS_POWER_PLANT_ITEM_2
	db POWER_PLANT, $0C, SHOW                 ; HS_POWER_PLANT_ITEM_3
	db POWER_PLANT, $0D, SHOW                 ; HS_POWER_PLANT_ITEM_4
	db POWER_PLANT, $0E, SHOW                 ; HS_POWER_PLANT_ITEM_5
VictoryRoad2FHS:
	db VICTORY_ROAD_2F, $06, SHOW             ; HS_GYAOON
	db VICTORY_ROAD_2F, $07, SHOW             ; HS_VICTORY_ROAD_2F_ITEM_1
	db VICTORY_ROAD_2F, $08, SHOW             ; HS_VICTORY_ROAD_2F_ITEM_2
	db VICTORY_ROAD_2F, $09, SHOW             ; HS_VICTORY_ROAD_2F_ITEM_3
	db VICTORY_ROAD_2F, $0A, SHOW             ; HS_VICTORY_ROAD_2F_ITEM_4
	db VICTORY_ROAD_2F, $0D, SHOW             ; HS_VICTORY_ROAD_2F_BOULDER
BillsHouseHS:
	db BILLS_HOUSE, $01, SHOW                 ; HS_BILL_POKEMON
	db BILLS_HOUSE, $02, HIDE                 ; HS_BILL_1
	db BILLS_HOUSE, $03, HIDE                 ; HS_BILL_2
	db BILLS_HOUSE, $04, SHOW                 ; HS_BILLS_NIDORINO
ViridianForestHS:
	db VIRIDIAN_FOREST, $05, SHOW             ; HS_VIRIDIAN_FOREST_ITEM_1
	db VIRIDIAN_FOREST, $06, SHOW             ; HS_VIRIDIAN_FOREST_ITEM_2
	db VIRIDIAN_FOREST, $07, SHOW             ; HS_VIRIDIAN_FOREST_ITEM_3
MtMoon1FHS:
	db MT_MOON_1F, $08, SHOW                  ; HS_MT_MOON_1F_ITEM_1
	db MT_MOON_1F, $09, SHOW                  ; HS_MT_MOON_1F_ITEM_2
	db MT_MOON_1F, $0A, SHOW                  ; HS_MT_MOON_1F_ITEM_3
	db MT_MOON_1F, $0B, SHOW                  ; HS_MT_MOON_1F_ITEM_4
	db MT_MOON_1F, $0C, SHOW                  ; HS_MT_MOON_1F_ITEM_5
	db MT_MOON_1F, $0D, SHOW                  ; HS_MT_MOON_1F_ITEM_6
MtMoonB2FHS:
	db MT_MOON_B2F, $06, SHOW                 ; HS_MT_MOON_B2F_FOSSIL_1
	db MT_MOON_B2F, $07, SHOW                 ; HS_MT_MOON_B2F_FOSSIL_2
	db MT_MOON_B2F, $08, SHOW                 ; HS_MT_MOON_B2F_ITEM_1
	db MT_MOON_B2F, $09, SHOW                 ; HS_MT_MOON_B2F_ITEM_2
	db MT_MOON_B2F, $0A, HIDE                 ; HS_MT_MOON_CRATER_GUARD
SSAnne2FHS:
	db SS_ANNE_2F, $02, HIDE                  ; HS_SS_ANNE_2F_RIVAL
SSAnne1FRoomsHS:
	db SS_ANNE_1F_ROOMS, $0A, SHOW            ; HS_SS_ANNE_1F_ROOMS_ITEM
SSAnne2FRoomsHS:
	db SS_ANNE_2F_ROOMS, $06, SHOW            ; HS_SS_ANNE_2F_ROOMS_ITEM_1
	db SS_ANNE_2F_ROOMS, $09, SHOW            ; HS_SS_ANNE_2F_ROOMS_ITEM_2
SSAnneB1FRoomsHS:
	db SS_ANNE_B1F_ROOMS, $09, SHOW           ; HS_SS_ANNE_B1F_ROOMS_ITEM_1
	db SS_ANNE_B1F_ROOMS, $0A, SHOW           ; HS_SS_ANNE_B1F_ROOMS_ITEM_2
	db SS_ANNE_B1F_ROOMS, $0B, SHOW           ; HS_SS_ANNE_B1F_ROOMS_ITEM_3
DiglettsCaveHS:
	db DIGLETTS_CAVE, $01, SHOW               ; HS_WUGTRIO
VictoryRoad3FHS:
	db VICTORY_ROAD_3F, $05, SHOW             ; HS_VICTORY_ROAD_3F_ITEM_1
	db VICTORY_ROAD_3F, $06, SHOW             ; HS_VICTORY_ROAD_3F_ITEM_2
	db VICTORY_ROAD_3F, $0A, SHOW             ; HS_VICTORY_ROAD_3F_BOULDER
RocketHideoutB1FHS:
	db ROCKET_HIDEOUT_B1F, $05, SHOW          ; HS_ROCKET_HIDEOUT_B1F_ITEM_1
	db ROCKET_HIDEOUT_B1F, $06, SHOW          ; HS_ROCKET_HIDEOUT_B1F_ITEM_2
RocketHideoutB2FHS:
	db ROCKET_HIDEOUT_B2F, $02, SHOW          ; HS_ROCKET_HIDEOUT_B2F_ITEM_1
	db ROCKET_HIDEOUT_B2F, $03, SHOW          ; HS_ROCKET_HIDEOUT_B2F_ITEM_2
	db ROCKET_HIDEOUT_B2F, $04, SHOW          ; HS_ROCKET_HIDEOUT_B2F_ITEM_3
	db ROCKET_HIDEOUT_B2F, $05, SHOW          ; HS_ROCKET_HIDEOUT_B2F_ITEM_4
RocketHideoutB3FHS:
	db ROCKET_HIDEOUT_B3F, $03, SHOW          ; HS_ROCKET_HIDEOUT_B3F_ITEM_1
	db ROCKET_HIDEOUT_B3F, $04, SHOW          ; HS_ROCKET_HIDEOUT_B3F_ITEM_2
RocketHideoutB4FHS:
	db ROCKET_HIDEOUT_B4F, $01, SHOW          ; HS_ROCKET_HIDEOUT_B4F_GIOVANNI
	db ROCKET_HIDEOUT_B4F, $05, SHOW          ; HS_ROCKET_HIDEOUT_B4F_ITEM_1
	db ROCKET_HIDEOUT_B4F, $06, SHOW          ; HS_ROCKET_HIDEOUT_B4F_ITEM_2
	db ROCKET_HIDEOUT_B4F, $07, SHOW          ; HS_ROCKET_HIDEOUT_B4F_ITEM_3
	db ROCKET_HIDEOUT_B4F, $08, HIDE          ; HS_ROCKET_HIDEOUT_B4F_ITEM_4
	db ROCKET_HIDEOUT_B4F, $09, HIDE          ; HS_ROCKET_HIDEOUT_B4F_ITEM_5
SilphCo2FHS:
	db SILPH_CO_2F, $01, SHOW                 ; HS_SILPH_CO_2F_1
	db SILPH_CO_2F, $02, SHOW                 ; HS_SILPH_CO_2F_2
SilphCo3FHS:
	db SILPH_CO_3F, $02, SHOW                 ; HS_SILPH_CO_3F_1
	db SILPH_CO_3F, $03, SHOW                 ; HS_SILPH_CO_3F_2
	db SILPH_CO_3F, $04, SHOW                 ; HS_SILPH_CO_3F_ITEM
SilphCo4FHS:
	db SILPH_CO_4F, $02, SHOW                 ; HS_SILPH_CO_4F_1
	db SILPH_CO_4F, $03, SHOW                 ; HS_SILPH_CO_4F_2
	db SILPH_CO_4F, $04, SHOW                 ; HS_SILPH_CO_4F_3
	db SILPH_CO_4F, $05, SHOW                 ; HS_SILPH_CO_4F_ITEM_1
	db SILPH_CO_4F, $06, SHOW                 ; HS_SILPH_CO_4F_ITEM_2
	db SILPH_CO_4F, $07, SHOW                 ; HS_SILPH_CO_4F_ITEM_3
SilphCo5FHS:
	db SILPH_CO_5F, $02, SHOW                 ; HS_SILPH_CO_5F_1
	db SILPH_CO_5F, $03, SHOW                 ; HS_SILPH_CO_5F_2
	db SILPH_CO_5F, $04, SHOW                 ; HS_SILPH_CO_5F_3
	db SILPH_CO_5F, $05, SHOW                 ; HS_SILPH_CO_5F_4
	db SILPH_CO_5F, $06, SHOW                 ; HS_SILPH_CO_5F_ITEM_1
	db SILPH_CO_5F, $07, SHOW                 ; HS_SILPH_CO_5F_ITEM_2
	db SILPH_CO_5F, $08, SHOW                 ; HS_SILPH_CO_5F_ITEM_3
SilphCo6FHS:
	db SILPH_CO_6F, $06, SHOW                 ; HS_SILPH_CO_6F_1
	db SILPH_CO_6F, $07, SHOW                 ; HS_SILPH_CO_6F_2
	db SILPH_CO_6F, $08, SHOW                 ; HS_SILPH_CO_6F_3
	db SILPH_CO_6F, $09, SHOW                 ; HS_SILPH_CO_6F_ITEM_1
	db SILPH_CO_6F, $0A, SHOW                 ; HS_SILPH_CO_6F_ITEM_2
SilphCo7FHS:
	db SILPH_CO_7F, $05, SHOW                 ; HS_SILPH_CO_7F_1
	db SILPH_CO_7F, $06, SHOW                 ; HS_SILPH_CO_7F_2
	db SILPH_CO_7F, $07, SHOW                 ; HS_SILPH_CO_7F_3
	db SILPH_CO_7F, $08, SHOW                 ; HS_SILPH_CO_7F_4
	db SILPH_CO_7F, $09, SHOW                 ; HS_SILPH_CO_7F_RIVAL
	db SILPH_CO_7F, $0A, SHOW                 ; HS_SILPH_CO_7F_ITEM_1
	db SILPH_CO_7F, $0B, SHOW                 ; HS_SILPH_CO_7F_ITEM_2
	db SILPH_CO_7F, $0C, SHOW                 ; HS_SILPH_CO_7F_8
SilphCo8FHS:
	db SILPH_CO_8F, $02, SHOW                 ; HS_SILPH_CO_8F_1
	db SILPH_CO_8F, $03, SHOW                 ; HS_SILPH_CO_8F_2
	db SILPH_CO_8F, $04, SHOW                 ; HS_SILPH_CO_8F_3
SilphCo10FHS:
	db SILPH_CO_10F, $01, SHOW                ; HS_SILPH_CO_10F_1
	db SILPH_CO_10F, $02, SHOW                ; HS_SILPH_CO_10F_2
	db SILPH_CO_10F, $03, SHOW                ; HS_SILPH_CO_10F_3
	db SILPH_CO_10F, $04, SHOW                ; HS_SILPH_CO_10F_ITEM_1
	db SILPH_CO_10F, $05, SHOW                ; HS_SILPH_CO_10F_ITEM_2
	db SILPH_CO_10F, $06, SHOW                ; HS_SILPH_CO_10F_ITEM_3
SilphCo11FHS:
	db SILPH_CO_11F, $03, SHOW                ; HS_SILPH_CO_11F_1
	db SILPH_CO_11F, $04, SHOW                ; HS_SILPH_CO_11F_2
	db SILPH_CO_11F, $05, SHOW                ; HS_SILPH_CO_11F_3
	db SILPH_CO_11F, $06, SHOW                ; HS_OMEGA
UnderwaterTunnelHS:
	db UNDERWATER_TUNNEL, $01, SHOW           ; HS_DRAGONITE
CinnabarVolcanoHS:
	db CINNABAR_VOLCANO, $01, SHOW            ; HS_MOLTRES
PokemonMansion2FHS:
	db POKEMON_MANSION_2F, $02, SHOW          ; HS_POKEMON_MANSION_2F_ITEM
PokemonMansion3FHS:
	db POKEMON_MANSION_3F, $03, SHOW          ; HS_POKEMON_MANSION_3F_ITEM_1
	db POKEMON_MANSION_3F, $04, SHOW          ; HS_POKEMON_MANSION_3F_ITEM_2
PokemonMansionB1FHS:
	db POKEMON_MANSION_B1F, $03, SHOW         ; HS_POKEMON_MANSION_B1F_ITEM_1
	db POKEMON_MANSION_B1F, $04, SHOW         ; HS_POKEMON_MANSION_B1F_ITEM_2
	db POKEMON_MANSION_B1F, $05, SHOW         ; HS_POKEMON_MANSION_B1F_ITEM_3
	db POKEMON_MANSION_B1F, $06, SHOW         ; HS_POKEMON_MANSION_B1F_ITEM_4
	db POKEMON_MANSION_B1F, $08, SHOW         ; HS_POKEMON_MANSION_B1F_ITEM_5
	db POKEMON_MANSION_B1F, $09, SHOW         ; HS_MANSION_GUARD
SafariZoneEastHS:
	db SAFARI_ZONE_EAST, $01, SHOW            ; HS_SAFARI_ZONE_EAST_ITEM_1
	db SAFARI_ZONE_EAST, $02, SHOW            ; HS_SAFARI_ZONE_EAST_ITEM_2
	db SAFARI_ZONE_EAST, $03, SHOW            ; HS_SAFARI_ZONE_EAST_ITEM_3
	db SAFARI_ZONE_EAST, $04, SHOW            ; HS_SAFARI_ZONE_EAST_ITEM_4
SafariZoneNorthHS:
	db SAFARI_ZONE_NORTH, $01, SHOW           ; HS_SAFARI_ZONE_NORTH_ITEM_1
	db SAFARI_ZONE_NORTH, $02, SHOW           ; HS_SAFARI_ZONE_NORTH_ITEM_2
SafariZoneWestHS:
	db SAFARI_ZONE_WEST, $01, SHOW            ; HS_SAFARI_ZONE_WEST_ITEM_1
	db SAFARI_ZONE_WEST, $02, SHOW            ; HS_SAFARI_ZONE_WEST_ITEM_2
	db SAFARI_ZONE_WEST, $03, SHOW            ; HS_SAFARI_ZONE_WEST_ITEM_3
	db SAFARI_ZONE_WEST, $04, SHOW            ; HS_SAFARI_ZONE_WEST_ITEM_4
SafariZoneCenterHS:
	db SAFARI_ZONE_CENTER, $01, SHOW          ; HS_SAFARI_ZONE_CENTER_ITEM
CeruleanCave2FHS:
	db CERULEAN_CAVE_2F, $01, SHOW            ; HS_CERULEAN_CAVE_2F_ITEM_1
	db CERULEAN_CAVE_2F, $02, SHOW            ; HS_CERULEAN_CAVE_2F_ITEM_2
	db CERULEAN_CAVE_2F, $03, SHOW            ; HS_CERULEAN_CAVE_2F_ITEM_3
CeruleanCaveB1FHS:
	db CERULEAN_CAVE_B1F, $01, SHOW           ; HS_MEWTWO
	db CERULEAN_CAVE_B1F, $02, SHOW           ; HS_CERULEAN_CAVE_B1F_ITEM_1
	db CERULEAN_CAVE_B1F, $03, SHOW           ; HS_CERULEAN_CAVE_B1F_ITEM_2
VictoryRoad1FHS:
	db VICTORY_ROAD_1F, $03, SHOW             ; HS_VICTORY_ROAD_1F_ITEM_1
	db VICTORY_ROAD_1F, $04, SHOW             ; HS_VICTORY_ROAD_1F_ITEM_2
ChampionsRoomHS:
	db CHAMPIONS_ROOM, $02, HIDE              ; HS_CHAMPIONS_ROOM_OAK
SeafoamIslands1FHS:
	db SEAFOAM_ISLANDS_1F, $01, SHOW          ; HS_SEAFOAM_ISLANDS_1F_BOULDER_1
	db SEAFOAM_ISLANDS_1F, $02, SHOW          ; HS_SEAFOAM_ISLANDS_1F_BOULDER_2
SeafoamIslandsB1FHS:
	db SEAFOAM_ISLANDS_B1F, $01, HIDE         ; HS_SEAFOAM_ISLANDS_B1F_BOULDER_1
	db SEAFOAM_ISLANDS_B1F, $02, HIDE         ; HS_SEAFOAM_ISLANDS_B1F_BOULDER_2
SeafoamIslandsB2FHS:
	db SEAFOAM_ISLANDS_B2F, $01, HIDE         ; HS_SEAFOAM_ISLANDS_B2F_BOULDER_1
	db SEAFOAM_ISLANDS_B2F, $02, HIDE         ; HS_SEAFOAM_ISLANDS_B2F_BOULDER_2
SeafoamIslandsB3FHS:
	db SEAFOAM_ISLANDS_B3F, $02, SHOW         ; HS_SEAFOAM_ISLANDS_B3F_BOULDER_1
	db SEAFOAM_ISLANDS_B3F, $03, SHOW         ; HS_SEAFOAM_ISLANDS_B3F_BOULDER_2
	db SEAFOAM_ISLANDS_B3F, $05, HIDE         ; HS_SEAFOAM_ISLANDS_B3F_BOULDER_3
	db SEAFOAM_ISLANDS_B3F, $06, HIDE         ; HS_SEAFOAM_ISLANDS_B3F_BOULDER_4
SeafoamIslandsB4FHS:
	db SEAFOAM_ISLANDS_B4F, $01, HIDE         ; HS_SEAFOAM_ISLANDS_B4F_BOULDER_1
	db SEAFOAM_ISLANDS_B4F, $02, HIDE         ; HS_SEAFOAM_ISLANDS_B4F_BOULDER_2
	db SEAFOAM_ISLANDS_B4F, $03, SHOW         ; HS_ARTICUNO
VermilionDockHS:
	db VERMILION_DOCK, $01, SHOW              ; HS_OLD_SEA_MAP
FarawayIslandInsideHS:
	db FARAWAY_ISLAND_INSIDE, $01, SHOW       ; HS_MEW
PokemonMansionB2FHS:
	db POKEMON_MANSION_B2F, $03, SHOW         ; HS_POKEMON_MANSION_B2F_ITEM_1
	db POKEMON_MANSION_B2F, $04, SHOW         ; HS_POKEMON_MANSION_B2F_ITEM_2
Route1HS:
	db ROUTE_1, $03, HIDE                     ; HS_ROUTE_1_OAK
ViridianPreGymHS:
	db VIRIDIAN_PRE_GYM, $01, SHOW            ; HS_YUJIROU
	db VIRIDIAN_PRE_GYM, $02, HIDE            ; HS_YUJIROU_REMATCH
MtMoonCraterHS:
	db MT_MOON_CRATER, $01, SHOW              ; HS_MT_MOON_CRATER_ITEM_1
	db MT_MOON_CRATER, $02, SHOW              ; HS_MT_MOON_CRATER_ITEM_2
	db MT_MOON_CRATER, $03, SHOW              ; HS_MT_MOON_CRATER_ITEM_3
	db MT_MOON_CRATER, $04, SHOW              ; HS_MT_MOON_CRATER_ITEM_4
	db MT_MOON_CRATER, $05, SHOW              ; HS_MT_MOON_CRATER_ITEM_5
	db MT_MOON_CRATER, $06, SHOW              ; HS_MT_MOON_CRATER_ITEM_6
	db MT_MOON_CRATER, $07, SHOW              ; HS_MT_MOON_CRATER_ITEM_7
	db MT_MOON_CRATER, $08, SHOW              ; HS_MT_MOON_CRATER_ITEM_8
	db MT_MOON_CRATER, $09, SHOW              ; HS_MT_MOON_CRATER_ITEM_9
	db MT_MOON_CRATER, $0A, SHOW              ; HS_MT_MOON_CRATER_ITEM_10
	db MT_MOON_CRATER, $0B, SHOW              ; HS_MT_MOON_CRATER_ITEM_11

GarnetCavernB2FHS:
	; db GARNET_CAVE_B2F, $01, HIDE ; Moltres

	db $FF, $01, SHOW ; end

	assert_table_length NUM_HS_OBJECTS + 1
