DrawBadges:
; Draw 4x2 gym leader faces, with the faces replaced by
; badges if they are owned. Used in the player status screen.

; In Japanese versions, names are displayed above faces.
; Instead of removing relevant code, the name graphics were erased.

; Tile ids for face/badge graphics.
	ld de, wBadgeOrFaceTiles
	ld hl, .faceBadgeTiles
	ld bc, NUM_BADGES
	call CopyData

; Booleans for each badge.
	ld hl, wTempObtainedBadgesBooleans
	ld bc, NUM_BADGES
	xor a
	call FillMemory

; Alter these based on owned badges.
	ld de, wTempObtainedBadgesBooleans
	ld hl, wBadgeOrFaceTiles
	ld a, [wObtainedBadges]
	ld b, a
	ld c, NUM_BADGES
.checkBadge
	srl b
	jr nc, .nextBadge
	ld a, [hl]
	add 4 ; Badge graphics are after each face
	ld [hl], a
	ld a, 1
	ld [de], a
.nextBadge
	inc hl
	inc de
	dec c
	jr nz, .checkBadge

; Draw two rows of badges.
	ld hl, wBadgeNumberTile
	ld a, $d8 ; [1]
	ld [hli], a
	ld [hl], $60 ; First name

	hlcoord 2, 11
	ld de, wTempObtainedBadgesBooleans
	call .drawBadgeRow

	hlcoord 2, 14
	ld de, wTempObtainedBadgesBooleans + 4
	; fallthrough

.drawBadgeRow
; Draw 4 badges.

	ld c, 4
.drawBadge
	push de
	push hl

; Badge no.
	ld a, [wBadgeNumberTile]
	ld [hli], a
	inc a
	ld [wBadgeNumberTile], a

; Names aren't printed if the badge is owned.
	ld a, [de]
	and a
	ld a, [wBadgeNameTile]
	jr nz, .skipName
	call .placeTiles
	jr .placeBadge

.skipName
	inc a
	inc a
	inc hl

.placeBadge
	ld [wBadgeNameTile], a
	ld de, SCREEN_WIDTH - 1
	add hl, de
	ld a, [wBadgeOrFaceTiles]
	call .placeTiles
	add hl, de
	call .placeTiles

; Shift badge array back one byte.
	push bc
	ld hl, wBadgeOrFaceTiles + 1
	ld de, wBadgeOrFaceTiles
	ld bc, NUM_BADGES
	call CopyData
	pop bc

	pop hl
	ld de, 4
	add hl, de

	pop de
	inc de
	dec c
	jr nz, .drawBadge
	ret

.placeTiles
	ld [hli], a
	inc a
	ld [hl], a
	inc a
	ret

.faceBadgeTiles
	db $20, $28, $30, $38, $40, $48, $50, $58

GymLeaderFaceAndBadgeTileGraphics:
	INCBIN "gfx/trainer_card/badges.2bpp"
