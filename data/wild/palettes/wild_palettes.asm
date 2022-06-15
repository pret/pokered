; the below pointers are 24 bits in length and each bit indicates which palette a pokemon will be for that wild data
; bit = 1 -> alt palette
; bit = 0 -> default palette
; first 10 bits: grass pokemon wild data slots
; second 10 bits: water pokemon wild data slots
; last 4 bits: super rod wild data slots (this assumes you don't put more than 4 pokemon in super rod encounters)
WildPalettePointers:
	table_width 2, WildPalettePointers
	dw DefaultPalettes         ; PALLET_TOWN
	dw SurfGrassAltPalettes         ; VIRIDIAN_CITY
	dw DefaultPalettes         ; PEWTER_CITY
	dw DefaultPalettes         ; CERULEAN_CITY
	dw DefaultPalettes         ; LAVENDER_TOWN
	dw VermilionCityWildPalettes         ; VERMILION_CITY
	dw AllAltPalettes          ; CELADON_CITY
	dw DefaultPalettes         ; SAFFRON_CITY
	dw FuchsiaCityWildPalettes         ; FUCHSIA_CITY
	dw SeaRoutesWildPalettes   ; CINNABAR_ISLAND
	dw DefaultPalettes         ; INDIGO_PLATEAU
	dw DefaultPalettes         ; unused
	dw DefaultPalettes         ; ROUTE_1
	dw DefaultPalettes         ; ROUTE_2
	dw DefaultPalettes         ; ROUTE_3
	dw DefaultPalettes         ; ROUTE_4
	dw Route5WildPalettes         ; ROUTE_5
	dw Route6WildPalettes         ; ROUTE_6
	dw Route7WildPalettes         ; ROUTE_7
	dw DefaultPalettes         ; ROUTE_8
	dw DefaultPalettes         ; ROUTE_9
	dw Route10WildPalettes         ; ROUTE_10
	dw Route11WildPalettes         ; ROUTE_11
	dw Route12WildPalettes         ; ROUTE_12
	dw Route13WildPalettes         ; ROUTE_13
	dw Route14WildPalettes         ; ROUTE_14
	dw Route15WildPalettes         ; ROUTE_15
	dw Route16WildPalettes         ; ROUTE_16
	dw DefaultPalettes         ; ROUTE_17
	dw DefaultPalettes         ; ROUTE_18
	dw SeaRoutesWildPalettes       ; ROUTE_19
	dw SeaRoutesWildPalettes       ; ROUTE_20
	dw Route21WildPalettes         ; ROUTE_21
	dw DefaultPalettes             ; ROUTE_22
	dw Route23WildPalettes         ; ROUTE_23
	dw DefaultPalettes             ; ROUTE_24
	dw DefaultPalettes             ; ROUTE_25
	dw DefaultPalettes         ; REDS_HOUSE_1F
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes ; ViridianForest
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes ;mt moon 1f
	dw DefaultPalettes ;mt moon b1f
	dw DefaultPalettes ; mt moon b2f
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes ;rock tunnel 1f
	dw PowerPlantWildPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw VermilionCityWildPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw VictoryRoad1FWildPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes ;pkmn tower 1f
	dw DefaultPalettes ;pkmn tower 2f
	dw DefaultPalettes ;pkmn tower 3f
	dw DefaultPalettes ;pkmn tower 4f
	dw DefaultPalettes ;pkmn tower 5f
	dw DefaultPalettes ;pkmn tower 6f
	dw DefaultPalettes ;pkmn tower 7f
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw SeafoamIslandsB1FWildPalettes
	dw DefaultPalettes
	dw SeafoamIslandsB3FWildPalettes
	dw SeafoamIslandsB4FWildPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw PokemonMansion1FWildPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw SeafoamIslands1FWildPalettes
	dw DefaultPalettes
	dw VictoryRoad2FWildPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes ;digletts cave
	dw VictoryRoad3FWildPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw PokemonMansion2FWildPalettes
	dw PokemonMansion3FWildPalettes
	dw PokemonMansionB1FWildPalettes
	dw SafariZoneEastWildPalettes
	dw SafariZoneNorthWildPalettes
	dw SafariZoneWestWildPalettes
	dw SafariZoneCenterWildPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw CeruleanCave2FWildPalettes
	dw CeruleanCaveB1FWildPalettes
	dw CeruleanCave1FWildPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw RockTunnelB1FWildPalettes ;rock tunnel b1f
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	dw DefaultPalettes
	assert_table_length NUM_MAPS
	dw -1 ; end

INCLUDE "data/wild/palettes/maps/nothing.asm"
INCLUDE "data/wild/palettes/maps/Route1.asm"
INCLUDE "data/wild/palettes/maps/Route2.asm"
INCLUDE "data/wild/palettes/maps/Route22.asm"
INCLUDE "data/wild/palettes/maps/ViridianForest.asm"
INCLUDE "data/wild/palettes/maps/Route3.asm"
INCLUDE "data/wild/palettes/maps/MtMoon1F.asm"
INCLUDE "data/wild/palettes/maps/MtMoonB1F.asm"
INCLUDE "data/wild/palettes/maps/MtMoonB2F.asm"
INCLUDE "data/wild/palettes/maps/Route4.asm"
INCLUDE "data/wild/palettes/maps/Route24.asm"
INCLUDE "data/wild/palettes/maps/Route25.asm"
INCLUDE "data/wild/palettes/maps/Route9.asm"
INCLUDE "data/wild/palettes/maps/Route5.asm"
INCLUDE "data/wild/palettes/maps/Route6.asm"
INCLUDE "data/wild/palettes/maps/Route11.asm"
INCLUDE "data/wild/palettes/maps/RockTunnel1F.asm"
INCLUDE "data/wild/palettes/maps/RockTunnelB1F.asm"
INCLUDE "data/wild/palettes/maps/Route10.asm"
INCLUDE "data/wild/palettes/maps/Route12.asm"
INCLUDE "data/wild/palettes/maps/Route8.asm"
INCLUDE "data/wild/palettes/maps/Route7.asm"
INCLUDE "data/wild/palettes/maps/PokemonTower1F.asm"
INCLUDE "data/wild/palettes/maps/PokemonTower2F.asm"
INCLUDE "data/wild/palettes/maps/PokemonTower3F.asm"
INCLUDE "data/wild/palettes/maps/PokemonTower4F.asm"
INCLUDE "data/wild/palettes/maps/PokemonTower5F.asm"
INCLUDE "data/wild/palettes/maps/PokemonTower6F.asm"
INCLUDE "data/wild/palettes/maps/PokemonTower7F.asm"
INCLUDE "data/wild/palettes/maps/Route13.asm"
INCLUDE "data/wild/palettes/maps/Route14.asm"
INCLUDE "data/wild/palettes/maps/Route15.asm"
INCLUDE "data/wild/palettes/maps/Route16.asm"
INCLUDE "data/wild/palettes/maps/Route17.asm"
INCLUDE "data/wild/palettes/maps/Route18.asm"
INCLUDE "data/wild/palettes/maps/SafariZoneCenter.asm"
INCLUDE "data/wild/palettes/maps/SafariZoneEast.asm"
INCLUDE "data/wild/palettes/maps/SafariZoneNorth.asm"
INCLUDE "data/wild/palettes/maps/SafariZoneWest.asm"
INCLUDE "data/wild/palettes/maps/SeaRoutes.asm"
INCLUDE "data/wild/palettes/maps/SeafoamIslands1F.asm"
INCLUDE "data/wild/palettes/maps/SeafoamIslandsB1F.asm"
INCLUDE "data/wild/palettes/maps/SeafoamIslandsB2F.asm"
INCLUDE "data/wild/palettes/maps/SeafoamIslandsB3F.asm"
INCLUDE "data/wild/palettes/maps/SeafoamIslandsB4F.asm"
INCLUDE "data/wild/palettes/maps/PokemonMansion1F.asm"
INCLUDE "data/wild/palettes/maps/PokemonMansion2F.asm"
INCLUDE "data/wild/palettes/maps/PokemonMansion3F.asm"
INCLUDE "data/wild/palettes/maps/PokemonMansionB1F.asm"
INCLUDE "data/wild/palettes/maps/Route21.asm"
INCLUDE "data/wild/palettes/maps/CeruleanCave1F.asm"
INCLUDE "data/wild/palettes/maps/CeruleanCave2F.asm"
INCLUDE "data/wild/palettes/maps/CeruleanCaveB1F.asm"
INCLUDE "data/wild/palettes/maps/PowerPlant.asm"
INCLUDE "data/wild/palettes/maps/Route23.asm"
INCLUDE "data/wild/palettes/maps/VictoryRoad2F.asm"
INCLUDE "data/wild/palettes/maps/VictoryRoad3F.asm"
INCLUDE "data/wild/palettes/maps/VictoryRoad1F.asm"
INCLUDE "data/wild/palettes/maps/DiglettsCave.asm"
INCLUDE "data/wild/palettes/maps/VermilionCity.asm"
INCLUDE "data/wild/palettes/maps/FuchsiaCity.asm"
INCLUDE "data/wild/palettes/maps/ViridianCity.asm"
