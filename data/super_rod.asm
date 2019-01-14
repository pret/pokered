; super rod data
; format: map, pointer to fishing group
SuperRodData:
	dbw PALLET_TOWN, FishingGroup1
	dbw VIRIDIAN_CITY, FishingGroup1
	dbw CERULEAN_CITY, FishingGroup3
	dbw VERMILION_CITY, FishingGroup4
	dbw CELADON_CITY, FishingGroup5
	dbw FUCHSIA_CITY, FishingGroup10
	dbw CINNABAR_ISLAND, FishingGroup8
	dbw ROUTE_4, FishingGroup3
	dbw ROUTE_6, FishingGroup4
	dbw ROUTE_10, FishingGroup5
	dbw ROUTE_11, FishingGroup4
	dbw ROUTE_12, FishingGroup7
	dbw ROUTE_13, FishingGroup7
	dbw ROUTE_17, FishingGroup7
	dbw ROUTE_18, FishingGroup7
	dbw ROUTE_19, FishingGroup8
	dbw ROUTE_20, FishingGroup8
	dbw ROUTE_21, FishingGroup8
	dbw ROUTE_22, FishingGroup2
	dbw ROUTE_23, FishingGroup9
	dbw ROUTE_24, FishingGroup3
	dbw ROUTE_25, FishingGroup3
	dbw CERULEAN_GYM, FishingGroup3
	dbw VERMILION_DOCK, FishingGroup4
	dbw SEAFOAM_ISLANDS_B3F, FishingGroup8
	dbw SEAFOAM_ISLANDS_B4F, FishingGroup8
	dbw SAFARI_ZONE_EAST, FishingGroup6
	dbw SAFARI_ZONE_NORTH, FishingGroup6
	dbw SAFARI_ZONE_WEST, FishingGroup6
	dbw SAFARI_ZONE_CENTER, FishingGroup6
	dbw CERULEAN_CAVE_2F, FishingGroup9
	dbw CERULEAN_CAVE_B1F, FishingGroup9
	dbw CERULEAN_CAVE_1F, FishingGroup9
	db $FF

; fishing groups
; number of monsters, followed by level/monster pairs
FishingGroup1:
	db 2
	db 15,TENTACOOL
	db 15,POLIWAG

FishingGroup2:
	db 2
	db 15,GOLDEEN
	db 15,POLIWAG

FishingGroup3:
	db 3
	db 15,PSYDUCK
	db 15,GOLDEEN
	db 15,KRABBY

FishingGroup4:
	db 2
	db 15,KRABBY
	db 15,SHELLDER

FishingGroup5:
	db 2
	db 23,POLIWHIRL
	db 15,SLOWPOKE

FishingGroup6:
	db 4
	db 15,DRATINI
	db 15,KRABBY
	db 15,PSYDUCK
	db 15,SLOWPOKE

FishingGroup7:
	db 4
	db 5,TENTACOOL
	db 15,KRABBY
	db 15,GOLDEEN
	db 15,MAGIKARP

FishingGroup8:
	db 4
	db 15,STARYU
	db 15,HORSEA
	db 15,SHELLDER
	db 15,GOLDEEN

FishingGroup9:
	db 4
	db 23,SLOWBRO
	db 23,SEAKING
	db 23,KINGLER
	db 23,SEADRA

FishingGroup10:
	db 4
	db 23,SEAKING
	db 15,KRABBY
	db 15,GOLDEEN
	db 15,MAGIKARP
