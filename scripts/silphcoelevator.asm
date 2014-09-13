SilphCoElevatorScript: ; 457c0 (11:57c0)
	ld hl, wd126
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

SilphCoElevatorScript_457dc: ; 457dc (11:57dc)
	ld hl, wWarpEntries
	ld a, [wd73b]
	ld b, a
	ld a, [wd73c]
	ld c, a
	call SilphCoElevatorScript_457ea

SilphCoElevatorScript_457ea: ; 457ea (11:57ea)
	inc hl
	inc hl
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ret

SilphCoElevatorScript_457f1: ; 457f1 (11:57f1)
	ld hl, SilphCoElavatorFloors ; $5804
	call LoadItemList
	ld hl, SilphCoElevatorWarpMaps ; $5811
	ld de, wcc5b
	ld bc, $16
	call CopyData
	ret

SilphCoElavatorFloors: ; 45804 (11:45804)
	db $0B ; num elements in list
	db $56, $57, $58, $59, $5A, $5B, $5C, $5D, $5E, $5F, $60 ; "1F", "2F", "3F", "4F", ... , "11F"
	db $FF ; terminator

SilphCoElevatorWarpMaps: ; 45811 (11:45811)
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

SilphCoElevatorScript_45827: ; 45827 (11:5827)
	call Delay3
	callba ShakeElevator
	ret

SilphCoElevatorTextPointers: ; 45833 (11:5833)
	dw SilphCoElevatorText1

SilphCoElevatorText1: ; 45835 (11:5835)
	db $08 ; asm
	call SilphCoElevatorScript_457f1
	ld hl, SilphCoElevatorWarpMaps ; $5811
	predef Func_1c9c6
	jp TextScriptEnd
