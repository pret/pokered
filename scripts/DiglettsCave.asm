DiglettsCave_Script:
	call DiglettsCaveCheckStandingOnWarp
	jp EnableAutoTextBoxDrawing

DiglettsCave_TextPointers:
	def_text_pointers

DiglettsCaveCheckStandingOnWarp:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	jr z, .checkStandingOnWarp
	call .standingOnBottomWarp
	ret nz
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
	ld hl, wd72d
	set 3, [hl]
	ret
.standingOnBottomWarp
	ld a, [wXCoord]
	cp 23
	ret nz
	ld a, [wYCoord]
	cp 19
	ret