RestoreScreenTilesAndReloadTilePatterns::
	call ClearSprites
	ld a, $1
	ld [wUpdateSpritesEnabled], a
	call ReloadMapSpriteTilePatterns
	call LoadScreenTilesFromBuffer2
	call LoadTextBoxTilePatterns
	call RunDefaultPaletteCommand
	jr Delay3

GBPalWhiteOutWithDelay3::
	call GBPalWhiteOut

Delay3::
; The bg map is updated each frame in thirds.
; Wait three frames to let the bg map fully update.
	ld c, 3
	jp DelayFrames

GBPalNormal::
; Reset BGP and OBP0.
	ld a, %11100100 ; 3210
	ldh [rBGP], a
	ld a, %11010000 ; 3100
	ldh [rOBP0], a
	ret

GBPalWhiteOut::
; White out all palettes.
	xor a
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	ret

RunDefaultPaletteCommand::
	ld b, SET_PAL_DEFAULT
RunPaletteCommand::
	ld a, [wOnSGB]
	and a
	ret z
	predef_jump _RunPaletteCommand

GetHealthBarColor::
; Return at hl the palette of
; an HP bar e pixels long.
	ld a, e
	cp 27
	ld d, 0 ; green
	jr nc, .gotColor
	cp 10
	inc d ; yellow
	jr nc, .gotColor
	inc d ; red
.gotColor
	ld [hl], d
	ret
