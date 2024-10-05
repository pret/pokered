; PureRGBnote: ADDED: Tracks whether to keep STRENGTH turned on, or keep autosurf turned on between maps.
; This is done for convenience in some maps with surfing / strength rocks indoors

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
	db SAFARI_ZONE_NORTH
	db SAFARI_ZONE_WEST
	db SAFARI_ZONE_CENTER_REST_HOUSE
	db SAFARI_ZONE_SECRET_HOUSE
	db SAFARI_ZONE_WEST_REST_HOUSE
	db SAFARI_ZONE_EAST_REST_HOUSE
	db SAFARI_ZONE_NORTH_REST_HOUSE
SurfRestrictedMapsOnMoveDelete:
	db CERULEAN_CAVE_1F
	db CERULEAN_CAVE_2F
	db CERULEAN_CAVE_B1F
	db SEAFOAM_ISLANDS_1F
	db SEAFOAM_ISLANDS_B1F
	db SEAFOAM_ISLANDS_B2F
	db SEAFOAM_ISLANDS_B3F
	db SEAFOAM_ISLANDS_B4F
	db POWER_PLANT
	db CINNABAR_VOLCANO
	db FUCHSIA_GOOD_ROD_HOUSE
	db -1

CheckResetSurfStrengthFlags::
	ld a, [wStatusFlags1]
	bit BIT_STRENGTH_ACTIVE, a
	jr z, .onlyCheckSurf
	ld hl, NoResetStrengthMaps
	ld de, 1
	ld a, [wCurMap]
	call IsInArray
	ld hl, wStatusFlags1
	jr c, .skipReset
	res BIT_STRENGTH_ACTIVE, [hl] ; reset strength bit
.skipReset
	bit BIT_AUTOSURF, [hl]
	ret z
.onlyCheckSurf
	; if we load a map while surfing (like when loading a save), don't clear the autosurf bit (avoids softlocking on islands)
	ld a, [wWalkBikeSurfState]
	cp SURFING
	jr z, .skipReset2
	ld hl, NoResetSurfMaps
	ld de, 1
	ld a, [wCurMap]
	call IsInArray
	jr c, .skipReset2
	; in some places like islands in maps with a lot of water, we avoid resetting the surf bit to prevent softlocks on loading the map
	call CheckInSurfRestrictedArea
	jr c, .skipReset2
	ld hl, wStatusFlags1
	res BIT_AUTOSURF, [hl] ; reset surf bit
.skipReset2
	cp a ; set z flag
	ret