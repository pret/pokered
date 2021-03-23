SeafoamIslandsB2F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, wFlags_0xcd60
	bit 7, [hl]
	res 7, [hl]
	jr z, .asm_4649e
	ld hl, Seafoam3HolesCoords
	call CheckBoulderCoords
	ret nc
	EventFlagAddress hl, EVENT_SEAFOAM3_BOULDER1_DOWN_HOLE
	ld a, [wCoordIndex]
	cp $1
	jr nz, .asm_4647c
	SetEventReuseHL EVENT_SEAFOAM3_BOULDER1_DOWN_HOLE
	ld a, HS_SEAFOAM_ISLANDS_B2F_BOULDER_1
	ld [wObjectToHide], a
	ld a, HS_SEAFOAM_ISLANDS_B3F_BOULDER_3
	ld [wObjectToShow], a
	jr .asm_46488
.asm_4647c
	SetEventAfterBranchReuseHL EVENT_SEAFOAM3_BOULDER2_DOWN_HOLE, EVENT_SEAFOAM3_BOULDER1_DOWN_HOLE
	ld a, HS_SEAFOAM_ISLANDS_B2F_BOULDER_2
	ld [wObjectToHide], a
	ld a, HS_SEAFOAM_ISLANDS_B3F_BOULDER_4
	ld [wObjectToShow], a
.asm_46488
	ld a, [wObjectToHide]
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, [wObjectToShow]
	ld [wMissableObjectIndex], a
	predef_jump ShowObject
.asm_4649e
	ld a, SEAFOAM_ISLANDS_B3F
	ld [wDungeonWarpDestinationMap], a
	ld hl, Seafoam3HolesCoords
	jp IsPlayerOnDungeonWarp

Seafoam3HolesCoords:
	dbmapcoord 19,  6
	dbmapcoord 22,  6
	db -1 ; end

SeafoamIslandsB2F_TextPointers:
	dw BoulderText
	dw BoulderText
