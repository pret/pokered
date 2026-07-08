; Reconciled from master RGBDS source: data/maps/special_warps.asm
; RGBDS source is untouched.
; WLA-DX representation for reconciliation only.

; DungeonWarpList:
; (target map, dungeon warp index) pairs
.DB SEAFOAM_ISLANDS_B1F, 1
.DB SEAFOAM_ISLANDS_B1F, 2
.DB SEAFOAM_ISLANDS_B2F, 1
.DB SEAFOAM_ISLANDS_B2F, 2
.DB SEAFOAM_ISLANDS_B3F, 1
.DB SEAFOAM_ISLANDS_B3F, 2
.DB SEAFOAM_ISLANDS_B4F, 1
.DB SEAFOAM_ISLANDS_B4F, 2
.DB VICTORY_ROAD_2F, 2
.DB POKEMON_MANSION_1F, 1
.DB POKEMON_MANSION_1F, 2
.DB POKEMON_MANSION_2F, 3
.DB -1 ; end

; NewGameWarp:
; (target map, sub-block Y, sub-block X, target dungeon warp)
.DB REDS_HOUSE_2F, 3, 6, REDS_HOUSE_2

; TradeCenterPlayerWarp:
.DB TRADE_CENTER, 3, 4, CLUB

; TradeCenterFriendWarp:
.DB TRADE_CENTER, 6, 4, CLUB

; ColosseumPlayerWarp:
.DB COLOSSEUM, 3, 4, CLUB

; ColosseumFriendWarp:
.DB COLOSSEUM, 6, 4, CLUB

; FlyWarpDataPtr:
; (target map, word pointer) pairs
.DB PALLET_TOWN, .PalletTown
.DB VIRIDIAN_CITY, .ViridianCity
.DB PEWTER_CITY, .PewterCity
.DB CERULEAN_CITY, .CeruleanCity
.DB LAVENDER_TOWN, .LavenderTown
.DB VERMILION_CITY, .VermilionCity
.DB CELADON_CITY, .CeladonCity
.DB FUCHSIA_CITY, .FuchsiaCity
.DB CINNABAR_ISLAND, .CinnabarIsland
.DB INDIGO_PLATEAU, .IndigoPlateau
.DB SAFFRON_CITY, .SaffronCity
.DB ROUTE_4, .Route4
.DB ROUTE_10, .Route10
