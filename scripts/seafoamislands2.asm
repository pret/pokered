SeafoamIslands2Script:
	call EnableAutoTextBoxDrawing
	ld hl, wFlags_0xcd60
	bit 7, [hl]
	res 7, [hl]
	jr z, .asm_46362
	ld hl, Seafoam2HolesCoords
	call CheckBoulderCoords
	ret nc
	EventFlagAddress hl, EVENT_SEAFOAM2_BOULDER1_DOWN_HOLE
	ld a, [wCoordIndex]
	cp $1
	jr nz, .asm_46340
	SetEventReuseHL EVENT_SEAFOAM2_BOULDER1_DOWN_HOLE
	ld a, HS_SEAFOAM_ISLANDS_2_BOULDER_1
	ld [wObjectToHide], a
	ld a, HS_SEAFOAM_ISLANDS_3_BOULDER_1
	ld [wObjectToShow], a
	jr .asm_4634c
.asm_46340
	SetEventAfterBranchReuseHL EVENT_SEAFOAM2_BOULDER2_DOWN_HOLE, EVENT_SEAFOAM2_BOULDER1_DOWN_HOLE
	ld a, HS_SEAFOAM_ISLANDS_2_BOULDER_2
	ld [wObjectToHide], a
	ld a, HS_SEAFOAM_ISLANDS_3_BOULDER_2
	ld [wObjectToShow], a
.asm_4634c
	ld a, [wObjectToHide]
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, [wObjectToShow]
	ld [wMissableObjectIndex], a
	predef_jump ShowObject
.asm_46362
	ld a, $a0
	ld [wDungeonWarpDestinationMap], a
	ld hl, Seafoam2HolesCoords
	jp IsPlayerOnDungeonWarp

Seafoam2HolesCoords:
	db $06,$12
	db $06,$17
	db $ff

SeafoamIslands2TextPointers:
	dw BoulderText
	dw BoulderText
