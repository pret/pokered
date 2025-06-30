Route16Gate1F_Script:
	ld hl, wStatusFlags6
	res BIT_ALWAYS_ON_BIKE, [hl]
	call EnableAutoTextBoxDrawing
	ld a, [wRoute16Gate1FCurScript]
	ld hl, Route16Gate1F_ScriptPointers
	jp CallFunctionInTable

Route16Gate1F_ScriptPointers:
	def_script_pointers
	dw_const Route16Gate1FDefaultScript,           SCRIPT_ROUTE16GATE1F_DEFAULT
	dw_const Route16Gate1FPlayerMovingUpScript,    SCRIPT_ROUTE16GATE1F_PLAYER_MOVING_UP
	dw_const Route16Gate1FGuardScript,             SCRIPT_ROUTE16GATE1F_GUARD
	dw_const Route16Gate1FPlayerMovingRightScript, SCRIPT_ROUTE16GATE1F_PLAYER_MOVING_RIGHT

Route16Gate1FDefaultScript:
	call Route16Gate1FIsBicycleInBagScript
	ret nz
	ld hl, .StopsPlayerCoords
	call ArePlayerCoordsInArray
	ret nc
	ld a, TEXT_ROUTE16GATE1F_GUARD_WAIT_UP
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
	ld b, $0
	ld c, a
	ld a, PAD_UP
	ld hl, wSimulatedJoypadStatesEnd
	call FillMemory
	call StartSimulatingJoypadStates
	ld a, SCRIPT_ROUTE16GATE1F_PLAYER_MOVING_UP
	ld [wRoute16Gate1FCurScript], a
	ret
.next_to_counter
	ld a, SCRIPT_ROUTE16GATE1F_GUARD
	ld [wRoute16Gate1FCurScript], a
	ret

.StopsPlayerCoords:
	dbmapcoord  4,  7
	dbmapcoord  4,  8
	dbmapcoord  4,  9
	dbmapcoord  4, 10
	db -1 ; end

Route16Gate1FPlayerMovingUpScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a

Route16Gate1FGuardScript:
	ld a, TEXT_ROUTE16GATE1F_GUARD
	ldh [hTextID], a
	call DisplayTextID
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, PAD_RIGHT
	ld [wSimulatedJoypadStatesEnd], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_ROUTE16GATE1F_PLAYER_MOVING_RIGHT
	ld [wRoute16Gate1FCurScript], a
	ret

Route16Gate1FPlayerMovingRightScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld hl, wStatusFlags5
	res BIT_SCRIPTED_MOVEMENT_STATE, [hl]
	ld a, SCRIPT_ROUTE16GATE1F_DEFAULT
	ld [wRoute16Gate1FCurScript], a
	ret

Route16Gate1FIsBicycleInBagScript:
	ld b, BICYCLE
	jp IsItemInBag

Route16Gate1F_TextPointers:
	def_text_pointers
	dw_const Route16Gate1FGuardText,       TEXT_ROUTE16GATE1F_GUARD
	dw_const Route16Gate1FGamblerText,     TEXT_ROUTE16GATE1F_GAMBLER
	dw_const Route16Gate1FGuardWaitUpText, TEXT_ROUTE16GATE1F_GUARD_WAIT_UP

Route16Gate1FGuardText:
	text_asm
	call Route16Gate1FIsBicycleInBagScript
	jr z, .no_bike
	ld hl, .CyclingRoadExplanationText
	call PrintText
	jr .text_script_end
.no_bike
	ld hl, .NoPedestriansAllowedText
	call PrintText
.text_script_end
	jp TextScriptEnd

.NoPedestriansAllowedText:
	text_far _Route16Gate1FGuardNoPedestriansAllowedText
	text_end

.CyclingRoadExplanationText:
	text_far _Route16Gate1FGuardCyclingRoadExplanationText
	text_end

Route16Gate1FGuardWaitUpText:
	text_far _Route16Gate1FGuardWaitUpText
	text_end

Route16Gate1FGamblerText:
	text_far _Route16Gate1FGamblerText
	text_end
