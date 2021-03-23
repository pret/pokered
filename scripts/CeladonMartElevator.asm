CeladonMartElevator_Script:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	push hl
	call nz, CeladonMartElevatorScript_4861c
	pop hl
	bit 7, [hl]
	res 7, [hl]
	call nz, CeladonMartElevatorScript_48654
	xor a
	ld [wAutoTextBoxDrawingControl], a
	inc a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ret

CeladonMartElevatorScript_4861c:
	ld hl, wWarpEntries
	ld a, [wWarpedFromWhichWarp]
	ld b, a
	ld a, [wWarpedFromWhichMap]
	ld c, a
	call CeladonMartElevatorScript_4862a

CeladonMartElevatorScript_4862a:
	inc hl
	inc hl
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ret

CeladonMartElevatorScript_48631:
	ld hl, CeladonMartElevatorFloors
	call LoadItemList
	ld hl, CeladonMartElevatorWarpMaps
	ld de, wElevatorWarpMaps
	ld bc, CeladonMartElevatorWarpMapsEnd - CeladonMartElevatorWarpMaps
	jp CopyData

CeladonMartElevatorFloors:
	db 5 ; #
	db FLOOR_1F
	db FLOOR_2F
	db FLOOR_3F
	db FLOOR_4F
	db FLOOR_5F
	db -1 ; end

; These specify where the player goes after getting out of the elevator.
CeladonMartElevatorWarpMaps:
	; warp number, map id
	db 5, CELADON_MART_1F
	db 2, CELADON_MART_2F
	db 2, CELADON_MART_3F
	db 2, CELADON_MART_4F
	db 2, CELADON_MART_5F
CeladonMartElevatorWarpMapsEnd:

CeladonMartElevatorScript_48654:
	farjp ShakeElevator

CeladonMartElevator_TextPointers:
	dw CeladonMartElevatorText1

CeladonMartElevatorText1:
	text_asm
	call CeladonMartElevatorScript_48631
	ld hl, CeladonMartElevatorWarpMaps
	predef DisplayElevatorFloorMenu
	jp TextScriptEnd
