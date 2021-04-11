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
	dw NoHS
	dw SaffronCityHS
	dw NoHS
	dw NoHS
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
	dw NoHS
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
	dw NoHS
	dw NoHS
	dw NoHS
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
	dw NoHS
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
	dw NoHS
	dw NoHS
	dw SilphCo9FHS
	dw SilphCo10FHS
	dw SilphCo11FHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw NoHS
	dw UnusedMapF4HS
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
	db PALLET_TOWN, $01, HIDE
ViridianCityHS:
	db VIRIDIAN_CITY, $05, SHOW
	db VIRIDIAN_CITY, $07, HIDE
PewterCityHS:
	db PEWTER_CITY, $03, SHOW
	db PEWTER_CITY, $05, SHOW
CeruleanCityHS:
	db CERULEAN_CITY, $01, HIDE
	db CERULEAN_CITY, $02, SHOW
	db CERULEAN_CITY, $06, HIDE
	db CERULEAN_CITY, $0A, SHOW
	db CERULEAN_CITY, $0B, SHOW
SaffronCityHS:
	db SAFFRON_CITY, $01, SHOW
	db SAFFRON_CITY, $02, SHOW
	db SAFFRON_CITY, $03, SHOW
	db SAFFRON_CITY, $04, SHOW
	db SAFFRON_CITY, $05, SHOW
	db SAFFRON_CITY, $06, SHOW
	db SAFFRON_CITY, $07, SHOW
	db SAFFRON_CITY, $08, HIDE
	db SAFFRON_CITY, $09, HIDE
	db SAFFRON_CITY, $0A, HIDE
	db SAFFRON_CITY, $0B, HIDE
	db SAFFRON_CITY, $0C, HIDE
	db SAFFRON_CITY, $0D, HIDE
	db SAFFRON_CITY, $0E, SHOW
	db SAFFRON_CITY, $0F, HIDE
Route2HS:
	db ROUTE_2, $01, SHOW
	db ROUTE_2, $02, SHOW
Route4HS:
	db ROUTE_4, $03, SHOW
Route9HS:
	db ROUTE_9, $0A, SHOW
Route12HS:
	db ROUTE_12, $01, SHOW
	db ROUTE_12, $09, SHOW
	db ROUTE_12, $0A, SHOW
Route15HS:
	db ROUTE_15, $0B, SHOW
Route16HS:
	db ROUTE_16, $07, SHOW
Route22HS:
	db ROUTE_22, $01, HIDE
	db ROUTE_22, $02, HIDE
Route24HS:
	db ROUTE_24, $01, SHOW
	db ROUTE_24, $08, SHOW
Route25HS:
	db ROUTE_25, $0A, SHOW
BluesHouseHS:
	db BLUES_HOUSE, $01, SHOW
	db BLUES_HOUSE, $02, HIDE
	db BLUES_HOUSE, $03, SHOW
OaksLabHS:
	db OAKS_LAB, $01, SHOW
	db OAKS_LAB, $02, SHOW
	db OAKS_LAB, $03, SHOW
	db OAKS_LAB, $04, SHOW
	db OAKS_LAB, $05, HIDE
	db OAKS_LAB, $06, SHOW
	db OAKS_LAB, $07, SHOW
	db OAKS_LAB, $08, HIDE
ViridianGymHS:
	db VIRIDIAN_GYM, $01, SHOW
	db VIRIDIAN_GYM, $0B, SHOW
Museum1FHS:
	db MUSEUM_1F, $05, SHOW
CeruleanCaveHS:
	db CERULEAN_CAVE_1F, $01, SHOW
	db CERULEAN_CAVE_1F, $02, SHOW
	db CERULEAN_CAVE_1F, $03, SHOW
PokemonTower2FHS:
	db POKEMON_TOWER_2F, $01, SHOW
PokemonTower3FHS:
	db POKEMON_TOWER_3F, $04, SHOW
