; PureRGBnote: ADDED: Digletts show up here visually now if OG+ Icons are turned on.
; PureRGBnote: ADDED: This map is also used for the secret tunnel from saffron city to the underground path.
DiglettsCave_Script:
	call DiglettsCaveCheckStandingOnWarp
	call CheckAutoHideDigletts
	jp EnableAutoTextBoxDrawing

DiglettsCave_TextPointers:
	def_text_pointers
	dw_const DiglettsCaveDiglettText, TEXT_DIGLETTS_CAVE_DIGLETTS

CheckAutoHideDigletts:
	; can happen if you change the option setting while they're visible
	ld a, [wSpriteOptions2]
	bit BIT_MENU_ICON_SPRITES, a
	ret nz
	CheckEvent EVENT_DIGLETTS_VISIBLE
	ret z
	jp HideDigletts

DiglettsCaveCheckStandingOnWarp:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	jr z, .checkStandingOnWarp
	call .standingOnBottomWarp
	jr nz, .loadDigletts
	SetEvent EVENT_FOUND_SECRET_DIG_TUNNEL
	ld d, D_UP
	jpfar ForceStepFromDoor
.checkStandingOnWarp
	call .standingOnBottomWarp
	ret nz
	ld a, SAFFRON_CITY
	ld [wLastMap], a
	ld a, SILPH_CO_1F
	ldh [hWarpDestinationMap], a
	ld a, 8 ; 9 - 1
	ld [wDestinationWarpID], a
	ld hl, wStatusFlags3
	set BIT_WARP_FROM_CUR_SCRIPT, [hl]
	ret
.standingOnBottomWarp
	ld a, [wXCoord]
	cp 23
	ret nz
	ld a, [wYCoord]
	cp 19
	ret
.loadDigletts
	call DiglettsCaveLoadDiglettSprites
	ld a, [wSpriteOptions2]
	bit BIT_MENU_ICON_SPRITES, a
	jr z, HideDigletts
	call IsPlayerNearDigletts
	jr c, HideDigletts
	call ShowDigletts
	SetEvent EVENT_DIGLETTS_VISIBLE
	SetFlag FLAG_MAP_HAS_OVERWORLD_ANIMATION
	ret
	; visually load diglett spirte into VRAM
DiglettsCaveLoadDiglettSprites::
	; fully visible sprite
	ld hl, vNPCSprites tile $0C
	ld de, PartyMonSprites2 tile 50
	lb bc, BANK(PartyMonSprites2), 2
	call CopyVideoData
	ld hl, vNPCSprites tile $0E
	ld de, PartyMonSprites2 tile 54
	lb bc, BANK(PartyMonSprites2), 2
	call CopyVideoData
	; half visible sprite
	ld de, DiglettDiggingSprite tile 4
	ld hl, vNPCSprites tile $10
	lb bc, BANK(DiglettDiggingSprite), 4
	call CopyVideoData
	; gone sprite
	ld de, DiglettDiggingSprite tile 14
	ld hl, vNPCSprites tile $16
	lb bc, BANK(DiglettDiggingSprite), 2
	call CopyVideoData
	ld de, NothingSprite
	ld hl, vNPCSprites tile $14
	lb bc, BANK(NothingSprite), 2
	call CopyVideoData

HideDigletts:
	ResetEvent EVENT_DIGLETTS_VISIBLE
	ld a, HS_DIGLETTS_CAVE_DIGLETT1
	call DiglettsCaveHideExtraObjectEntry
	ld a, HS_DIGLETTS_CAVE_DIGLETT2
	call DiglettsCaveHideExtraObjectEntry
	ld a, HS_DIGLETTS_CAVE_DIGLETT3
	call DiglettsCaveHideExtraObjectEntry
	ld a, HS_DIGLETTS_CAVE_DIGLETT4
	; fall through
DiglettsCaveHideExtraObjectEntry:
	ld [wMissableObjectIndex], a
	predef_jump HideExtraObject

