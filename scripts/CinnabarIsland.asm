CinnabarIsland_Script:
	call EnableAutoTextBoxDrawing
	ld hl, wCurrentMapScriptFlags
	set BIT_CUR_MAP_LOADED_1, [hl]
	ResetEvent EVENT_MANSION_SWITCH_ON
	ResetEvent EVENT_LAB_STILL_REVIVING_FOSSIL
	ld hl, CinnabarIsland_ScriptPointers
	ld a, [wCinnabarIslandCurScript]
	jp CallFunctionInTable

CinnabarIsland_ScriptPointers:
	def_script_pointers
	dw_const CinnabarIslandDefaultScript,      SCRIPT_CINNABARISLAND_DEFAULT
	dw_const CinnabarIslandPlayerMovingScript, SCRIPT_CINNABARISLAND_PLAYER_MOVING

CinnabarIslandDefaultScript:
	ld b, SECRET_KEY
	call IsItemInBag
	ret nz
	ld a, [wYCoord]
	cp 4
	ret nz
	ld a, [wXCoord]
	cp 18
	ret nz
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	ld a, TEXT_CINNABARISLAND_DOOR_IS_LOCKED
	ldh [hTextID], a
	call DisplayTextID
	xor a
	ldh [hJoyHeld], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, D_DOWN
	ld [wSimulatedJoypadStatesEnd], a
	call StartSimulatingJoypadStates
	xor a
	ld [wSpritePlayerStateData1FacingDirection], a
	ld [wJoyIgnore], a
	ld a, SCRIPT_CINNABARISLAND_PLAYER_MOVING
	ld [wCinnabarIslandCurScript], a
	ret

CinnabarIslandPlayerMovingScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	ld a, SCRIPT_CINNABARISLAND_DEFAULT
	ld [wCinnabarIslandCurScript], a
	ret

CinnabarIsland_TextPointers:
	def_text_pointers
	dw_const CinnabarIslandGirlText,           TEXT_CINNABARISLAND_GIRL
	dw_const CinnabarIslandGamblerText,        TEXT_CINNABARISLAND_GAMBLER
	dw_const CinnabarIslandSignText,           TEXT_CINNABARISLAND_SIGN
	dw_const MartSignText,                     TEXT_CINNABARISLAND_MART_SIGN
	dw_const PokeCenterSignText,               TEXT_CINNABARISLAND_POKECENTER_SIGN
	dw_const CinnabarIslandPokemonLabSignText, TEXT_CINNABARISLAND_POKEMONLAB_SIGN
	dw_const CinnabarIslandGymSignText,        TEXT_CINNABARISLAND_GYM_SIGN
	dw_const CinnabarIslandDoorIsLockedText,   TEXT_CINNABARISLAND_DOOR_IS_LOCKED

CinnabarIslandDoorIsLockedText:
	text_far _CinnabarIslandDoorIsLockedText
	text_end

CinnabarIslandGirlText:
	text_far _CinnabarIslandGirlText
	text_end

CinnabarIslandGamblerText:
	text_far _CinnabarIslandGamblerText
	text_end

CinnabarIslandSignText:
	text_far _CinnabarIslandSignText
	text_end

CinnabarIslandPokemonLabSignText:
	text_far _CinnabarIslandPokemonLabSignText
	text_end

CinnabarIslandGymSignText:
	text_far _CinnabarIslandGymSignText
	text_end