PokemonTower4FHS:
	db POKEMON_TOWER_4F, $04, SHOW
	db POKEMON_TOWER_4F, $05, SHOW
	db POKEMON_TOWER_4F, $06, SHOW
PokemonTower5FHS:
	db POKEMON_TOWER_5F, $06, SHOW
PokemonTower6FHS:
	db POKEMON_TOWER_6F, $04, SHOW
	db POKEMON_TOWER_6F, $05, SHOW
PokemonTower7FHS:
	db POKEMON_TOWER_7F, $01, SHOW
	db POKEMON_TOWER_7F, $02, SHOW
	db POKEMON_TOWER_7F, $03, SHOW
	db POKEMON_TOWER_7F, $04, SHOW
MrFujisHouseHS:
	db MR_FUJIS_HOUSE, $05, HIDE
CeladonMansionRoofHouseHS:
	db CELADON_MANSION_ROOF_HOUSE, $02, SHOW
GameCornerHS:
	db GAME_CORNER, $0B, SHOW
WardensHouseHS:
	db WARDENS_HOUSE, $02, SHOW
PokemonMansion1FHS:
	db POKEMON_MANSION_1F, $02, SHOW
	db POKEMON_MANSION_1F, $03, SHOW
FightingDojoHS:
	db FIGHTING_DOJO, $06, SHOW
	db FIGHTING_DOJO, $07, SHOW
SilphCo1FHS:
	db SILPH_CO_1F, $01, HIDE
PowerPlantHS:
	db POWER_PLANT, $01, SHOW
	db POWER_PLANT, $02, SHOW
	db POWER_PLANT, $03, SHOW
	db POWER_PLANT, $04, SHOW
	db POWER_PLANT, $05, SHOW
	db POWER_PLANT, $06, SHOW
	db POWER_PLANT, $07, SHOW
	db POWER_PLANT, $08, SHOW
	db POWER_PLANT, $09, SHOW
	db POWER_PLANT, $0A, SHOW
	db POWER_PLANT, $0B, SHOW
	db POWER_PLANT, $0C, SHOW
	db POWER_PLANT, $0D, SHOW
	db POWER_PLANT, $0E, SHOW
VictoryRoad2FHS:
	db VICTORY_ROAD_2F, $06, SHOW
	db VICTORY_ROAD_2F, $07, SHOW
	db VICTORY_ROAD_2F, $08, SHOW
	db VICTORY_ROAD_2F, $09, SHOW
	db VICTORY_ROAD_2F, $0A, SHOW
	db VICTORY_ROAD_2F, $0D, SHOW
BillsHouseHS:
	db BILLS_HOUSE, $01, SHOW
	db BILLS_HOUSE, $02, HIDE
	db BILLS_HOUSE, $03, HIDE
ViridianForestHS:
	db VIRIDIAN_FOREST, $05, SHOW
	db VIRIDIAN_FOREST, $06, SHOW
	db VIRIDIAN_FOREST, $07, SHOW
MtMoon1FHS:
	db MT_MOON_1F, $08, SHOW
	db MT_MOON_1F, $09, SHOW
	db MT_MOON_1F, $0A, SHOW
	db MT_MOON_1F, $0B, SHOW
	db MT_MOON_1F, $0C, SHOW
	db MT_MOON_1F, $0D, SHOW
MtMoonB2FHS:
	db MT_MOON_B2F, $06, SHOW
	db MT_MOON_B2F, $07, SHOW
	db MT_MOON_B2F, $08, SHOW
	db MT_MOON_B2F, $09, SHOW
SSAnne2FHS:
	db SS_ANNE_2F, $02, HIDE
SSAnne1FRoomsHS:
	db SS_ANNE_1F_ROOMS, $0A, SHOW
SSAnne2FRoomsHS:
	db SS_ANNE_2F_ROOMS, $06, SHOW
	db SS_ANNE_2F_ROOMS, $09, SHOW
