; PureRGBnote: ADDED:
; when entering some maps in which we can replace tileblocks on loading it
; when we enter the map from an animation like falling through a hole or warping, 
; we need to still replace those tileblocks before doing the animation or the player will see them disappear / change
EnterMapAnimReplaceTileBlocks::
	ld a, [wCurMapConnections]
	bit BIT_DEFER_SHOWING_MAP, a
	ret z
	ld a, [wCurMapTileset]
	cp VOLCANO
	jr nz, .notVolcano1 ; volcano warp end animation
	callfar LavaFloodReset
	jpfar VolcanoDoRoomSpecificMapLoadCode ; TODO: should it be CinnabarVolcanoOnMapLoad?
.notVolcano1
	ld a, [wCurMap]
	cp SEAFOAM_ISLANDS_B4F
	jr z, .seafoamb4f
	cp SEAFOAM_ISLANDS_B3F
	jr z, .seafoamb3f
	cp VICTORY_ROAD_2F
	jr z, .victoryroad2f
	cp SILPH_CO_2F
	jr z, .silphCo2F
	cp SILPH_CO_3F
	jr z, .silphCo3F
	cp SILPH_CO_4F
	jr z, .silphCo4F
	cp SILPH_CO_5F
	jr z, .silphCo5F
	cp SILPH_CO_6F
	jr z, .silphCo6F
	cp SILPH_CO_7F
	jr z, .silphCo7F
	cp SILPH_CO_8F
	jr z, .silphCo8F
	cp SILPH_CO_9F
	jr z, .silphCo9F
	cp SILPH_CO_10F
	jr z, .silphCo10F
	cp SILPH_CO_11F
	jr z, .silphCo11F
	ret
.seafoamb3f
	jpfar SeafoamIslandsB3FOnMapLoad
.seafoamb4f
	jpfar SeafoamIslandsB4FOnMapLoad
.victoryroad2f
	jpfar VictoryRoad2FCheckBoulderEventScript
.silphCo2F
	jpfar SilphCo2FGateCallbackScript
.silphCo3F
	jpfar SilphCo3FGateCallbackScript
.silphCo4F
	jpfar SilphCo4FGateCallbackScript
.silphCo5F
	jpfar SilphCo5FGateCallbackScript
.silphCo6F
	jpfar SilphCo6FGateCallbackScript
.silphCo7F
	jpfar SilphCo7FGateCallbackScript
.silphCo8F
	jpfar SilphCo8FGateCallbackScript
.silphCo9F
	jpfar SilphCo9FGateCallbackScript
.silphCo10F
	jpfar SilphCo10FGateCallbackScript
.silphCo11F
	jpfar SilphCo11FGateCallbackScript
