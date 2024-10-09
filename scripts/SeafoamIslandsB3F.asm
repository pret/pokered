SeafoamIslandsB3F_Script:
	call EnableAutoTextBoxDrawing
	call SeafoamIslandsB3FOnMapLoad
	ld hl, wMiscFlags
	bit BIT_PUSHED_BOULDER, [hl]
	res BIT_PUSHED_BOULDER, [hl]
	jr z, .noBoulderWasPushed
	ld hl, Seafoam4HolesCoords
	call CheckBoulderCoords
	ret nc
	EventFlagAddress hl, EVENT_SEAFOAM4_BOULDER1_DOWN_HOLE
	ld a, [wCoordIndex]
	cp $1
	jr nz, .boulder2FellDownHole
	SetEventReuseHL EVENT_SEAFOAM4_BOULDER1_DOWN_HOLE
	ld a, HS_SEAFOAM_ISLANDS_B3F_BOULDER_1
	ld [wObjectToHide], a
	ld a, HS_SEAFOAM_ISLANDS_B4F_BOULDER_1
	ld [wObjectToShow], a
	jr .hideAndShowBoulderObjects
.boulder2FellDownHole
	SetEventAfterBranchReuseHL EVENT_SEAFOAM4_BOULDER2_DOWN_HOLE, EVENT_SEAFOAM4_BOULDER1_DOWN_HOLE
	ld a, HS_SEAFOAM_ISLANDS_B3F_BOULDER_2
	ld [wObjectToHide], a
	ld a, HS_SEAFOAM_ISLANDS_B4F_BOULDER_2
	ld [wObjectToShow], a
.hideAndShowBoulderObjects
	ld a, [wObjectToHide]
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, [wObjectToShow]
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld d, 1
	callfar BoulderHoleDropEffect
	jr .runCurrentMapScript
.noBoulderWasPushed
	ld a, SEAFOAM_ISLANDS_B4F
	ld [wDungeonWarpDestinationMap], a
	ld hl, Seafoam4HolesCoords
	call IsPlayerOnDungeonWarp
	ld a, [wStatusFlags6]
	bit BIT_DUNGEON_WARP, a
	ret nz
.runCurrentMapScript
	ld hl, SeafoamIslandsB3F_ScriptPointers
	ld a, [wSeafoamIslandsB3FCurScript]
	jp CallFunctionInTable

SeafoamIslandsB3FOnMapLoad::
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	; script constants were changed from older save file versions so potentially need to update them here to remove invalid values
	; TODO: remove later?
	ld hl, wSeafoamIslandsB3FCurScript
	ld a, [hl]
	cp SCRIPT_SEAFOAMISLANDSB3F_END
	jr c, .noIncorrectValue
	xor a
	ld [hl], a
.noIncorrectValue
	CheckBothEventsSet EVENT_SEAFOAM3_BOULDER1_DOWN_HOLE, EVENT_SEAFOAM3_BOULDER2_DOWN_HOLE
	ret nz
	ld de, SeafoamB3FCurrentWestVerticalReplacements
	ld a, $76
	ld [wNewTileBlockID], a
	jpfar ReplaceMultipleTileBlockLineVerticalWithOneBlock

Seafoam4HolesCoords:
	dbmapcoord  3, 16
	dbmapcoord  6, 16
	db -1 ; end

SeafoamIslandsB3F_ScriptPointers:
	def_script_pointers
	dw_const SeafoamIslandsB3FDefaultScript,       SCRIPT_SEAFOAMISLANDSB3F_DEFAULT
	dw_const SeafoamIslandsB3FObjectMoving1Script, SCRIPT_SEAFOAMISLANDSB3F_OBJECT_MOVING1
	DEF SCRIPT_SEAFOAMISLANDSB3F_END EQU const_value

SeafoamIslandsB3FDefaultScript:
	CheckBothEventsSet EVENT_SEAFOAM3_BOULDER1_DOWN_HOLE, EVENT_SEAFOAM3_BOULDER2_DOWN_HOLE
	ret z
	call SeafoamIslandsCurrents
	ret nc
	ld hl, wStatusFlags7
	set BIT_FORCED_WARP, [hl]
	ld a, SCRIPT_SEAFOAMISLANDSB3F_OBJECT_MOVING1
	ld [wSeafoamIslandsB3FCurScript], a
	ret

SeafoamIslandsCurrents:
	lda_coord 8, 9 ; tile below player
	cp $30
	ld b, D_UP
	jr z, .forceInput
	cp $3B
	ld b, D_RIGHT
	jr z, .forceInput
	cp $42
	ld b, D_DOWN
	jr z, .forceInput
	and a
	ret
.forceInput
	ld a, b
	ld hl, wSimulatedJoypadStatesEnd
	ld [hli], a
	ld [hl], -1
	ld a, 1
	ld [wSimulatedJoypadStatesIndex], a
	SetFlag FLAG_FAST_AUTO_MOVEMENT
	call StartSimulatingJoypadStates
	scf
	ret

SeafoamIslandsB3FObjectMoving1Script:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld a, SCRIPT_SEAFOAMISLANDSB3F_DEFAULT
	ld [wSeafoamIslandsB3FCurScript], a
	ret

SeafoamIslandsB3F_TextPointers:
    def_text_pointers
	dw_const BoulderText, TEXT_SEAFOAMISLANDSB3F_BOULDER1
	dw_const BoulderText, TEXT_SEAFOAMISLANDSB3F_BOULDER2
	dw_const BoulderText, TEXT_SEAFOAMISLANDSB3F_BOULDER3
	dw_const BoulderText, TEXT_SEAFOAMISLANDSB3F_BOULDER4
	dw_const BoulderBlockingWaterB3F, TEXT_SEAFOAMISLANDSB3F_BOULDER5
	dw_const BoulderBlockingWaterB3F, TEXT_SEAFOAMISLANDSB3F_BOULDER6
	dw_const PickUpFossilText, TEXT_SEAFOAMISLANDSB3F_DOME_FOSSIL
	dw_const PickUpFossilText, TEXT_SEAFOAMISLANDSB3F_HELIX_FOSSIL

PickUpFossilText:
	text_asm
	SetEvent EVENT_SEAFOAM_FOUND_OTHER_FOSSIL
	predef PickUpItem
	rst TextScriptEnd

BoulderBlockingWaterB3F:
	text_far _BoulderBlockingCurrent
	text_end
