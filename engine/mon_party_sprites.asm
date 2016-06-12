AnimatePartyMon_ForceSpeed1:
	xor a
	ld [wCurrentMenuItem], a
	ld b, a
	inc a
	jr GetAnimationSpeed

; wPartyMenuHPBarColors contains the party mon's health bar colors
; 0: green
; 1: yellow
; 2: red
AnimatePartyMon:
	ld hl, wPartyMenuHPBarColors
	ld a, [wCurrentMenuItem]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]

GetAnimationSpeed:
	ld c, a
	ld hl, PartyMonSpeeds
	add hl, bc
	ld a, [wOnSGB]
	xor $1
	add [hl]
	ld c, a
	add a
	ld b, a
	ld a, [wAnimCounter]
	and a
	jr z, .resetSprites
	cp c
	jr z, .animateSprite
.incTimer
	inc a
	cp b
	jr nz, .skipResetTimer
	xor a ; reset timer
.skipResetTimer
	ld [wAnimCounter], a
	jp DelayFrame
.resetSprites
	push bc
	ld hl, wMonPartySpritesSavedOAM
	ld de, wOAMBuffer
	ld bc, $60
	call CopyData
	pop bc
	xor a
	jr .incTimer
.animateSprite
	push bc
	ld hl, wOAMBuffer + $02 ; OAM tile id
	ld bc, $10
	ld a, [wCurrentMenuItem]
	call AddNTimes
	ld c, $40 ; amount to increase the tile id by
	ld a, [hl]
	cp $4 ; tile ID for SPRITE_BALL_M
	jr z, .editCoords
	cp $8 ; tile ID for SPRITE_HELIX
	jr nz, .editTileIDS
; SPRITE_BALL_M and SPRITE_HELIX only shake up and down
.editCoords
	dec hl
	dec hl ; dec hl to the OAM y coord
	ld c, $1 ; amount to increase the y coord by
; otherwise, load a second sprite frame
.editTileIDS
	ld b, $4
	ld de, $4
.loop
	ld a, [hl]
	add c
	ld [hl], a
	add hl, de
	dec b
	jr nz, .loop
	pop bc
	ld a, c
	jr .incTimer

; Party mon animations cycle between 2 frames.
; The members of the PartyMonSpeeds array specify the number of V-blanks
; that each frame lasts for green HP, yellow HP, and red HP in order.
; On the naming screen, the yellow HP speed is always used.
PartyMonSpeeds:
	db 5, 16, 32

LoadMonPartySpriteGfx:
; Load mon party sprite tile patterns into VRAM during V-blank.
	ld hl, MonPartySpritePointers
	ld a, $1c

LoadAnimSpriteGfx:
; Load animated sprite tile patterns into VRAM during V-blank. hl is the address
; of an array of structures that contain arguments for CopyVideoData and a is
; the number of structures in the array.
	ld bc, $0
.loop
	push af
	push bc
	push hl
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call CopyVideoData
	pop hl
	pop bc
	ld a, $6
	add c
	ld c, a
	pop af
	dec a
	jr nz, .loop
	ret

LoadMonPartySpriteGfxWithLCDDisabled:
; Load mon party sprite tile patterns into VRAM immediately by disabling the
; LCD.
	call DisableLCD
	ld hl, MonPartySpritePointers
	ld a, $1c
	ld bc, $0
.loop
	push af
	push bc
	push hl
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push de
	ld a, [hli]
	ld c, a
	swap c
	ld b, $0
	ld a, [hli]
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop hl
	call FarCopyData2
	pop hl
	pop bc
	ld a, $6
	add c
	ld c, a
	pop af
	dec a
	jr nz, .loop
	jp EnableLCD

