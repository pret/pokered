SeafoamIslandsB3F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, wFlags_0xcd60
	bit 7, [hl]
	res 7, [hl]
	jr z, .asm_465dc
	ld hl, Seafoam4HolesCoords
	call CheckBoulderCoords
	ret nc
	EventFlagAddress hl, EVENT_SEAFOAM4_BOULDER1_DOWN_HOLE
	ld a, [wCoordIndex]
	cp $1
	jr nz, .asm_465b8
	SetEventReuseHL EVENT_SEAFOAM4_BOULDER1_DOWN_HOLE
	ld a, HS_SEAFOAM_ISLANDS_B3F_BOULDER_1
	ld [wObjectToHide], a
	ld a, HS_SEAFOAM_ISLANDS_B4F_BOULDER_1
	ld [wObjectToShow], a
	jr .asm_465c4
.asm_465b8
	SetEventAfterBranchReuseHL EVENT_SEAFOAM4_BOULDER2_DOWN_HOLE, EVENT_SEAFOAM4_BOULDER1_DOWN_HOLE
	ld a, HS_SEAFOAM_ISLANDS_B3F_BOULDER_2
	ld [wObjectToHide], a
	ld a, HS_SEAFOAM_ISLANDS_B4F_BOULDER_2
	ld [wObjectToShow], a
.asm_465c4
	ld a, [wObjectToHide]
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, [wObjectToShow]
	ld [wMissableObjectIndex], a
	predef ShowObject
	jr .asm_465ed
.asm_465dc
	ld a, SEAFOAM_ISLANDS_B4F
	ld [wDungeonWarpDestinationMap], a
	ld hl, Seafoam4HolesCoords
	call IsPlayerOnDungeonWarp
	ld a, [wd732]
	bit 4, a
	ret nz
.asm_465ed
	ld hl, SeafoamIslandsB3F_ScriptPointers
	ld a, [wSeafoamIslandsB3FCurScript]
	jp CallFunctionInTable

Seafoam4HolesCoords:
	dbmapcoord  3, 16
	dbmapcoord  6, 16
	db -1 ; end

SeafoamIslandsB3F_ScriptPointers:
	dw SeafoamIslands4Script0
	dw SeafoamIslands4Script1
	dw SeafoamIslands4Script2
	dw SeafoamIslands4Script3

SeafoamIslands4Script0:
	CheckBothEventsSet EVENT_SEAFOAM3_BOULDER1_DOWN_HOLE, EVENT_SEAFOAM3_BOULDER2_DOWN_HOLE
	ret z
	ld a, [wYCoord]
	cp 8
	ret nz
	ld a, [wXCoord]
	cp 15
	ret nz
	ld hl, wSimulatedJoypadStatesEnd
	ld de, RLEMovement46632
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld hl, wFlags_D733
	set 2, [hl]
	ld a, $1
	ld [wSeafoamIslandsB3FCurScript], a
	ret

RLEMovement46632:
	db D_DOWN, 6
	db D_RIGHT, 5
	db D_DOWN, 3
	db -1 ; end

SeafoamIslands4Script1:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld a, $0
	ld [wSeafoamIslandsB3FCurScript], a
	ret

SeafoamIslands4Script2:
	CheckBothEventsSet EVENT_SEAFOAM3_BOULDER1_DOWN_HOLE, EVENT_SEAFOAM3_BOULDER2_DOWN_HOLE
	ret z
	ld a, [wXCoord]
	cp 18
	jr z, .asm_4665e
	cp 19
	ld a, $0
	jr nz, .asm_4667b
	ld de, RLEData_4667f
	jr .asm_46661
.asm_4665e
	ld de, RLEData_46688
.asm_46661
	ld hl, wSimulatedJoypadStatesEnd
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	xor a
	ld [wSpritePlayerStateData2MovementByte1], a
	ld hl, wd730
	set 7, [hl]
	ld hl, wFlags_D733
	set 2, [hl]
	ld a, $3
.asm_4667b
	ld [wSeafoamIslandsB3FCurScript], a
	ret

RLEData_4667f:
	db D_DOWN, 6
	db D_RIGHT, 2
	db D_DOWN, 4
	db D_LEFT, 1
	db -1 ; end

RLEData_46688:
	db D_DOWN, 6
	db D_RIGHT, 2
	db D_DOWN, 4
	db -1 ; end

SeafoamIslands4Script3:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld a, $0
	ld [wSeafoamIslandsB3FCurScript], a
	ret

SeafoamIslandsB3F_TextPointers:
	dw BoulderText
	dw BoulderText
	dw BoulderText
	dw BoulderText
	dw BoulderText
	dw BoulderText