SSAnneB1FRoomsHS:
	db SS_ANNE_B1F_ROOMS, $09, SHOW
	db SS_ANNE_B1F_ROOMS, $0A, SHOW
	db SS_ANNE_B1F_ROOMS, $0B, SHOW
VictoryRoad3FHS:
	db VICTORY_ROAD_3F, $05, SHOW
	db VICTORY_ROAD_3F, $06, SHOW
	db VICTORY_ROAD_3F, $0A, SHOW
RocketHideoutB1FHS:
	db ROCKET_HIDEOUT_B1F, $06, SHOW
	db ROCKET_HIDEOUT_B1F, $07, SHOW
RocketHideoutB2FHS:
	db ROCKET_HIDEOUT_B2F, $02, SHOW
	db ROCKET_HIDEOUT_B2F, $03, SHOW
	db ROCKET_HIDEOUT_B2F, $04, SHOW
	db ROCKET_HIDEOUT_B2F, $05, SHOW
RocketHideoutB3FHS:
	db ROCKET_HIDEOUT_B3F, $03, SHOW
	db ROCKET_HIDEOUT_B3F, $04, SHOW
RocketHideoutB4FHS:
	db ROCKET_HIDEOUT_B4F, $01, SHOW
	db ROCKET_HIDEOUT_B4F, $05, SHOW
	db ROCKET_HIDEOUT_B4F, $06, SHOW
	db ROCKET_HIDEOUT_B4F, $07, SHOW
	db ROCKET_HIDEOUT_B4F, $08, HIDE
	db ROCKET_HIDEOUT_B4F, $09, HIDE
SilphCo2FHS:
	db SILPH_CO_2F, $01, SHOW
	db SILPH_CO_2F, $02, SHOW
	db SILPH_CO_2F, $03, SHOW
	db SILPH_CO_2F, $04, SHOW
	db SILPH_CO_2F, $05, SHOW
SilphCo3FHS:
	db SILPH_CO_3F, $02, SHOW
	db SILPH_CO_3F, $03, SHOW
	db SILPH_CO_3F, $04, SHOW
SilphCo4FHS:
	db SILPH_CO_4F, $02, SHOW
	db SILPH_CO_4F, $03, SHOW
	db SILPH_CO_4F, $04, SHOW
	db SILPH_CO_4F, $05, SHOW
	db SILPH_CO_4F, $06, SHOW
	db SILPH_CO_4F, $07, SHOW
SilphCo5FHS:
	db SILPH_CO_5F, $02, SHOW
	db SILPH_CO_5F, $03, SHOW
	db SILPH_CO_5F, $04, SHOW
	db SILPH_CO_5F, $05, SHOW
	db SILPH_CO_5F, $06, SHOW
	db SILPH_CO_5F, $07, SHOW
	db SILPH_CO_5F, $08, SHOW
SilphCo6FHS:
	db SILPH_CO_6F, $06, SHOW
	db SILPH_CO_6F, $07, SHOW
	db SILPH_CO_6F, $08, SHOW
	db SILPH_CO_6F, $09, SHOW
	db SILPH_CO_6F, $0A, SHOW
SilphCo7FHS:
	db SILPH_CO_7F, $05, SHOW
	db SILPH_CO_7F, $06, SHOW
	db SILPH_CO_7F, $07, SHOW
	db SILPH_CO_7F, $08, SHOW
	db SILPH_CO_7F, $09, SHOW
	db SILPH_CO_7F, $0A, SHOW
	db SILPH_CO_7F, $0B, SHOW
	db SILPH_CO_7F, $0C, SHOW
SilphCo8FHS:
	db SILPH_CO_8F, $02, SHOW
	db SILPH_CO_8F, $03, SHOW
	db SILPH_CO_8F, $04, SHOW
SilphCo9FHS:
	db SILPH_CO_9F, $02, SHOW
	db SILPH_CO_9F, $03, SHOW
	db SILPH_CO_9F, $04, SHOW
