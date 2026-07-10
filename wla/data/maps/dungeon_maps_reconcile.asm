; Reconciled from master RGBDS source: data/maps/dungeon_maps.asm
; RGBDS source is untouched.
; WLA-DX representation for reconciliation only.

DungeonMaps1:
; Maps that are dungeon maps
.DB VIRIDIAN_FOREST
.DB ROCK_TUNNEL_1F
.DB SEAFOAM_ISLANDS_1F
.DB ROCK_TUNNEL_B1F
.DB -1 ; end

DungeonMaps2:
; Map pairs (low, high) — dungeon transition range
; all MT_MOON maps
.DB MT_MOON_1F, MT_MOON_B2F
; all SS_ANNE maps, VICTORY_ROAD_1F, LANCES_ROOM, and HALL_OF_FAME
.DB SS_ANNE_1F, HALL_OF_FAME
; all POKEMON_TOWER maps and Lavender Town buildings
.DB LAVENDER_POKECENTER, LAVENDER_CUBONE_HOUSE
; SILPH_CO_[2-8]F, POKEMON_MANSION[2F-B1F], SAFARI_ZONE, and
; CERULEAN_CAVE maps, except for SILPH_CO_1F
.DB SILPH_CO_2F, CERULEAN_CAVE_1F
.DB -1 ; end
