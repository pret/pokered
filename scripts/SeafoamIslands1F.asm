SeafoamIslands1F_Script:
	call EnableAutoTextBoxDrawing
	SetEvent EVENT_IN_SEAFOAM_ISLANDS
	ld hl, wFlags_0xcd60
	bit 7, [hl]
	res 7, [hl]
	jr z, .asm_4483b
	ld hl, Seafoam1HolesCoords
	call CheckBoulderCoords
	ret nc
	EventFlagAddress hl, EVENT_SEAFOAM1_BOULDER1_DOWN_HOLE
	ld a, [wCoordIndex]
	cp $1
	jr nz, .asm_44819
	SetEventReuseHL EVENT_SEAFOAM1_BOULDER1_DOWN_HOLE
	ld a, HS_SEAFOAM_ISLANDS_1F_BOULDER_1
	ld [wObjectToHide], a
	ld a, HS_SEAFOAM_ISLANDS_B1F_BOULDER_1
	ld [wObjectToShow], a
	jr .asm_44825
.asm_44819
	SetEventAfterBranchReuseHL EVENT_SEAFOAM1_BOULDER2_DOWN_HOLE, EVENT_SEAFOAM1_BOULDER1_DOWN_HOLE
	ld a, HS_SEAFOAM_ISLANDS_1F_BOULDER_2
	ld [wObjectToHide], a
	ld a, HS_SEAFOAM_ISLANDS_B1F_BOULDER_2
	ld [wObjectToShow], a
.asm_44825
	ld a, [wObjectToHide]
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, [wObjectToShow]
	ld [wMissableObjectIndex], a
	predef_jump ShowObject
.asm_4483b
	ld a, $9f
	ld [wDungeonWarpDestinationMap], a
	ld hl, Seafoam1HolesCoords
	jp IsPlayerOnDungeonWarp

Seafoam1HolesCoords:
	db $06,$11
	db $06,$18
	db $ff

SeafoamIslands1F_TextPointers:
	dw BoulderText
	dw BoulderText
