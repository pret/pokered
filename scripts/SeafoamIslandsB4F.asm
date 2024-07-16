SeafoamIslandsB4F_Script:
	call EnableAutoTextBoxDrawing
	ld a, [wSeafoamIslandsB4FCurScript]
	ld hl, SeafoamIslandsB4F_ScriptPointers
	jp CallFunctionInTable

SeafoamIslandsB4FResetScript:
	xor a
	ld [wSeafoamIslandsB4FCurScript], a
	ld [wJoyIgnore], a
	ret

SeafoamIslandsB4F_ScriptPointers:
	def_script_pointers
	dw_const SeafoamIslandsB4FDefaultScript,       SCRIPT_SEAFOAMISLANDSB4F_DEFAULT
	dw_const SeafoamIslandsB4FObjectMoving1Script, SCRIPT_SEAFOAMISLANDSB4F_OBJECT_MOVING1
	dw_const SeafoamIslandsB4FMoveObjectScript,    SCRIPT_SEAFOAMISLANDSB4F_MOVE_OBJECT
	dw_const SeafoamIslandsB4FObjectMoving2Script, SCRIPT_SEAFOAMISLANDSB4F_OBJECT_MOVING2
	dw_const SeafoamIslandsB4FObjectMoving3Script, SCRIPT_SEAFOAMISLANDSB4F_OBJECT_MOVING3
	EXPORT SCRIPT_SEAFOAMISLANDSB4F_MOVE_OBJECT ; used by engine/overworld/player_state.asm

SeafoamIslandsB4FObjectMoving3Script:
	ld a, [wIsInBattle]
	cp $ff
	jr z, SeafoamIslandsB4FResetScript
	call EndTrainerBattle
	ld a, SCRIPT_SEAFOAMISLANDSB4F_DEFAULT
	ld [wSeafoamIslandsB4FCurScript], a
	ret

SeafoamIslandsB4FDefaultScript:
	CheckBothEventsSet EVENT_SEAFOAM3_BOULDER1_DOWN_HOLE, EVENT_SEAFOAM3_BOULDER2_DOWN_HOLE
	ret z
	ld hl, .Coords
	call ArePlayerCoordsInArray
	ret nc
	ld a, [wCoordIndex]
	cp $3
	jr nc, .only1UpInputNeeded
	ld a, NPC_MOVEMENT_UP
	ld [wSimulatedJoypadStatesEnd + 1], a
	ld a, 2
	jr .forcePlayerUpFromSurfExit
.only1UpInputNeeded
	ld a, 1
.forcePlayerUpFromSurfExit
	ld [wSimulatedJoypadStatesIndex], a
	ld a, D_UP
	ld [wSimulatedJoypadStatesEnd], a
	call StartSimulatingJoypadStates
	ld hl, wStatusFlags7
	res BIT_FORCED_WARP, [hl]
	ld a, SCRIPT_SEAFOAMISLANDSB4F_OBJECT_MOVING1
	ld [wSeafoamIslandsB4FCurScript], a
	ret

.Coords
	dbmapcoord 20, 17
	dbmapcoord 21, 17
	dbmapcoord 20, 16
	dbmapcoord 21, 16
	db -1 ; end

SeafoamIslandsB4FObjectMoving1Script:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, SCRIPT_SEAFOAMISLANDSB4F_DEFAULT
	ld [wSeafoamIslandsB4FCurScript], a
	ret

SeafoamIslandsB4FMoveObjectScript:
	CheckBothEventsSet EVENT_SEAFOAM4_BOULDER1_DOWN_HOLE, EVENT_SEAFOAM4_BOULDER2_DOWN_HOLE
	ld a, SCRIPT_SEAFOAMISLANDSB4F_DEFAULT
	jr z, .playerNotInStrongCurrent
	ld hl, .Coords
	call ArePlayerCoordsInArray
	ld a, SCRIPT_SEAFOAMISLANDSB4F_DEFAULT
	jr nc, .playerNotInStrongCurrent
	ld a, [wCoordIndex]
	cp $1
	jr nz, .nearRightBoulder
	ld de, .RLEList_StrongCurrentNearLeftBoulder
	jr .forceSurfMovement
.nearRightBoulder
	ld de, .RLEList_StrongCurrentNearRightBoulder
.forceSurfMovement
	ld hl, wSimulatedJoypadStatesEnd
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_SEAFOAMISLANDSB4F_OBJECT_MOVING2
.playerNotInStrongCurrent
	ld [wSeafoamIslandsB4FCurScript], a
	ret

.Coords
	dbmapcoord  4, 14
	dbmapcoord  5, 14
	db -1 ; end

.RLEList_StrongCurrentNearRightBoulder:
	db D_UP, 3
	db D_RIGHT, 2
	db D_UP, 1
	db -1 ; end

.RLEList_StrongCurrentNearLeftBoulder:
	db D_UP, 3
	db D_RIGHT, 3
	db D_UP, 1
	db -1 ; end

SeafoamIslandsB4FObjectMoving2Script:
	ld a, [wSimulatedJoypadStatesIndex]
	ld b, a
	cp $1
	call z, .doneForcedSurfMovement
	ld a, b
	and a
	ret nz
	ld a, SCRIPT_SEAFOAMISLANDSB4F_DEFAULT
	ld [wSeafoamIslandsB4FCurScript], a
	ret

.doneForcedSurfMovement:
	xor a
	ld [wWalkBikeSurfState], a
	ld [wWalkBikeSurfStateCopy], a
	jp ForceBikeOrSurf

SeafoamIslandsB4F_TextPointers:
	def_text_pointers
	dw_const BoulderText,                       TEXT_SEAFOAMISLANDSB4F_BOULDER1
	dw_const BoulderText,                       TEXT_SEAFOAMISLANDSB4F_BOULDER2
	dw_const SeafoamIslandsB4FArticunoText,     TEXT_SEAFOAMISLANDSB4F_ARTICUNO
	dw_const SeafoamIslandsB4FBouldersSignText, TEXT_SEAFOAMISLANDSB4F_BOULDERS_SIGN
	dw_const SeafoamIslandsB4FDangerSignText,   TEXT_SEAFOAMISLANDSB4F_DANGER_SIGN

; Articuno is object 3, but its event flag is bit 2.
; This is not a problem because its sight range is 0, and
; trainer headers were not stored by ExecuteCurMapScriptInTable.
	def_trainers 2
ArticunoTrainerHeader:
	trainer EVENT_BEAT_ARTICUNO, 0, SeafoamIslandsB4FArticunoBattleText, SeafoamIslandsB4FArticunoBattleText, SeafoamIslandsB4FArticunoBattleText
	db -1 ; end

SeafoamIslandsB4FArticunoText:
	text_asm
	ld hl, ArticunoTrainerHeader
	call TalkToTrainer
	ld a, SCRIPT_SEAFOAMISLANDSB4F_OBJECT_MOVING3
	ld [wSeafoamIslandsB4FCurScript], a
	jp TextScriptEnd

SeafoamIslandsB4FArticunoBattleText:
	text_far _SeafoamIslandsB4FArticunoBattleText
	text_asm
	ld a, ARTICUNO
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

SeafoamIslandsB4FBouldersSignText:
	text_far _SeafoamIslandsB4FBouldersSignText
	text_end

SeafoamIslandsB4FDangerSignText:
	text_far _SeafoamIslandsB4FDangerSignText
	text_end
