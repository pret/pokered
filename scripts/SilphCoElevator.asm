SilphCoElevator_Script:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	push hl
	call nz, SilphCoElevatorStoreWarpEntriesScript
	pop hl
	bit BIT_CUR_MAP_USED_ELEVATOR, [hl]
	res BIT_CUR_MAP_USED_ELEVATOR, [hl]
	call nz, SilphCoElevatorShakeScript
	xor a
	ld [wAutoTextBoxDrawingControl], a
	inc a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ret

SilphCoElevatorStoreWarpEntriesScript:
	ld hl, wWarpEntries
	ld a, [wWarpedFromWhichWarp]
	ld b, a
	ld a, [wWarpedFromWhichMap]
	ld c, a
	call .StoreWarpEntry
	; fallthrough
.StoreWarpEntry:
	inc hl
	inc hl
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ret

SilphCoElevatorCopyWarpMapsScript:
	ld hl, SilphCoElevatorFloors
	call LoadItemList
	ld hl, SilphCoElevatorWarpMaps
	ld de, wElevatorWarpMaps
	ld bc, SilphCoElevatorWarpMaps.End - SilphCoElevatorWarpMaps
	call CopyData
	ret

SilphCoElevatorFloors:
	db 11 ; #
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
	db -1 ; end

; These specify where the player goes after getting out of the elevator.
SilphCoElevatorWarpMaps:
	; warp number, map id
	db 3, SILPH_CO_1F
	db 2, SILPH_CO_2F
	db 2, SILPH_CO_3F
	db 2, SILPH_CO_4F
	db 2, SILPH_CO_5F
	db 2, SILPH_CO_6F
	db 2, SILPH_CO_7F
	db 2, SILPH_CO_8F
	db 2, SILPH_CO_9F
	db 2, SILPH_CO_10F
	db 1, SILPH_CO_11F
.End:

SilphCoElevatorShakeScript:
	call Delay3
	farcall ShakeElevator
	ret

SilphCoElevator_TextPointers:
	def_text_pointers
	dw_const SilphCoElevatorElevatorText, TEXT_SILPHCOELEVATOR_ELEVATOR

SilphCoElevatorElevatorText:
	text_asm
	call SilphCoElevatorCopyWarpMapsScript
	ld hl, SilphCoElevatorWarpMaps
	predef DisplayElevatorFloorMenu
	jp TextScriptEnd