ShowDigletts:
	ld a, HS_DIGLETTS_CAVE_DIGLETT1
	call DiglettsCaveShowExtraObjectEntry
	ld a, HS_DIGLETTS_CAVE_DIGLETT2
	call DiglettsCaveShowExtraObjectEntry
	ld a, HS_DIGLETTS_CAVE_DIGLETT3
	call DiglettsCaveShowExtraObjectEntry
	ld a, HS_DIGLETTS_CAVE_DIGLETT4
	; fall through
DiglettsCaveShowExtraObjectEntry:
	ld [wMissableObjectIndex], a
	predef_jump ShowExtraObject

IsPlayerNearDigletts:
	ld de, Diglett1Range
	callfar FarArePlayerCoordsInRange
	ret c
	ld de, Diglett2Range
	callfar FarArePlayerCoordsInRange
	ret c
	ld de, Diglett3Range
	callfar FarArePlayerCoordsInRange
	ret c
	ld de, Diglett4Range
	jpfar FarArePlayerCoordsInRange

ProximityDigletts2::
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	ret nz
	ld a, [wSpriteOptions2]
	bit BIT_MENU_ICON_SPRITES, a
	ret z
	CheckEvent EVENT_DIGLETTS_VISIBLE
	jr nz, .visible
.hidden
	; check if they're currently animating
	ld a, [wOverworldAnimationCounter]
	and a
	ret nz
	call IsPlayerNearDigletts
	ret c
	jr .incOverworldCounter
.visible
	; check if they're currently animating
	ld a, [wOverworldAnimationCounter]
	and a
	ret nz
	call IsPlayerNearDigletts
	ret nc
	; start the animation
.incOverworldCounter
	ld hl, wOverworldAnimationCounter
	inc [hl]
	ret

DiglettsCaveDiglettAnimation::
	ld a, [wSpriteOptions2]
	bit BIT_MENU_ICON_SPRITES, a
	ret z
	ld a, [wOverworldAnimationCounter]
	and a
	ret z
	CheckEvent EVENT_DIGLETTS_VISIBLE
	ld a, [wOverworldAnimationCounter]
	jr nz, .visibleAnimating
.hiddenAnimating
	; start the animation
	cp 1
	jr z, .showDigletts
	cp 3 ; is it frame 3?
	ld hl, SetSpriteFacingUp
	jr z, SetDiglettFacings
	cp 5 ; is it frame 5?
	jr z, .endHiddenToVisible
	jr DiglettsCaveIncOverworldCounter
.endHiddenToVisible
	ld hl, SetSpriteFacingDown
	call SetDiglettFacings
	SetEvent EVENT_DIGLETTS_VISIBLE
	xor a
	ld [wOverworldAnimationCounter], a
	ret
.showDigletts
	call ShowDigletts
	ld hl, SetSpriteFacingLeft
	jp SetDiglettFacings
.visibleAnimating
	cp 5
	jr z, .hideDigletts
	cp 1
	ld hl, SetSpriteFacingUp
	jr z, SetDiglettFacings
	cp 3 ; is it frame 3?
	ld hl, SetSpriteFacingLeft
	jr z, SetDiglettFacings
	jr DiglettsCaveIncOverworldCounter
.hideDigletts
	xor a
	ld [wOverworldAnimationCounter], a
	jp HideDigletts

; hl = which facing func
SetDiglettFacings:
	ld a, DIGLETTS_CAVE_DIGLETT1
	push hl
	call hl_caller
	pop hl
	ld a, DIGLETTS_CAVE_DIGLETT2
	push hl
	call hl_caller
	pop hl
	ld a, DIGLETTS_CAVE_DIGLETT3
	push hl
	call hl_caller
	pop hl
	ld a, DIGLETTS_CAVE_DIGLETT4
	call hl_caller
	call UpdateSprites
DiglettsCaveIncOverworldCounter:
	ld hl, wOverworldAnimationCounter
	inc [hl]
	ret

DiglettsCaveDiglettText:
	text_asm
	ld a, DIGLETT
	call PlayCry
	rst TextScriptEnd