MonPartySpritePointers:
	dw SlowbroSprite + $c0
	db $40 / $10 ; 40 bytes
	db BANK(SlowbroSprite)
	dw vSprites

	dw BallSprite
	db $80 / $10 ; $80 bytes
	db BANK(BallSprite)
	dw vSprites + $40

	dw ClefairySprite + $c0
	db $40 / $10 ; $40 bytes
	db BANK(ClefairySprite)
	dw vSprites + $c0

	dw BirdSprite + $c0
	db $40 / $10 ; $40 bytes
	db BANK(BirdSprite)
	dw vSprites + $100

	dw SeelSprite
	db $40 / $10 ; $40 bytes
	db BANK(SeelSprite)
	dw vSprites + $140

	dw MonPartySprites + $40
	db $10 / $10 ; $10 bytes
	db BANK(MonPartySprites)
	dw vSprites + $180

	dw MonPartySprites + $50
	db $10 / $10 ; $10 bytes
	db BANK(MonPartySprites)
	dw vSprites + $1a0

	dw MonPartySprites + $60
	db $10 / $10 ; $10 bytes
	db BANK(MonPartySprites)
	dw vSprites + $1c0

	dw MonPartySprites + $70
	db $10 / $10 ; $10 bytes
	db BANK(MonPartySprites)
	dw vSprites + $1e0

	dw MonPartySprites + $80
	db $10 / $10 ; $10 bytes
	db BANK(MonPartySprites)
	dw vSprites + $200

	dw MonPartySprites + $90
	db $10 / $10 ; $10 bytes
	db BANK(MonPartySprites)
	dw vSprites + $220

	dw MonPartySprites + $A0
	db $10 / $10 ; $10 bytes
	db BANK(MonPartySprites)
	dw vSprites + $240

	dw MonPartySprites + $B0
	db $10 / $10 ; $10 bytes
	db BANK(MonPartySprites)
	dw vSprites + $260

	dw MonPartySprites + $100
	db $40 / $10 ; $40 bytes
	db BANK(MonPartySprites)
	dw vSprites + $380

	dw SlowbroSprite
	db $40 / $10 ; $40 bytes
	db BANK(SlowbroSprite)
	dw vSprites + $400

	dw BallSprite
	db $80 / $10 ; $80 bytes
	db BANK(BallSprite)
	dw vSprites + $440

	dw ClefairySprite
	db $40 / $10 ; $40 bytes
	db BANK(ClefairySprite)
	dw vSprites + $4c0

	dw BirdSprite
	db $40 / $10 ; $40 bytes
	db BANK(BirdSprite)
	dw vSprites + $500

	dw SeelSprite + $C0
	db $40 / $10 ; $40 bytes
	db BANK(SeelSprite)
	dw vSprites + $540

	dw MonPartySprites
	db $10 / $10 ; $10 bytes
	db BANK(MonPartySprites)
	dw vSprites + $580

	dw MonPartySprites + $10
	db $10 / $10 ; $10 bytes
	db BANK(MonPartySprites)
	dw vSprites + $5a0

	dw MonPartySprites + $20
	db $10 / $10 ; $10 bytes
	db BANK(MonPartySprites)
	dw vSprites + $5c0

	dw MonPartySprites + $30
	db $10 / $10 ; $10 bytes
	db BANK(MonPartySprites)
	dw vSprites + $5E0

	dw MonPartySprites + $C0
	db $10 / $10 ; $10 bytes
	db BANK(MonPartySprites)
	dw vSprites + $600

	dw MonPartySprites + $D0
	db $10 / $10 ; $10 bytes
	db BANK(MonPartySprites)
	dw vSprites + $620

	dw MonPartySprites + $E0
	db $10 / $10 ; $10 bytes
	db BANK(MonPartySprites)
	dw vSprites + $640

	dw MonPartySprites + $F0
	db $10 / $10 ; $10 bytes
	db BANK(MonPartySprites)
	dw vSprites + $660

	dw MonPartySprites + $140
	db $40 / $10 ; $40 bytes
	db BANK(MonPartySprites)
	dw vSprites + $780

WriteMonPartySpriteOAMByPartyIndex:
; Write OAM blocks for the party mon in [hPartyMonIndex].
	push hl
	push de
	push bc
	ld a, [hPartyMonIndex]
	ld hl, wPartySpecies
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	call GetPartyMonSpriteID
	ld [wOAMBaseTile], a
	call WriteMonPartySpriteOAM
	pop bc
	pop de
	pop hl
	ret

WriteMonPartySpriteOAMBySpecies:
; Write OAM blocks for the party sprite of the species in
; [wMonPartySpriteSpecies].
	xor a
	ld [hPartyMonIndex], a
	ld a, [wMonPartySpriteSpecies]
	call GetPartyMonSpriteID
	ld [wOAMBaseTile], a
	jr WriteMonPartySpriteOAM

UnusedPartyMonSpriteFunction:
; This function is unused and doesn't appear to do anything useful. It looks
; like it may have been intended to load the tile patterns and OAM data for
; the mon party sprite associated with the species in [wcf91].
; However, its calculations are off and it loads garbage data.
	ld a, [wcf91]
	call GetPartyMonSpriteID
	push af
	ld hl, vSprites
	call .LoadTilePatterns
	pop af
	add $54
	ld hl, vSprites + $40
	call .LoadTilePatterns
	xor a
	ld [wMonPartySpriteSpecies], a
	jr WriteMonPartySpriteOAMBySpecies

.LoadTilePatterns
	push hl
	add a
	ld c, a
	ld b, 0
	ld hl, MonPartySpritePointers
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	pop hl
	jp CopyVideoData

WriteMonPartySpriteOAM:
; Write the OAM blocks for the first animation frame into the OAM buffer and
; make a copy at wMonPartySpritesSavedOAM.
	push af
	ld c, $10
	ld h, wOAMBuffer / $100
	ld a, [hPartyMonIndex]
	swap a
	ld l, a
	add $10
	ld b, a
	pop af
	cp SPRITE_HELIX << 2
	jr z, .helix
	call WriteSymmetricMonPartySpriteOAM
	jr .makeCopy
.helix
	call WriteAsymmetricMonPartySpriteOAM
; Make a copy of the OAM buffer with the first animation frame written so that
; we can flip back to it from the second frame by copying it back.
.makeCopy
	ld hl, wOAMBuffer
	ld de, wMonPartySpritesSavedOAM
	ld bc, $60
	jp CopyData

GetPartyMonSpriteID:
	ld [wd11e], a
	predef IndexToPokedex
	ld a, [wd11e]
	ld c, a
	dec a
	srl a
	ld hl, MonPartyData
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	bit 0, c
	jr nz, .skipSwap
	swap a ; use lower nybble if pokedex num is even
.skipSwap
	and $f0
	srl a
	srl a
	ret

INCLUDE "data/mon_party_sprites.asm"

MonPartySprites:
	INCBIN "gfx/mon_ow_sprites.2bpp"
