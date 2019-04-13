SilphCoElevator_Script:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	push hl
	call nz, SilphCoElevatorScript_457dc
	pop hl
	bit 7, [hl]
	res 7, [hl]
	call nz, SilphCoElevatorScript_45827
	xor a
	ld [wAutoTextBoxDrawingControl], a
	inc a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ret

SilphCoElevatorScript_457dc:
	ld hl, wWarpEntries
	ld a, [wWarpedFromWhichWarp]
	ld b, a
	ld a, [wWarpedFromWhichMap]
	ld c, a
	call SilphCoElevatorScript_457ea

SilphCoElevatorScript_457ea:
	inc hl
	inc hl
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ret

SilphCoElevatorScript_457f1:
	ld hl, SilphCoElevatorFloors
	call LoadItemList
	ld hl, SilphCoElevatorWarpMaps
	ld de, wElevatorWarpMaps
	ld bc, SilphCoElevatorWarpMapsEnd - SilphCoElevatorWarpMaps
	call CopyData
	ret

SilphCoElevatorFloors:
	db $0B ; num elements in list
	db FLOOR_1F
	db FLOOR_2F
	db FLOOR_3F
	db FLOOR_4F
	db FLOOR_5F
	db FLOOR_6F
	db FLOOR_7F
	db FLOOR_8F
	db FLOOR_9F
	db FLOOR_10F
	db FLOOR_11F
	db $FF ; terminator

SilphCoElevatorWarpMaps:
; first byte is warp number
; second byte is map number
; These specify where the player goes after getting out of the elevator.
	db $03, SILPH_CO_1F
	db $02, SILPH_CO_2F
	db $02, SILPH_CO_3F
	db $02, SILPH_CO_4F
	db $02, SILPH_CO_5F
	db $02, SILPH_CO_6F
	db $02, SILPH_CO_7F
	db $02, SILPH_CO_8F
	db $02, SILPH_CO_9F
	db $02, SILPH_CO_10F
	db $01, SILPH_CO_11F
SilphCoElevatorWarpMapsEnd:

SilphCoElevatorScript_45827:
	call Delay3
	callba ShakeElevator
	ret

SilphCoElevator_TextPointers:
	dw SilphCoElevatorText1

SilphCoElevatorText1:
	TX_ASM
	call SilphCoElevatorScript_457f1
	ld hl, SilphCoElevatorWarpMaps
	predef DisplayElevatorFloorMenu
	jp TextScriptEnd
