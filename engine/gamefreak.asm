LoadShootingStarGraphics:
	ld a, $f9
	ld [rOBP0], a
	ld a, $a4
	ld [rOBP1], a
	ld de, AnimationTileset2 + $30 ; star tile (top left quadrant)
	ld hl, vChars1 + $200
	lb bc, BANK(AnimationTileset2), $01
	call CopyVideoData
	ld de, AnimationTileset2 + $130 ; star tile (bottom left quadrant)
	ld hl, vChars1 + $210
	lb bc, BANK(AnimationTileset2), $01
	call CopyVideoData
	ld de, FallingStar
	ld hl, vChars1 + $220
	lb bc, BANK(FallingStar), (FallingStarEnd - FallingStar) / $10
	call CopyVideoData
	ld hl, GameFreakLogoOAMData
	ld de, wOAMBuffer + $60
	ld bc, GameFreakLogoOAMDataEnd - GameFreakLogoOAMData
	call CopyData
	ld hl, GameFreakShootingStarOAMData
	ld de, wOAMBuffer
	ld bc, GameFreakShootingStarOAMDataEnd - GameFreakShootingStarOAMData
	jp CopyData

AnimateShootingStar:
	call LoadShootingStarGraphics
	ld a, SFX_SHOOTING_STAR
	call PlaySound

; Move the big star down and left across the screen.
	ld hl, wOAMBuffer
	lb bc, $a0, $4
.bigStarLoop
	push hl
	push bc
.bigStarInnerLoop
	ld a, [hl] ; Y
	add 4
	ld [hli], a
	ld a, [hl] ; X
	add -4
	ld [hli], a
	inc hl
	inc hl
	dec c
	jr nz, .bigStarInnerLoop
	ld c, 1
	call CheckForUserInterruption
	pop bc
	pop hl
	ret c
	ld a, [hl]
	cp 80
	jr nz, .next
	jr .bigStarLoop
.next
	cp b
	jr nz, .bigStarLoop

; Clear big star OAM.
	ld hl, wOAMBuffer
	ld c, 4
	ld de, 4
.clearOAMLoop
	ld [hl], 160
	add hl, de
	dec c
	jr nz, .clearOAMLoop

; Make Gamefreak logo flash.
	ld b, 3
.flashLogoLoop
	ld hl, rOBP0
	rrc [hl]
	rrc [hl]
	ld c, 10
	call CheckForUserInterruption
	ret c
	dec b
	jr nz, .flashLogoLoop

; Copy 24 instances of the small stars OAM data.
; Note that their coordinates put them off-screen.
	ld de, wOAMBuffer
	ld a, 24
.initSmallStarsOAMLoop
	push af
	ld hl, SmallStarsOAM
	ld bc, SmallStarsOAMEnd - SmallStarsOAM
	call CopyData
	pop af
	dec a
	jr nz, .initSmallStarsOAMLoop

; Animate the small stars falling from the Gamefreak logo.
	xor a
	ld [wMoveDownSmallStarsOAMCount], a
	ld hl, SmallStarsWaveCoordsPointerTable
	ld c, 6
.smallStarsLoop
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push bc
	push hl
	ld hl, wOAMBuffer + $50
	ld c, 4
.smallStarsInnerLoop ; introduce new wave of 4 small stars OAM entries
	ld a, [de]
	cp $ff
	jr z, .next2
	ld [hli], a ; Y
	inc de
	ld a, [de]
	ld [hli], a ; X
	inc de
	inc hl
	inc hl
	dec c
	jr nz, .smallStarsInnerLoop
	ld a, [wMoveDownSmallStarsOAMCount]
	cp 24
	jr z, .next2
	add 6 ; should be 4, but the extra 2 aren't visible on screen
	ld [wMoveDownSmallStarsOAMCount], a
.next2
	call MoveDownSmallStars
	push af

; shift the existing OAM entries down to make room for the next wave
	ld hl, wOAMBuffer + $10
	ld de, wOAMBuffer
	ld bc, $50
	call CopyData

	pop af
	pop hl
	pop bc
	ret c
	dec c
	jr nz, .smallStarsLoop
	and a
	ret

SmallStarsOAM:
	db $00,$00,$A2,$90
SmallStarsOAMEnd:

SmallStarsWaveCoordsPointerTable:
	dw SmallStarsWave1Coords
	dw SmallStarsWave2Coords
	dw SmallStarsWave3Coords
	dw SmallStarsWave4Coords
	dw SmallStarsEmptyWave
	dw SmallStarsEmptyWave

; The stars that fall from the Gamefreak logo come in 4 waves of 4 OAM entries.
; These arrays contain the Y and X coordinates of each OAM entry.

SmallStarsWave1Coords:
	db $68,$30
	db $68,$40
	db $68,$58
	db $68,$78

SmallStarsWave2Coords:
	db $68,$38
	db $68,$48
	db $68,$60
	db $68,$70

SmallStarsWave3Coords:
	db $68,$34
	db $68,$4C
	db $68,$54
	db $68,$64

SmallStarsWave4Coords:
	db $68,$3C
	db $68,$5C
	db $68,$6C
	db $68,$74

SmallStarsEmptyWave:
	db $FF

MoveDownSmallStars:
	ld b, 8
.loop
	ld hl, wOAMBuffer + $5c
	ld a, [wMoveDownSmallStarsOAMCount]
	ld de, -4
	ld c, a
.innerLoop
	inc [hl] ; Y
	add hl, de
	dec c
	jr nz, .innerLoop
; Toggle the palette so that the lower star in the small stars tile blinks in
; and out.
	ld a, [rOBP1]
	xor %10100000
	ld [rOBP1], a

	ld c, 3
	call CheckForUserInterruption
	ret c
	dec b
	jr nz, .loop
	ret

GameFreakLogoOAMData:
	db $48,$50,$8D,$00
	db $48,$58,$8E,$00
	db $50,$50,$8F,$00
	db $50,$58,$90,$00
	db $58,$50,$91,$00
	db $58,$58,$92,$00
	db $60,$30,$80,$00
	db $60,$38,$81,$00
	db $60,$40,$82,$00
	db $60,$48,$83,$00
	db $60,$50,$93,$00
	db $60,$58,$84,$00
	db $60,$60,$85,$00
	db $60,$68,$83,$00
	db $60,$70,$81,$00
	db $60,$78,$86,$00
GameFreakLogoOAMDataEnd:

GameFreakShootingStarOAMData:
	db $00,$A0,$A0,$10
	db $00,$A8,$A0,$30
	db $08,$A0,$A1,$10
	db $08,$A8,$A1,$30
GameFreakShootingStarOAMDataEnd:

FallingStar:
	INCBIN "gfx/falling_star.2bpp"
FallingStarEnd:
