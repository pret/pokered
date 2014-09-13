SeafoamIslands3Script: ; 46451 (11:6451)
	call EnableAutoTextBoxDrawing
	ld hl, wFlags_0xcd60
	bit 7, [hl]
	res 7, [hl]
	jr z, .asm_4649e ; 0x4645b $41
	ld hl, Seafoam3HolesCoords
	call CheckBoulderCoords
	ret nc
	ld hl, wd880
	ld a, [wWhichTrade]
	cp $1
	jr nz, .asm_4647c ; 0x4646c $e
	set 0, [hl]
	ld a, $db
	ld [wd079], a
	ld a, $df
	ld [wd07a], a
	jr .asm_46488 ; 0x4647a $c
.asm_4647c
	set 1, [hl]
	ld a, $dc
	ld [wd079], a
	ld a, $e0
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
	jp Func_46981

Seafoam3HolesCoords: ; 464a9 (11:64a9)
	db $06,$13
	db $06,$16
	db $ff

SeafoamIslands3TextPointers: ; 464ae (11:64ae)
	dw BoulderText
	dw BoulderText
