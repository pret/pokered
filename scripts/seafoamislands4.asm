SeafoamIslands4Script: ; 4658d (11:658d)
	call EnableAutoTextBoxDrawing
	ld hl, wFlags_0xcd60
	bit 7, [hl]
	res 7, [hl]
	jr z, .asm_465dc
	ld hl, Seafoam4HolesCoords
	call CheckBoulderCoords
	ret nc
	ld hl, wd881
	ld a, [wCoordIndex]
	cp $1
	jr nz, .asm_465b8
	set 0, [hl]
	ld a, HS_SEAFOAM_ISLANDS_4_BOULDER_1
	ld [wd079], a
	ld a, HS_SEAFOAM_ISLANDS_5_BOULDER_1
	ld [wd07a], a
	jr .asm_465c4
.asm_465b8
	set 1, [hl]
	ld a, HS_SEAFOAM_ISLANDS_4_BOULDER_2
	ld [wd079], a
	ld a, HS_SEAFOAM_ISLANDS_5_BOULDER_2
	ld [wd07a], a
.asm_465c4
	ld a, [wd079]
	ld [wcc4d], a
	predef HideObject
	ld a, [wd07a]
	ld [wcc4d], a
	predef ShowObject
	jr .asm_465ed
.asm_465dc
	ld a, $a2
	ld [wDungeonWarpDestinationMap], a
	ld hl, Seafoam4HolesCoords
	call IsPlayerOnDungeonWarp
	ld a, [wd732]
	bit 4, a
	ret nz
.asm_465ed
	ld hl, SeafoamIslands4ScriptPointers
	ld a, [W_SEAFOAMISLANDS4CURSCRIPT]
	jp CallFunctionInTable

Seafoam4HolesCoords: ; 465f6 (11:65f6)
	db $10,$03
	db $10,$06
	db $ff

SeafoamIslands4ScriptPointers: ; 465fb (11:65fb)
	dw SeafoamIslands4Script0
	dw SeafoamIslands4Script1
	dw SeafoamIslands4Script2
	dw SeafoamIslands4Script3

SeafoamIslands4Script0: ; 46603 (11:6603)
	ld a, [wd880]
	and $3
	cp $3
	ret z
	ld a, [W_YCOORD]
	cp $8
	ret nz
	ld a, [W_XCOORD]
	cp $f
	ret nz
	ld hl, wSimulatedJoypadStatesEnd
	ld de, RLEMovement46632
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld hl, W_FLAGS_D733
	set 2, [hl]
	ld a, $1
	ld [W_SEAFOAMISLANDS4CURSCRIPT], a
	ret

RLEMovement46632: ; 46632 (11:6632)
	db D_DOWN,6
	db D_RIGHT,5
	db D_DOWN,3
	db $ff

SeafoamIslands4Script1: ; 46639 (11:6639)
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld a, $0
	ld [W_SEAFOAMISLANDS4CURSCRIPT], a
	ret

SeafoamIslands4Script2: ; 46644 (11:6644)
	ld a, [wd880]
	and $3
	cp $3
	ret z
	ld a, [W_XCOORD]
	cp $12
	jr z, .asm_4665e
	cp $13
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
	ld [wSpriteStateData2 + $06], a
	ld hl, wd730
	set 7, [hl]
	ld hl, W_FLAGS_D733
	set 2, [hl]
	ld a, $3
.asm_4667b
	ld [W_SEAFOAMISLANDS4CURSCRIPT], a
	ret

RLEData_4667f: ; 4667f (11:667f)
	db D_DOWN,$06
	db D_RIGHT,$02
	db D_DOWN,$04
	db D_LEFT,$01
	db $FF

RLEData_46688: ; 46688 (11:6688)
	db D_DOWN,$06
	db D_RIGHT,$02
	db D_DOWN,$04
	db $FF

SeafoamIslands4Script3: ; 4668f (11:668f)
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld a, $0
	ld [W_SEAFOAMISLANDS4CURSCRIPT], a
	ret

SeafoamIslands4TextPointers: ; 4669a (11:669a)
	dw BoulderText
	dw BoulderText
	dw BoulderText
	dw BoulderText
	dw BoulderText
	dw BoulderText
