SeafoamIslands3Script: ; 46451 (11:6451)
	call EnableAutoTextBoxDrawing
	ld hl, wFlags_0xcd60
	bit 7, [hl]
	res 7, [hl]
	jr z, .asm_4649e
	ld hl, Seafoam3HolesCoords
	call CheckBoulderCoords
	ret nc
	ld hl, wd880
	ld a, [wCoordIndex]
	cp $1
	jr nz, .asm_4647c
	set 0, [hl]
	ld a, HS_SEAFOAM_ISLANDS_3_BOULDER_1
	ld [wd079], a
	ld a, HS_SEAFOAM_ISLANDS_4_BOULDER_3
	ld [wd07a], a
	jr .asm_46488
.asm_4647c
	set 1, [hl]
	ld a, HS_SEAFOAM_ISLANDS_3_BOULDER_2
	ld [wd079], a
	ld a, HS_SEAFOAM_ISLANDS_4_BOULDER_4
	ld [wd07a], a
.asm_46488
	ld a, [wd079]
	ld [wcc4d], a
	predef HideObject
	ld a, [wd07a]
	ld [wcc4d], a
	predef_jump ShowObject
.asm_4649e
	ld a, $a1
	ld [wDungeonWarpDestinationMap], a
	ld hl, Seafoam3HolesCoords
	jp IsPlayerOnDungeonWarp

Seafoam3HolesCoords: ; 464a9 (11:64a9)
	db $06,$13
	db $06,$16
	db $ff

SeafoamIslands3TextPointers: ; 464ae (11:64ae)
	dw BoulderText
	dw BoulderText