SilphCo10FHS:
	db SILPH_CO_10F, $01, SHOW
	db SILPH_CO_10F, $02, SHOW
	db SILPH_CO_10F, $03, SHOW
	db SILPH_CO_10F, $04, SHOW
	db SILPH_CO_10F, $05, SHOW
	db SILPH_CO_10F, $06, SHOW
SilphCo11FHS:
	db SILPH_CO_11F, $03, SHOW
	db SILPH_CO_11F, $04, SHOW
	db SILPH_CO_11F, $05, SHOW
UnusedMapF4HS:
	db UNUSED_MAP_F4, $02, SHOW
PokemonMansion2FHS:
	db POKEMON_MANSION_2F, $02, SHOW
PokemonMansion3FHS:
	db POKEMON_MANSION_3F, $03, SHOW
	db POKEMON_MANSION_3F, $04, SHOW
PokemonMansionB1FHS:
	db POKEMON_MANSION_B1F, $03, SHOW
	db POKEMON_MANSION_B1F, $04, SHOW
	db POKEMON_MANSION_B1F, $05, SHOW
	db POKEMON_MANSION_B1F, $06, SHOW
	db POKEMON_MANSION_B1F, $08, SHOW
SafariZoneEastHS:
	db SAFARI_ZONE_EAST, $01, SHOW
	db SAFARI_ZONE_EAST, $02, SHOW
	db SAFARI_ZONE_EAST, $03, SHOW
	db SAFARI_ZONE_EAST, $04, SHOW
SafariZoneNorthHS:
	db SAFARI_ZONE_NORTH, $01, SHOW
	db SAFARI_ZONE_NORTH, $02, SHOW
SafariZoneWestHS:
	db SAFARI_ZONE_WEST, $01, SHOW
	db SAFARI_ZONE_WEST, $02, SHOW
	db SAFARI_ZONE_WEST, $03, SHOW
	db SAFARI_ZONE_WEST, $04, SHOW
SafariZoneCenterHS:
	db SAFARI_ZONE_CENTER, $01, SHOW
CeruleanCave2FHS:
	db CERULEAN_CAVE_2F, $01, SHOW
	db CERULEAN_CAVE_2F, $02, SHOW
	db CERULEAN_CAVE_2F, $03, SHOW
CeruleanCaveB1FHS:
	db CERULEAN_CAVE_B1F, $01, SHOW
	db CERULEAN_CAVE_B1F, $02, SHOW
	db CERULEAN_CAVE_B1F, $03, SHOW
VictoryRoad1FHS:
	db VICTORY_ROAD_1F, $03, SHOW
	db VICTORY_ROAD_1F, $04, SHOW
ChampionsRoomHS:
	db CHAMPIONS_ROOM, $02, HIDE
SeafoamIslands1FHS:
	db SEAFOAM_ISLANDS_1F, $01, SHOW
	db SEAFOAM_ISLANDS_1F, $02, SHOW
SeafoamIslandsB1FHS:
	db SEAFOAM_ISLANDS_B1F, $01, HIDE
	db SEAFOAM_ISLANDS_B1F, $02, HIDE
SeafoamIslandsB2FHS:
	db SEAFOAM_ISLANDS_B2F, $01, HIDE
	db SEAFOAM_ISLANDS_B2F, $02, HIDE
SeafoamIslandsB3FHS:
	db SEAFOAM_ISLANDS_B3F, $02, SHOW
	db SEAFOAM_ISLANDS_B3F, $03, SHOW
	db SEAFOAM_ISLANDS_B3F, $05, HIDE
	db SEAFOAM_ISLANDS_B3F, $06, HIDE
SeafoamIslandsB4FHS:
	db SEAFOAM_ISLANDS_B4F, $01, HIDE
	db SEAFOAM_ISLANDS_B4F, $02, HIDE
	db SEAFOAM_ISLANDS_B4F, $03, SHOW
	db $FF, $01, SHOW ; end
	assert_table_length NUM_HS_OBJECTS + 1
