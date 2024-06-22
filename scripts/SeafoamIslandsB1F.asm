SeafoamIslandsB1F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, wMiscFlags
	bit BIT_PUSHED_BOULDER, [hl]
	res BIT_PUSHED_BOULDER, [hl]
	jr z, .noBoulderWasPushed
	ld hl, Seafoam2HolesCoords
	call CheckBoulderCoords
	ret nc
	EventFlagAddress hl, EVENT_SEAFOAM2_BOULDER1_DOWN_HOLE
	ld a, [wCoordIndex]
	cp $1
	jr nz, .boulder2FellDownHole
	SetEventReuseHL EVENT_SEAFOAM2_BOULDER1_DOWN_HOLE
	ld a, HS_SEAFOAM_ISLANDS_B1F_BOULDER_1
	ld [wObjectToHide], a
	ld a, HS_SEAFOAM_ISLANDS_B2F_BOULDER_1
	ld [wObjectToShow], a
	jr .hideAndShowBoulderObjects
.boulder2FellDownHole
	SetEventAfterBranchReuseHL EVENT_SEAFOAM2_BOULDER2_DOWN_HOLE, EVENT_SEAFOAM2_BOULDER1_DOWN_HOLE
	ld a, HS_SEAFOAM_ISLANDS_B1F_BOULDER_2
	ld [wObjectToHide], a
	ld a, HS_SEAFOAM_ISLANDS_B2F_BOULDER_2
	ld [wObjectToShow], a
.hideAndShowBoulderObjects
	ld a, [wObjectToHide]
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, [wObjectToShow]
	ld [wMissableObjectIndex], a
	predef_jump ShowObject
.noBoulderWasPushed
	ld a, SEAFOAM_ISLANDS_B2F
	ld [wDungeonWarpDestinationMap], a
	ld hl, Seafoam2HolesCoords
	jp IsPlayerOnDungeonWarp

Seafoam2HolesCoords:
	dbmapcoord 18,  6
	dbmapcoord 23,  6
	db -1 ; end

SeafoamIslandsB1F_TextPointers:
	def_text_pointers
	dw_const BoulderText, TEXT_SEAFOAMISLANDSB1F_BOULDER1
	dw_const BoulderText, TEXT_SEAFOAMISLANDSB1F_BOULDER2
