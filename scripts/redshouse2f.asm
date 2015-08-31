RedsHouse2FScript: ; 5c0b0 (17:40b0)
	call EnableAutoTextBoxDrawing
	ld hl,RedsHouse2FScriptPointers
	ld a,[wRedsHouse2CurScript]
	jp CallFunctionInTable

RedsHouse2FScriptPointers: ; 5c0bc (17:40bc)
	dw RedsHouse2FScript0
	dw RedsHouse2FScript1

RedsHouse2FScript0: ; 5c0c0 (17:40c0)
	xor a
	ld [hJoyHeld],a
	ld a,PLAYER_DIR_UP
	ld [wPlayerMovingDirection],a
	ld a,1
	ld [wRedsHouse2CurScript],a
	ret

RedsHouse2FScript1: ; 5c0ce (17:40ce)
	ret

RedsHouse2FTextPointers: ; 5c0cf (17:40cf)
	db "@"
