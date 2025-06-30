Route18Gate1F_Script:
	ld hl, wStatusFlags6
	res BIT_ALWAYS_ON_BIKE, [hl]
	call EnableAutoTextBoxDrawing
	ld a, [wRoute18Gate1FCurScript]
	ld hl, Route18Gate1F_ScriptPointers
	jp CallFunctionInTable

Route18Gate1F_ScriptPointers:
	def_script_pointers
	dw_const Route18Gate1FDefaultScript,           SCRIPT_ROUTE18GATE1F_DEFAULT
	dw_const Route18Gate1FPlayerMovingUpScript,    SCRIPT_ROUTE18GATE1F_PLAYER_MOVING_UP
	dw_const Route18Gate1FGuardScript,             SCRIPT_ROUTE18GATE1F_GUARD
	dw_const Route18Gate1FPlayerMovingRightScript, SCRIPT_ROUTE18GATE1F_PLAYER_MOVING_RIGHT

Route18Gate1FDefaultScript:
	call Route16Gate1FIsBicycleInBagScript
	ret nz
	ld hl, .StopsPlayerCoords
	call ArePlayerCoordsInArray
	ret nc
	ld a, TEXT_ROUTE18GATE1F_GUARD_EXCUSE_ME
	ldh [hTextID], a
	call DisplayTextID
	xor a
	ldh [hJoyHeld], a
	ld a, [wCoordIndex]
	cp $1
	jr z, .next_to_counter
	ld a, [wCoordIndex]
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	ld b, 0
	ld c, a
	ld a, PAD_UP
	ld hl, wSimulatedJoypadStatesEnd
	call FillMemory
	call StartSimulatingJoypadStates
	ld a, SCRIPT_ROUTE18GATE1F_PLAYER_MOVING_UP
	ld [wRoute18Gate1FCurScript], a
	ret
.next_to_counter
	ld a, SCRIPT_ROUTE18GATE1F_GUARD
	ld [wRoute18Gate1FCurScript], a
	ret

.StopsPlayerCoords:
	dbmapcoord  4,  3
	dbmapcoord  4,  4
	dbmapcoord  4,  5
	dbmapcoord  4,  6
	db -1 ; end

Route18Gate1FPlayerMovingUpScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a

Route18Gate1FGuardScript:
	ld a, TEXT_ROUTE18GATE1F_GUARD
	ldh [hTextID], a
	call DisplayTextID
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, PAD_RIGHT
	ld [wSimulatedJoypadStatesEnd], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_ROUTE18GATE1F_PLAYER_MOVING_RIGHT
	ld [wRoute18Gate1FCurScript], a
	ret

Route18Gate1FPlayerMovingRightScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld hl, wStatusFlags5
	res BIT_SCRIPTED_MOVEMENT_STATE, [hl]
	ld a, SCRIPT_ROUTE18GATE1F_DEFAULT
	ld [wRoute18Gate1FCurScript], a
	ret

Route18Gate1F_TextPointers:
	def_text_pointers
	dw_const Route18Gate1FGuardText,         TEXT_ROUTE18GATE1F_GUARD
	dw_const Route18Gate1FGuardExcuseMeText, TEXT_ROUTE18GATE1F_GUARD_EXCUSE_ME

Route18Gate1FGuardText:
	text_asm
	call Route16Gate1FIsBicycleInBagScript
	jr z, .no_bike
	ld hl, .CyclingRoadUphillText
	call PrintText
	jr .text_script_end
.no_bike
	ld hl, .YouNeedABicycleText
	call PrintText
.text_script_end
	jp TextScriptEnd

.YouNeedABicycleText:
	text_far _Route18Gate1FGuardYouNeedABicycleText
	text_end

.CyclingRoadUphillText:
	text_far _Route18Gate1FGuardCyclingRoadUphillText
	text_end

Route18Gate1FGuardExcuseMeText:
	text_far _Route18Gate1FGuardExcuseMeText
	text_end
