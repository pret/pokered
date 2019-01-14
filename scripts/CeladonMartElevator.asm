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
	db 5 ; number of elements in list
	db FLOOR_1F
	db FLOOR_2F
	db FLOOR_3F
	db FLOOR_4F
	db FLOOR_5F
	db $FF

CeladonMartElevatorWarpMaps:
; first byte is warp number
; second byte is map number
; These specify where the player goes after getting out of the elevator.
	db $05, CELADON_MART_1F
	db $02, CELADON_MART_2F
	db $02, CELADON_MART_3F
	db $02, CELADON_MART_4F
	db $02, CELADON_MART_5F
CeladonMartElevatorWarpMapsEnd:

CeladonMartElevatorScript_48654:
	jpba ShakeElevator

CeladonMartElevator_TextPointers:
	dw CeladonMartElevatorText1

CeladonMartElevatorText1:
	TX_ASM
	call CeladonMartElevatorScript_48631
	ld hl, CeladonMartElevatorWarpMaps
	predef DisplayElevatorFloorMenu
	jp TextScriptEnd
