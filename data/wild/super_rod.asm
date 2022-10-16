; super rod encounters
SuperRodData:
	; map, fishing group
	dbw PALLET_TOWN,         		.Group1
	dbw VIRIDIAN_CITY,       		.Group1
	dbw CERULEAN_CITY,       		.Group3
	dbw VERMILION_CITY,      		.Group4
	dbw CELADON_CITY,        		.Group5
	dbw FUCHSIA_CITY,        		.Group7
	dbw CINNABAR_ISLAND,     		.Group8
	dbw ROUTE_4,             		.Group3
	dbw ROUTE_6,             		.Group4
	dbw ROUTE_10,            		.Group5
	dbw ROUTE_11,            		.Group4
	dbw ROUTE_12,            		.Group7
	dbw ROUTE_13,            		.Group7
	dbw ROUTE_17,            		.Group7
	dbw ROUTE_18,            		.Group7
	dbw ROUTE_19,            		.Group8
	dbw ROUTE_20,            		.Group8
	dbw ROUTE_21,            		.Group8
	dbw ROUTE_22,            		.Group2
	dbw ROUTE_23,            		.Group9
	dbw ROUTE_24,            		.Group3
	dbw ROUTE_25,            		.Group3
	dbw CERULEAN_GYM,        		.Group3
	dbw VERMILION_DOCK,      		.Group4
	dbw SEAFOAM_ISLANDS_B3F, 		.Group8
	dbw SEAFOAM_ISLANDS_B4F, 		.Group8
	dbw SAFARI_ZONE_EAST,    		.Group6
	dbw SAFARI_ZONE_NORTH,   		.Group6
	dbw SAFARI_ZONE_WEST,    		.Group6
	dbw SAFARI_ZONE_CENTER,  		.Group6
	dbw CERULEAN_CAVE_2F,   		.Group9
	dbw CERULEAN_CAVE_B1F,  		.Group10
	dbw CERULEAN_CAVE_1F,   		.Group9
	dbw SILPH_GAUNTLET_5F,   		.Group10
	dbw ROCK_TUNNEL_1F,     		.Group5
	dbw CELADON_UNIVERSITY_OUTSIDE, .Group11
	dbw FARAWAY_ISLAND_INSIDE, 		.Group7
	db -1 ; end

; fishing groups
; number of monsters, followed by level/monster pairs

.Group1:
	db 2
	db 10, MAGIKARP
	db 5, GYOPIN

.Group2:
	db 3
	db 10, MAGIKARP
	db 7, POLIWAG
	db 10, GYOPIN

.Group3:
	db 5
	db 15, SKIMPER
	db 15, MAGIKARP
	db 15, KRABBY
	db 15, BLOTTLE
	db 15, CHEEP

.Group4:
	db 5
	db 20, KRABBY
	db 20, SHELLDER
	db 20, TENTACOOL
	db 20, BLOTTLE
	db 20, HORSEA

.Group5:
	db 5
	db 25, POLIWHIRL
	db 25, SLOWPOKE
	db 20, SKIMPER
	db 25, CHEEP
	db 25, BLOTTLE

.Group6:
	db 6
	db 15, DRATINI
	db 28, KRABBY
	db 25, CHEEP
	db 25, POLIWHIRL
	db 35, DRAGONAIR
	db 32, BAWLIGUA

.Group7:
	db 6
	db 35, TENTACRUEL
	db 35, KINGLER
	db 35, SEAKING
	db 35, GYARADOS
	db 35, PENDRAKEN
	db 35, JABETTA

.Group8:
	db 5
	db 40, STARYU
	db 40, SEADRA
	db 40, SHELLDER
	db 40, PENDRAKEN
	db 40, JAGG

.Group9:
	db 5
	db 50, GYARADOS
	db 50, SEAKING
	db 50, KINGLER
	db 50, SEADRA
	db 50, PENDRAKEN

.Group10:
	db 12
	db 50, KINGLER
	db 50, PENDRAKEN
	db 50, SEAKING
	db 100, MAGIKARP
	db 50, SEADRA
	db 50, STARYU
	db 50, SHELLDER
	db 50, SLOWBRO
	db 50, GOLDUCK
	db 50, JABETTA
	db 50, POLIWHIRL
	db 60, CRYITHAN

.Group11:
	db 4
	db 25, MAGIKARP
	db 20, MAGIKARP
	db 20, GYARADOS
	db 20, GRIMER
