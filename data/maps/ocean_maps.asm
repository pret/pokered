OceanMaps:
	db PALLET_TOWN
	db VERMILION_CITY
	db ROUTE_11
	db ROUTE_12
	db ROUTE_13
	db ROUTE_17
	db ROUTE_18
	db ROUTE_19
	db ROUTE_20
	db ROUTE_21
	db CINNABAR_ISLAND
	db ROUTE_25
	db VERMILION_DOCK
	db SEAFOAM_ISLANDS_B3F
	db SEAFOAM_ISLANDS_B4F
	db -1

; is map id stored in c an ocean map
IsMapOceanMap:
	ld hl, OceanMaps         
.loop
	ld a, [hli]                  
	cp c                         
	jr z, .ocean         
	inc a                        
	jr nz, .loop         
	jr .notOcean               
.ocean
	scf
.notOcean
	ret