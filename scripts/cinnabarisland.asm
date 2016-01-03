CinnabarIslandScript: ; 1ca19 (7:4a19)
	call EnableAutoTextBoxDrawing
	ld hl, wCurrentMapScriptFlags
	set 5, [hl]
	ResetEvent EVENT_MANSION_SWITCH_ON
	ResetEvent EVENT_LAB_STILL_REVIVING_FOSSIL
	ld hl, CinnabarIslandScriptPointers
	ld a, [wCinnabarIslandCurScript]
	jp CallFunctionInTable

CinnabarIslandScriptPointers: ; 1ca34 (7:4a34)
	dw CinnabarIslandScript0
	dw CinnabarIslandScript1

CinnabarIslandScript0: ; 1ca38 (7:4a38)
	ld b, SECRET_KEY
	call IsItemInBag
	ret nz
	ld a, [wYCoord]
	cp $4
	ret nz
	ld a, [wXCoord]
	cp $12
	ret nz
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	ld a, $8
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [hJoyHeld], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, D_DOWN
	ld [wSimulatedJoypadStatesEnd], a
	call StartSimulatingJoypadStates
	xor a
	ld [wSpriteStateData1 + 9], a
	ld [wJoyIgnore], a
	ld a, $1
	ld [wCinnabarIslandCurScript], a
	ret

CinnabarIslandScript1: ; 1ca73 (7:4a73)
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	ld a, $0
	ld [wCinnabarIslandCurScript], a
	ret

CinnabarIslandTextPointers: ; 1ca81 (7:4a81)
	dw CinnabarIslandText1
	dw CinnabarIslandText2
	dw CinnabarIslandText3
	dw MartSignText
	dw PokeCenterSignText
	dw CinnabarIslandText6
	dw CinnabarIslandText7
	dw CinnabarIslandText8

CinnabarIslandText8: ; 1ca91 (7:4a91)
	TX_FAR _CinnabarIslandText8
	db "@"

CinnabarIslandText1: ; 1ca96 (7:4a96)
	TX_FAR _CinnabarIslandText1
	db "@"

CinnabarIslandText2: ; 1ca9b (7:4a9b)
	TX_FAR _CinnabarIslandText2
	db "@"

CinnabarIslandText3: ; 1caa0 (7:4aa0)
	TX_FAR _CinnabarIslandText3
	db "@"

CinnabarIslandText6: ; 1caa5 (7:4aa5)
	TX_FAR _CinnabarIslandText6
	db "@"

CinnabarIslandText7: ; 1caaa (7:4aaa)
	TX_FAR _CinnabarIslandText7
	db "@"
