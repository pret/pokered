CeladonMartElevatorScript: ; 48600 (12:4600)
	ld hl, $d126
	bit 5, [hl]
	res 5, [hl]
	push hl
	call nz, CeladonMartElevatorScript_4861c
	pop hl
	bit 7, [hl]
	res 7, [hl]
	call nz, Func_48654
	xor a
	ld [$cf0c], a
	inc a
	ld [$cc3c], a
	ret

CeladonMartElevatorScript_4861c: ; 4861c (12:461c)
	ld hl, $d3af
	ld a, [$d73b]
	ld b, a
	ld a, [$d73c]
	ld c, a
	call CeladonMartElevatorScript_4862a

CeladonMartElevatorScript_4862a: ; 4862a (12:462a)
	inc hl
	inc hl
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ret

CeladonMartElevatorScript_48631: ; 48631 (12:4631)
	ld hl, CeladonMartElavatorFloors ; $4643
	call LoadItemList
	ld hl, CeldaonMartElevatorWarpMaps ; $464a
	ld de, $cc5b
	ld bc, $000a
	jp CopyData

CeladonMartElavatorFloors: ; 48643 (12:4643)
	db $05 ; num elements in list
	db $56, $57, $58, $59, $5A ; "1F", "2F", "3F", "4F, "5F"
	db $FF ; terminator

CeldaonMartElevatorWarpMaps: ; 4864a (12:464a)
; first byte is warp number
; second byte is map number
; These specify where the player goes after getting out of the elevator.
	db $05, CELADON_MART_1
	db $02, CELADON_MART_2
	db $02, CELADON_MART_3
	db $02, CELADON_MART_4
	db $02, CELADON_MART_5

Func_48654: ; 48654 (12:4654)
	ld b, BANK(Func_7bf15)
	ld hl, Func_7bf15
	jp Bankswitch

CeladonMartElevatorTextPointers: ; 4865c (12:465c)
	dw CeladonMartElevatorText1

CeladonMartElevatorText1: ; 4865e (12:465e)
	db $08 ; asm
	call CeladonMartElevatorScript_48631
	ld hl, CeldaonMartElevatorWarpMaps ; $464a
	ld a, $61
	call Predef
	jp TextScriptEnd
	

