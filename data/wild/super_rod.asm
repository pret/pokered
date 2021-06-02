; super rod encounters
SuperRodData:
	; map, fishing group
	dbw PALLET_TOWN,         .Group1
	dbw VIRIDIAN_CITY,       .Group1
	dbw CERULEAN_CITY,       .Group3
	dbw VERMILION_CITY,      .Group4
	dbw CELADON_CITY,        .Group5
	dbw FUCHSIA_CITY,        .Group10
	dbw CINNABAR_ISLAND,     .Group8
	dbw ROUTE_5,             .Group3
	dbw ROUTE_5,             .Group4
	dbw ROUTE_5,            .Group5
	dbw ROUTE_5,            .Group4
	dbw ROUTE_5,            .Group7
	dbw ROUTE_5,            .Group7
	dbw ROUTE_5,            .Group7
	dbw ROUTE_5,            .Group7
	dbw ROUTE_5,            .Group8
	dbw ROUTE_5,            .Group8
	dbw ROUTE_5,            .Group8
	dbw ROUTE_5,            .Group2
	dbw ROUTE_5,            .Group9
	dbw ROUTE_5,            .Group3
	dbw ROUTE_5,            .Group3
	dbw CERULEAN_GYM,        .Group3
	dbw VERMILION_DOCK,      .Group4
	dbw SEAFOAM_ISLANDS_B3F, .Group8
	dbw SEAFOAM_ISLANDS_B4F, .Group8
	dbw SAFARI_ZONE_EAST,    .Group6
	dbw SAFARI_ZONE_NORTH,   .Group6
	dbw SAFARI_ZONE_WEST,    .Group6
	dbw SAFARI_ZONE_CENTER,  .Group6
	dbw CERULEAN_CAVE_2F,    .Group9
	dbw CERULEAN_CAVE_B1F,   .Group9
	dbw CERULEAN_CAVE_1F,    .Group9
	db -1 ; end

; fishing groups
; number of monsters, followed by level/monster pairs

.Group1:
	db 2
	db 5, TENTACOOL
	db 5, POLIWAG

.Group2:
	db 2
	db 5, GOLDEEN
	db 5, POLIWAG

.Group3:
	db 3
	db 5, PSYDUCK
	db 5, GOLDEEN
	db 5, KRABBY

.Group4:
	db 2
	db 5, KRABBY
	db 5, SHELLDER

.Group5:
	db 2
	db 5, POLIWAG
	db 5, SLOWPOKE

.Group6:
	db 4
	db 5, DRATINI
	db 5, KRABBY
	db 5, PSYDUCK
	db 5, SLOWPOKE

.Group7:
	db 4
	db 5, TENTACOOL
	db 5, KRABBY
	db 5, GOLDEEN
	db 5, MAGIKARP

.Group8:
	db 4
	db 5, STARYU
	db 5, HORSEA
	db 5, SHELLDER
	db 5, GOLDEEN

.Group9:
	db 4
	db 5, SLOWPOKE
	db 5, GOLDEEN
	db 5, KRABBY
	db 5, HORSEA

.Group10:
	db 4
	db 5, GOLDEEN
	db 5, KRABBY
	db 5, GOLDEEN
	db 5, MAGIKARP
