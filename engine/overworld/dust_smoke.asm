; PureRGBnote: MOVED: this file was moved to a different bank for space and references code in cut2 instead of the bank it used to be in.

AnimateBoulderDust::
	ld a, $1
	ld [wWhichAnimationOffsets], a ; select the boulder dust offsets
	ld a, [wUpdateSpritesEnabled]
	push af
	ld a, $ff
	ld [wUpdateSpritesEnabled], a
	ld a, %11100100
	ldh [rOBP1], a
	call UpdateGBCPal_OBP1 ; shinpokerednote: gbcnote: gbc color code from yellow 
	call LoadSmokeTileFourTimes
	farcall WriteCutOrBoulderDustAnimationOAMBlock
	ld c, 8 ; number of steps in animation
.loop
	push bc
	call GetMoveBoulderDustFunctionPointer
	ld bc, .returnAddress
	push bc
	ld c, 4
	jp hl
.returnAddress
	ldh a, [rOBP1]
	xor %01100100
	ldh [rOBP1], a
	call UpdateGBCPal_OBP1 ; shinpokerednote: gbcnote: gbc color code from yellow 
	call Delay3
	pop bc
	dec c
	jr nz, .loop
	pop af
	ld [wUpdateSpritesEnabled], a
	jp LoadPlayerSpriteGraphics

GetMoveBoulderDustFunctionPointer:
	ld a, [wSpritePlayerStateData1FacingDirection]
	ld hl, MoveBoulderDustFunctionPointerTable
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hli]
	ld [wCoordAdjustmentAmount], a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld hl, wShadowOAMSprite36
	ld d, $0
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ret

MACRO boulder_dust_adjust
	db \1, \2 ; coords
	dw \3 ; function
ENDM

MoveBoulderDustFunctionPointerTable:
	boulder_dust_adjust -1, 0, AdjustOAMBlockYPos3start ; down
	boulder_dust_adjust  1, 0, AdjustOAMBlockYPos3start ; up
	boulder_dust_adjust  1, 1, AdjustOAMBlockXPos3start ; left
	boulder_dust_adjust -1, 1, AdjustOAMBlockXPos3start ; right

LoadSmokeTileFourTimes::
	ld hl, vChars1 tile $7c
	ld c, 4
.loop
	push bc
	push hl
	call LoadSmokeTile
	pop hl
	ld bc, 1 tiles
	add hl, bc
	pop bc
	dec c
	jr nz, .loop
	ret

LoadSmokeTile:
	ld de, SSAnneSmokePuffTile
	lb bc, BANK(SSAnneSmokePuffTile), (SSAnneSmokePuffTileEnd - SSAnneSmokePuffTile) / $10
	jp CopyVideoData

SSAnneSmokePuffTile:
	INCBIN "gfx/overworld/smoke.2bpp"
SSAnneSmokePuffTileEnd:

; PureRGBnote: ADDED: the below function is an animation + sound effects that play when you push a boulder down a hole

BoulderHoleDropEffectDefault::
	ld d, 0
BoulderHoleDropEffect:: ; d = 1 prior to calling will cause a "splash" sound instead of a "crash sound" when the rock lands below
	push de
	ld hl, wChannelCommandPointers + CHAN8 * 2
	ld de, EndSound ; end the SFX_CUT of pushing the rock
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a
	ld a, SFX_TRADE_MACHINE ; sound of rock falling into hole
	rst _PlaySound
	call Delay3
	call WaitForSoundToFinish
	ld a, 251
	ld [wFrequencyModifier], a
	xor a
	ld [wTempoModifier], a
	ld a, SFX_CRY_16 ; sound of rock landing on a lower level
	rst _PlaySound
	pop de
	ld a, d
	and a
	jr z, .noSplash
	ld c, 10
	rst _DelayFrames
	ld hl, wChannelCommandPointers + CHAN5 * 2
	ld de, EndSound ; end the SFX_CRY_16 of rock crashing
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	inc hl
	inc hl
	ld a, e
	ld [hli], a
	ld [hl], d
	call WaitForSoundToFinish
	; play a splash sound
	ld a, 203
	ld [wFrequencyModifier], a
	ld a, 255
	ld [wTempoModifier], a
	ld a, SFX_CRY_16
	rst _PlaySound
	ld hl, wChannelCommandPointers + CHAN6 * 2
	ld de, EndSound ; end channel 6 of the splash sound to make it sound like more of a splash
	ld a, e
	ld [hli], a
	ld [hl], d
.noSplash
	ldh a, [hSCY] ; animation of the screen shaking a bit when it lands
	ld d, a
	ld e, $1
	ld b, 10
.shakeLoop ; scroll the BG up and down
	ld a, e
	xor $fe
	ld e, a
	add d
	ldh [hSCY], a
	ld c, 2
	rst _DelayFrames
	dec b
	jr nz, .shakeLoop
	ld a, d
	ldh [hSCY], a
	ret