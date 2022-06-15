; super rod encounters
SuperRodData:
	; map, fishing group
	dbw PALLET_TOWN,         .Group1 
	dbw VIRIDIAN_CITY,       .Group2 
	dbw CERULEAN_CITY,       .Group3
	dbw VERMILION_CITY,      .Group4 ; alt palette magikarp
	dbw CELADON_CITY,        .Group5
	dbw FUCHSIA_CITY,        .Group10 ; alt palette goldeen/seaking
	dbw CINNABAR_ISLAND,     .Group8 ; alt palette horsea
	dbw ROUTE_4,             .Group3
	dbw ROUTE_6,             .Group3 ; alt palette goldeen
	dbw ROUTE_10,            .Group5
	dbw ROUTE_11,            .Group4 ; alt palette magikarp
	dbw ROUTE_12,            .Group7 ; alt palette tentacool/tentacruel
	dbw ROUTE_13,            .Group7 ; alt palette tentacool/tentacruel
	dbw ROUTE_17,            .Group7
	dbw ROUTE_18,            .Group7
	dbw ROUTE_19,            .Group8 ; alt palette horsea
	dbw ROUTE_20,            .Group8 ; alt palette horsea
	dbw ROUTE_21,            .Group8 
	dbw ROUTE_22,            .Group2 
	dbw ROUTE_23,            .Group6
	dbw ROUTE_24,            .Group3
	dbw ROUTE_25,            .Group3
	dbw CERULEAN_GYM,        .Group3
	dbw VERMILION_DOCK,      .Group4 ; alt palette magikarp
	dbw SEAFOAM_ISLANDS_B3F, .Group8 ; alt palette shellder
	dbw SEAFOAM_ISLANDS_B4F, .Group8 ; alt palette shellder
	dbw SAFARI_ZONE_EAST,    .Group6 
	dbw SAFARI_ZONE_NORTH,   .Group6 
	dbw SAFARI_ZONE_WEST,    .Group6 
	dbw SAFARI_ZONE_CENTER,  .Group6 
	dbw CERULEAN_CAVE_2F,    .Group9 ; all alt palette
	dbw CERULEAN_CAVE_B1F,   .Group9 ; all alt palette
	dbw CERULEAN_CAVE_1F,    .Group9 ; all alt palette
	db -1 ; end

; fishing groups
; number of monsters, followed by level/monster pairs

.Group1:
	db 2
	db 31, TENTACOOL
	db 28, POLIWAG

.Group2:
	db 2
	db 29, GOLDEEN
	db 29, POLIWAG

.Group3:
	db 4
	db 25, PSYDUCK
	db 25, GOLDEEN
	db 25, KRABBY
	db 32, SEAKING

.Group4:
	db 4
	db 25, KRABBY
	db 25, SHELLDER
	db 19, MAGIKARP
	db 18, MAGIKARP

.Group5:
	db 4
	db 28, GRIMER
	db 25, GRIMER
	db 29, GRIMER
	db 27, GRIMER

.Group6:
	db 4
	db 25, DRATINI
	db 27, DRATINI
	db 25, PSYDUCK
	db 26, SLOWPOKE

.Group7:
	db 4
	db 30, TENTACOOL
	db 27, KRABBY
	db 25, GOLDEEN
	db 34, TENTACRUEL

.Group8:
	db 4
	db 34, STARYU
	db 33, HORSEA
	db 32, SHELLDER
	db 31, TENTACOOL

.Group9:
	db 4
	db 45, DRATINI
	db 47, DRAGONAIR
	db 42, DRATINI
	db 50, DRAGONAIR

.Group10:
	db 4
	db 33, SEAKING
	db 25, KRABBY
	db 28, GOLDEEN
	db 19, MAGIKARP
