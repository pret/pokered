NoResetStrengthMaps:
	db SEAFOAM_ISLANDS_1F
	db SEAFOAM_ISLANDS_B1F
	db SEAFOAM_ISLANDS_B2F
	db SEAFOAM_ISLANDS_B3F
	db SEAFOAM_ISLANDS_B4F
	db VICTORY_ROAD_1F
	db VICTORY_ROAD_2F
	db VICTORY_ROAD_3F
	db -1

NoResetSurfMaps:
	db SAFARI_ZONE_CENTER
	db SAFARI_ZONE_EAST
	db SAFARI_ZONE_CENTER
	db SAFARI_ZONE_WEST
	db SAFARI_ZONE_CENTER_REST_HOUSE
	db SAFARI_ZONE_SECRET_HOUSE
	db SAFARI_ZONE_WEST_REST_HOUSE
	db SAFARI_ZONE_EAST_REST_HOUSE
	db SAFARI_ZONE_NORTH_REST_HOUSE
	db CERULEAN_CAVE_1F
	db CERULEAN_CAVE_2F
	db CERULEAN_CAVE_B1F
	db SEAFOAM_ISLANDS_1F
	db SEAFOAM_ISLANDS_B1F
	db SEAFOAM_ISLANDS_B2F
	db SEAFOAM_ISLANDS_B3F
	db SEAFOAM_ISLANDS_B4F
	db -1

CheckResetSurfStrengthFlags::
	ld a, [wd728]
	bit 0, a
	jr z, .onlyCheckSurf
	ld hl, NoResetStrengthMaps
	ld de, 1
	ld a, [wCurMap]
	call IsInArray
	ld hl, wd728
	jr c, .skipReset
	res 0, [hl] ; reset strength bit
.skipReset
	bit 2, [hl]
	ret z
.onlyCheckSurf
	ld hl, NoResetSurfMaps
	ld de, 1
	ld a, [wCurMap]
	call IsInArray
	jr c, .skipReset2
	ld hl, wd728
	res 2, [hl] ; reset surf bit
.skipReset2
	cp a ; set z flag
	ret