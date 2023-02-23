LoadShootingStarGraphics:
	ld a, $f9
	ldh [rOBP0], a
	ld a, $a4
	ldh [rOBP1], a
	call UpdateGBCPal_OBP0 ; shinpokerednote: gbcnote: gbc color code from yellow 
	call UpdateGBCPal_OBP1 ; shinpokerednote: gbcnote: gbc color code from yellow 
	ld de, MoveAnimationTiles1 tile 3 ; star tile (top left quadrant)
	ld hl, vChars1 tile $20
	lb bc, BANK(MoveAnimationTiles1), 1
	call CopyVideoData
	ld de, MoveAnimationTiles1 tile 19 ; star tile (bottom left quadrant)
	ld hl, vChars1 tile $21
	lb bc, BANK(MoveAnimationTiles1), 1
	call CopyVideoData
	ld de, FallingStar
	ld hl, vChars1 tile $22
	lb bc, BANK(FallingStar), (FallingStarEnd - FallingStar) / $10
	call CopyVideoData
	ld hl, GameFreakLogoOAMData
	ld de, wShadowOAMSprite24
	ld bc, GameFreakLogoOAMDataEnd - GameFreakLogoOAMData
	rst _CopyData
	ld hl, GameFreakShootingStarOAMData
	ld de, wShadowOAM
	ld bc, GameFreakShootingStarOAMDataEnd - GameFreakShootingStarOAMData
	jp CopyData

AnimateShootingStar:
	call LoadShootingStarGraphics
	ld a, SFX_SHOOTING_STAR
	rst _PlaySound

; Move the big star down and left across the screen.
	ld hl, wShadowOAM
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
	ld hl, wShadowOAM
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
	call UpdateGBCPal_OBP0 ; shinpokerednote: gbcnote: gbc color code from yellow 
	ld c, 10
	call CheckForUserInterruption
	ret c
	dec b
	jr nz, .flashLogoLoop

; Copy 24 instances of the small stars OAM data.
; Note that their coordinates put them off-screen.
	ld de, wShadowOAM
	ld a, 24
.initSmallStarsOAMLoop
	push af
	ld hl, SmallStarsOAM
	ld bc, SmallStarsOAMEnd - SmallStarsOAM
	rst _CopyData
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
	ld hl, wShadowOAMSprite20
	ld c, 4
.smallStarsInnerLoop ; introduce new wave of 4 small stars OAM entries
	ld a, [de]
	cp -1
	jr z, .next2
	ld [hli], a ; Y
	inc de
	ld a, [de]
	ld [hli], a ; X
	inc de
	inc hl
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; shinpokerednote: gbcnote: hl now points to OAM attribute byte for falling stars
;Need to get and set the palette data from the new coordinate arrays
	push bc
	ld a, [de]
	ld b,a
	ld a, [hl]
	and $f0
	or b
	ld [hl], a
	inc de
	pop bc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
	ld hl, wShadowOAMSprite04
	ld de, wShadowOAM
	ld bc, $50
	rst _CopyData

	pop af
	pop hl
	pop bc
	ret c
	dec c
	jr nz, .smallStarsLoop
	and a
	ret

SmallStarsOAM:
	dbsprite  0,  0,  0,  0, $A2, OAM_BEHIND_BG | OAM_OBP1
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

; shinpokerednote: gbcnote: these have been modified per Yellow version to have pal data for the GBC attribute bits

SmallStarsWave1Coords:
	db $68,$30
	db $05,$68
	db $40,$05
	db $68,$58
	db $04,$68
	db $78,$07

SmallStarsWave2Coords:
	db $68,$38
	db $05,$68
	db $48,$06
	db $68,$60
	db $04,$68
	db $70,$07

SmallStarsWave3Coords:
	db $68,$34
	db $05,$68
	db $4c,$06
	db $68,$54
	db $06,$68
	db $64,$07

SmallStarsWave4Coords:
	db $68,$3c
	db $05,$68
	db $5c,$04
	db $68,$6c
	db $07,$68
	db $74,$07

SmallStarsEmptyWave:
	db -1

MoveDownSmallStars:
	ld b, 8
.loop
	ld hl, wShadowOAMSprite23
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
	ldh a, [rOBP1]
	xor %10100000
	ldh [rOBP1], a
	call UpdateGBCPal_OBP1 ; shinpokerednote: gbcnote: gbc color code from yellow 

	ld c, 3
	call CheckForUserInterruption
	ret c
	dec b
	jr nz, .loop
	ret

GameFreakLogoOAMData:
	dbsprite 10,  9,  0,  0, $8d, 0
	dbsprite 11,  9,  0,  0, $8e, 0
	dbsprite 10, 10,  0,  0, $8f, 0
	dbsprite 11, 10,  0,  0, $90, 0
	dbsprite 10, 11,  0,  0, $91, 0
	dbsprite 11, 11,  0,  0, $92, 0
	dbsprite  6, 12,  0,  0, $80, 0
	dbsprite  7, 12,  0,  0, $81, 0
	dbsprite  8, 12,  0,  0, $82, 0
	dbsprite  9, 12,  0,  0, $83, 0
	dbsprite 10, 12,  0,  0, $93, 0
	dbsprite 11, 12,  0,  0, $84, 0
	dbsprite 12, 12,  0,  0, $85, 0
	dbsprite 13, 12,  0,  0, $83, 0
	dbsprite 14, 12,  0,  0, $81, 0
	dbsprite 15, 12,  0,  0, $86, 0
GameFreakLogoOAMDataEnd:

GameFreakShootingStarOAMData:	;shinpokerednote: gbcnote: changing the attribute to use palette 4 via GBC bits
;last column is byte 3 of OAM data; the attribute byte
	db $00,$A0,$A0,$14
	db $00,$A8,$A0,$34
	db $08,$A0,$A1,$14
	db $08,$A8,$A1,$34
GameFreakShootingStarOAMDataEnd:

FallingStar:
	INCBIN "gfx/splash/falling_star.2bpp"
FallingStarEnd:
