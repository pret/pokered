; PureRGBnote: ADDED: If FLAG_MAP_HAS_OVERWORLD_ANIMATION is set, this function will run each Overworld loop. 
; In the volcano, a "Shaking" animation occasionally plays.
; In DIGLETT's CAVE, this is also used to hide digletts when you get too close.
; Could be used for other things but at the moment just these two.
CheckOverworldAnimation::
	ld a, [wCurMap]
	cp CINNABAR_VOLCANO
	jr nz, .notVolcano
	ld a, [wOverworldAnimationCooldown]
	and a
	jr z, .noCooldown
	inc a
	ld [wOverworldAnimationCooldown], a
.noCooldown
	ld a, [wOverworldAnimationCounter]
	and a
	ret z
	ld b, a
	cp 3
	jr z, .finishRumble
	CheckEvent EVENT_IN_LAVA_FLOOD_ROOM
	jr nz, .lava_flood
.rumble
	ld a, [wOverworldAnimationCounter]
	dec a
	ld [wOverworldAnimationCounter], a
	rra
	ret c ; only update every other frame
	CheckAndResetFlagHL FLAG_JIGGLE_TOGGLE
	ldh a, [hSCX]
	ld d, a
	ldh a, [hSCY]
	ld e, a
	ld a, %00000001 ; add 1
	jr nz, .moveBack
	SetFlag FLAG_JIGGLE_TOGGLE
	ld a, %11111111 ; subtract 1
.moveBack
	push af
	add d
	ldh [hSCX], a
	pop af
	add e
	ldh [hSCY], a
	ret
.finishRumble
	xor a
	ld [wOverworldAnimationCounter], a
	inc a
	ld [wOverworldAnimationCooldown], a
	jpfar LavaFloodReset
.notVolcano
	cp DIGLETTS_CAVE
	jr nz, .notDiglettsCave
	jpfar DiglettsCaveDiglettAnimation
.notDiglettsCave
	xor a
	ld [wOverworldAnimationCounter], a
	ResetFlag FLAG_MAP_HAS_OVERWORLD_ANIMATION
	ret
.lava_flood
	ld a, [wOverworldAnimationCounter]
	cp 125
	jr nc, .rumble
	CheckAndSetEvent EVENT_LAVA_FLOOD_ACTIVE
	jr nz, .checkForWarpOrRumble
	; on the first run of this function with the counter past 100 lava will flood the "ash" tiles
	call ReplaceLavaFloodTiles
	call CopyVideoData
	ld de, SFX_Lava_Flows
	call PlayNewSoundChannel8
	jp .rumble
.checkForWarpOrRumble
	; check if the player has a lava tile under them, if so, do warp
	lda_coord 8, 9
	cp $2A
	jp nz, .rumble
	ld a, $4A ; warp pad tile
	ldcoord_a 8, 9 ; loading this changes the warp animation to the warp pad one for whatever reason which is what we want
	; scripted warp
	ld a, CINNABAR_VOLCANO
	ldh [hWarpDestinationMap], a
	ld a, [wWarpedFromWhichWarp]
	ld [wDestinationWarpID], a
	ld hl, wStatusFlags3
	set BIT_WARP_FROM_CUR_SCRIPT, [hl]
	ret

CinnabarVolcanoCheckLoadCustomTiles::
	CheckEvent EVENT_LAVA_FLOOD_ACTIVE
	ret z
ReplaceLavaFloodTiles:
	ld hl, vChars2 tile $2A
	ld de, Volcano_GFX tile $14
	lb bc, BANK(Volcano_GFX), 1
	call CopyVideoData
	ld hl, vChars2 tile $27
	ld de, Volcano_GFX tile $21
	lb bc, BANK(Volcano_GFX), 1
	jp CopyVideoData
