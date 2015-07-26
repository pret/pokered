SeafoamIslands5Script: ; 46799 (11:6799)
	call EnableAutoTextBoxDrawing
	ld a, [W_SEAFOAMISLANDS5CURSCRIPT]
	ld hl, SeafoamIslands5ScriptPointers
	jp CallFunctionInTable

SeafoamIslands5Script_467a5: ; 467a5 (11:67a5)
	xor a
	ld [W_SEAFOAMISLANDS5CURSCRIPT], a
	ld [wJoyIgnore], a
	ret

SeafoamIslands5ScriptPointers: ; 467ad (11:67ad)
	dw SeafoamIslands5Script0
	dw SeafoamIslands5Script1
	dw SeafoamIslands5Script2
	dw SeafoamIslands5Script3
	dw SeafoamIslands5Script4

SeafoamIslands5Script4: ; 467b7 (11:67b7)
	ld a, [W_ISINBATTLE]
	cp $ff
	jr z, SeafoamIslands5Script_467a5
	call EndTrainerBattle
	ld a, $0
	ld [W_SEAFOAMISLANDS5CURSCRIPT], a
	ret

SeafoamIslands5Script0: ; 467c7 (11:67c7)
	CheckBothEventsSet EVENT_SEAFOAM3_BOULDER1_DOWN_HOLE, EVENT_SEAFOAM3_BOULDER2_DOWN_HOLE
	ret z
	ld hl, CoordsData_467fe
	call ArePlayerCoordsInArray
	ret nc
	ld a, [wCoordIndex]
	cp $3
	jr nc, .asm_467e6
	ld a, NPC_MOVEMENT_UP
	ld [wSimulatedJoypadStatesEnd + 1], a
	ld a, 2
	jr .asm_467e8
.asm_467e6
	ld a, 1
.asm_467e8
	ld [wSimulatedJoypadStatesIndex], a
	ld a, D_UP
	ld [wSimulatedJoypadStatesEnd], a
	call StartSimulatingJoypadStates
	ld hl, W_FLAGS_D733
	res 2, [hl]
	ld a, $1
	ld [W_SEAFOAMISLANDS5CURSCRIPT], a
	ret

CoordsData_467fe: ; 467fe (11:67fe)
	db $11,$14
	db $11,$15
	db $10,$14
	db $10,$15
	db $FF

SeafoamIslands5Script1: ; 46807 (11:6807)
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, $0
	ld [W_SEAFOAMISLANDS5CURSCRIPT], a
	ret

SeafoamIslands5Script2: ; 46816 (11:6816)
	CheckBothEventsSet EVENT_SEAFOAM4_BOULDER1_DOWN_HOLE, EVENT_SEAFOAM4_BOULDER2_DOWN_HOLE
	ld a, $0
	jr z, .asm_46849
	ld hl, CoordsData_4684d
	call ArePlayerCoordsInArray
	ld a, $0
	jr nc, .asm_46849
	ld a, [wCoordIndex]
	cp $1
	jr nz, .asm_46837
	ld de, RLEMovementData_46859
	jr .asm_4683a
.asm_46837
	ld de, RLEMovementData_46852
.asm_4683a
	ld hl, wSimulatedJoypadStatesEnd
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, $3
.asm_46849
	ld [W_SEAFOAMISLANDS5CURSCRIPT], a
	ret

CoordsData_4684d: ; 4684d (11:684d)
	db $0E,$04
	db $0E,$05
	db $FF

RLEMovementData_46852: ; 46852 (11:6852)
	db D_UP,$03
	db D_RIGHT,$02
	db D_UP,$01
	db $FF

RLEMovementData_46859: ; 46859 (11:6859)
	db D_UP,$03
	db D_RIGHT,$03
	db D_UP,$01
	db $FF

SeafoamIslands5Script3: ; 46860 (11:6860)
	ld a, [wSimulatedJoypadStatesIndex]
	ld b, a
	cp $1
	call z, SeaFoamIslands5Script_46872
	ld a, b
	and a
	ret nz
	ld a, $0
	ld [W_SEAFOAMISLANDS5CURSCRIPT], a
	ret

SeaFoamIslands5Script_46872: ; 46872 (11:6872)
	xor a
	ld [wWalkBikeSurfState], a
	ld [wWalkBikeSurfStateCopy], a
	jp ForceBikeOrSurf

SeafoamIslands5TextPointers: ; 4687c (11:687c)
	dw BoulderText
	dw BoulderText
	dw SeafoamIslands5Text3
	dw SeafoamIslands5Text4
	dw SeafoamIslands5Text5

SeafoamIslands5TrainerHeaders: ; 46886 (11:6886)
SeafoamIslands5TrainerHeader0: ; 46886 (11:6886)
	dbEventFlagBit EVENT_BEAT_SEAFOAM_ISLANDS_5_TRAINER_0
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SEAFOAM_ISLANDS_5_TRAINER_0
	dw SeafoamIslands5BattleText2 ; TextBeforeBattle
	dw SeafoamIslands5BattleText2 ; TextAfterBattle
	dw SeafoamIslands5BattleText2 ; TextEndBattle
	dw SeafoamIslands5BattleText2 ; TextEndBattle

	db $ff

SeafoamIslands5Text3: ; 46893 (11:6893)
	TX_ASM
	ld hl, SeafoamIslands5TrainerHeader0
	call TalkToTrainer
	ld a, $4
	ld [W_SEAFOAMISLANDS5CURSCRIPT], a
	jp TextScriptEnd

SeafoamIslands5BattleText2: ; 468a2 (11:68a2)
	TX_FAR _SeafoamIslands5BattleText2
	TX_ASM
	ld a, ARTICUNO
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

SeafoamIslands5Text4: ; 468b2 (11:68b2)
	TX_FAR _SeafoamIslands5Text4
	db "@"

SeafoamIslands5Text5: ; 468b7 (11:68b7)
	TX_FAR _SeafoamIslands5Text5
	db "@"
