; super rod encounters
SuperRodData:
	; map, fishing group
	dbw PALLET_TOWN,         		.Group1
	dbw VIRIDIAN_CITY,       		.Group1
	dbw CERULEAN_CITY,       		.Group2
	dbw VERMILION_CITY,      		.Group3
	dbw CELADON_CITY,        		.Group11
	dbw FUCHSIA_CITY,        		.Group5
	dbw CINNABAR_ISLAND,     		.Group8
	dbw CITRINE_CITY,				.Group9
	dbw ROUTE_4,             		.Group2
	dbw ROUTE_6,             		.Group2
	dbw ROUTE_10,            		.Group4
	dbw ROUTE_11,            		.Group3
	dbw ROUTE_12,            		.Group4
	dbw ROUTE_13,            		.Group5
	dbw ROUTE_17,            		.Group5
	dbw ROUTE_18,            		.Group5
	dbw ROUTE_19,            		.Group8
	dbw ROUTE_20,            		.Group8
	dbw ROUTE_21,            		.Group8
	dbw ROUTE_22,            		.Group1
	dbw ROUTE_23,            		.Group8
	dbw ROUTE_24,            		.Group2
	dbw ROUTE_25,            		.Group3
	dbw CERULEAN_GYM,        		.Group2
	dbw VERMILION_DOCK,      		.Group3
	dbw SEAFOAM_ISLANDS_B3F, 		.Group8
	dbw SEAFOAM_ISLANDS_B4F, 		.Group8
	dbw SAFARI_ZONE_EAST,    		.Group6
	dbw SAFARI_ZONE_NORTH,   		.Group6
	dbw SAFARI_ZONE_WEST,    		.Group6
	dbw SAFARI_ZONE_CENTER,  		.Group6
	dbw CERULEAN_CAVE_2F,   		.Group10
	dbw CERULEAN_CAVE_B1F,  		.Group10
	dbw CERULEAN_CAVE_1F,   		.Group10
	dbw SILPH_GAUNTLET_5F,   		.Group6
	dbw ROCK_TUNNEL_1F,     		.Group4
	dbw CELADON_UNIVERSITY_OUTSIDE, .Group11
	dbw FARAWAY_ISLAND_INSIDE, 		.Group10
	dbw MT_MOON_CRATER,				.Group10
	dbw DIGLETTS_CAVE,				.Group12
	dbw BILLS_GARDEN,				.Group7
	dbw UNDERWATER_TUNNEL,			.Group8
	db -1 ; end

; fishing groups
; number of monsters, followed by level/monster pairs

.Group1:	; Pallet, Viridian & Route 22
	db 4
	db 5, MAGIKARP
	db 7, MAGIKARP
	db 5, GYOPIN
	db 7, GYOPIN

.Group2:	; Route 4, Cerulean, Route 24, Route 6
	db 5
	db 12, MAGIKARP
	db 12, POLIWAG
	db 12, GYOPIN
	db 12, PSYDUCK
	db 12, CHEEP

.Group3:	; Route 11, Route 25, Vermilion
	db 5
	db 15, BLOTTLE
	db 15, MAGIKARP
	db 15, SLOWPOKE
	db 15, TENTACOOL
	db 15, CHEEP

.Group4:	; Route 10, Route 12, Rock Tunnel
	db 5
	db 20, SLOWPOKE
	db 20, PSYDUCK
	db 20, TENTACOOL
	db 20, BLOTTLE
	db 20, MAGIKARP

.Group5:	; Route 13, Route 17, Route 18, Fuchsia
	db 7
	db 25, HORSEA
	db 25, POLIWHIRL
	db 25, KRABBY
	db 20, SKIMPER
	db 25, CHEEP
	db 25, BLOTTLE
	db 25, GOLDEEN

.Group6:	; Safari Zone
	db 7
	db 15, DRATINI
	db 20, SLOWPOKE
	db 25, KRABBY
	db 25, WEIRDUCK
	db 25, POLIWHIRL
	db 30, DRAGONAIR
	db 20, SKIMPER

.Group7:	; Bill's Garden
	db 6
	db 50, SQUIRTLE
	db 50, WARTORTLE
	db 50, TOTARTLE
	db 50, DRATINI
	db 50, DRAGONAIR
	db 55, DRAGONITE

.Group8:	; Sea Routes, Route 23, Seafoam Islands, Underwater Tunnel
	db 7
	db 30, STARYU
	db 30, HORSEA
	db 30, SHELLDER
	db 30, PENDRAKEN
	db 30, JAGG
	db 30, BLASTYKE
	db 30, GOLDEEN

.Group9:	; Citrine, Chartreuse, Crimson
	db 10
	db 50, JAGG
	db 50, SEAKING
	db 50, KINGLER
	db 50, SEADRA
	db 50, PENDRAKEN
	db 50, GYARADOS
	db 50, JABETTA
	db 50, CROAKOZUNA
	db 50, BLASTOISE
	db 50, LAPRAS

.Group10:	; Cerulean Cave
	db 10
	db 50, SLOWBRO
	db 50, SEAKING
	db 50, KINGLER
	db 50, WUGTRIO
	db 50, SHELLDER
	db 50, GYARADOS
	db 50, JABETTA
	db 50, CROAKOZUNA
	db 50, GOLDUCK
	db 100, MAGIKARP 

.Group11:	; Celadon
	db 7
	db 5, MAGIKARP
	db 10, MAGIKARP
	db 15, MAGIKARP
	db 20, MAGIKARP
	db 25, MAGIKARP
	db 20, GYARADOS
	db 20, GRIMER

.Group12:	; Diglett's Cave
	db 6
	db 16, WIGLETT
	db 18, WIGLETT
	db 19, WIGLETT
	db 21, WIGLETT
	db 20, WIGLETT
	db 28, WUGTRIO