CeladonMartRoofScript: ; 483d5 (12:43d5)
	jp EnableAutoTextBoxDrawing

CeladonMartRoofScript_483d8: ; 483d8 (12:43d8)
	xor a
	ld [wcd37], a
	ld de, wcc5b
	ld hl, CeladonMartRoofDrinkList
.asm_483e2
	ld a, [hli]
	and a
	jr z, .asm_48404
	push hl
	push de
	ld [wd11e], a
	ld b, a
	predef IsItemInBag_
	pop de
	pop hl
	ld a, b
	and a
	jr z, .asm_483e2
	ld a, [wd11e]
	ld [de], a
	inc de
	push hl
	ld hl, wcd37
	inc [hl]
	pop hl
	jr .asm_483e2
.asm_48404
	ld a, $ff
	ld [de], a
	ret

CeladonMartRoofDrinkList: ; 48408 (12:4408)
	db FRESH_WATER
	db SODA_POP
	db LEMONADE
	db $00

CeladonMartRoofScript_4840c: ; 4840c (12:440c)
	ld hl, wd730
	set 6, [hl]
	ld hl, CeladonMartRoofText_484ee
	call PrintText
	xor a
	ld [wCurrentMenuItem], a
	ld a, $3
	ld [wMenuWatchedKeys], a
	ld a, [wcd37]
	dec a
	ld [wMaxMenuItem], a
	ld a, $2
	ld [wTopMenuItemY], a
	ld a, $1
	ld [wTopMenuItemX], a
	ld a, [wcd37]
	dec a
	ld bc, $2
	ld hl, $3
	call AddNTimes
	dec l
	ld b, l
	ld c, $c
	coord hl, 0, 0
	call TextBoxBorder
	call UpdateSprites
	call CeladonMartRoofScript_48532
	ld hl, wd730
	res 6, [hl]
	call HandleMenuInput
	bit 1, a
	ret nz
	ld hl, wcc5b
	ld a, [wCurrentMenuItem]
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hl]
	ld [$ffdb], a
	cp FRESH_WATER
	jr z, .asm_484b6
	cp SODA_POP
	jr z, .asm_48492
	ld a, [wd778]
	bit 6, a
	jr nz, .asm_484e0
	ld hl, CeladonMartRoofText_48515
	call PrintText
	call RemoveItemByIDBank12
	ld bc, (TM_49 << 8) | 1
	call GiveItem
	jr nc, .BagFull
	ld hl, ReceivedTM49Text
	call PrintText
	ld hl, wd778
	set 6, [hl]
	ret
.asm_48492
	ld a, [wd778]
	bit 5, a
	jr nz, .asm_484e0
	ld hl, CeladonMartRoofText_48504
	call PrintText
	call RemoveItemByIDBank12
	ld bc, (TM_48 << 8) | 1
	call GiveItem
	jr nc, .BagFull
	ld hl, CeladonMartRoofText_4850a
	call PrintText
	ld hl, wd778
	set 5, [hl]
	ret
.asm_484b6
	ld a, [wd778]
	bit 4, a
	jr nz, .asm_484e0
	ld hl, CeladonMartRoofText_484f3
	call PrintText
	call RemoveItemByIDBank12
	ld bc, (TM_13 << 8) | 1
	call GiveItem
	jr nc, .BagFull
	ld hl, CeladonMartRoofText_484f9
	call PrintText
	ld hl, wd778
	set 4, [hl]
	ret
.BagFull
	ld hl, CeladonMartRoofText_48526
	jp PrintText
.asm_484e0
	ld hl, CeladonMartRoofText_4852c
	jp PrintText

RemoveItemByIDBank12: ; 484e6 (12:44e6)
	jpba RemoveItemByID

CeladonMartRoofText_484ee: ; 484ee (12:44ee)
	TX_FAR _CeladonMartRoofText_484ee
	db "@"

CeladonMartRoofText_484f3: ; 484f3 (12:44f3)
	TX_FAR _CeladonMartRoofText_484f3
	db $0d
	db "@"

CeladonMartRoofText_484f9: ; 484f9 (12:44f9)
	TX_FAR _CeladonMartRoofText_484f9
	db $0b
	TX_FAR _CeladonMartRoofText_484fe
	db $0d
	db "@"

CeladonMartRoofText_48504: ; 48504 (12:4504)
	TX_FAR _CeladonMartRoofText_48504
	db $0d
	db "@"

CeladonMartRoofText_4850a: ; 4850a (12:450a)
	TX_FAR _CeladonMartRoofText_4850a
	db $0b
	TX_FAR _CeladonMartRoofText_4850f
	db $0d
	db "@"

CeladonMartRoofText_48515: ; 48515 (12:4515)
	TX_FAR _CeladonMartRoofText_48515
	db $0d
	db "@"

ReceivedTM49Text: ; 4851b (12:451b)
	TX_FAR _ReceivedTM49Text
	db $0b
	TX_FAR _CeladonMartRoofText_48520
	db $0d
	db "@"

CeladonMartRoofText_48526: ; 48526 (12:4526)
	TX_FAR _CeladonMartRoofText_48526
	db $0d
	db "@"

CeladonMartRoofText_4852c: ; 4852c (12:452c)
	TX_FAR _CeladonMartRoofText_4852c
	db $0d
	db "@"

CeladonMartRoofScript_48532: ; 48532 (12:4532)
	ld hl, wcc5b
	xor a
	ld [$ffdb], a
.asm_48538
	ld a, [hli]
	cp $ff
	ret z
	push hl
	ld [wd11e], a
	call GetItemName
	coord hl, 2, 2
	ld a, [$ffdb]
	ld bc, SCREEN_WIDTH * 2
	call AddNTimes
	ld de, wcd6d
	call PlaceString
	ld hl, $ffdb
	inc [hl]
	pop hl
	jr .asm_48538

CeladonMartRoofTextPointers: ; 4855b (12:455b)
	dw CeladonMartRoofText1
	dw CeladonMartRoofText2
	dw CeladonMartRoofText5
	dw CeladonMartRoofText5
	dw CeladonMartRoofText5
	dw CeladonMartRoofText6

CeladonMartRoofText1: ; 48567 (12:4567)
	TX_FAR _CeladonMartRoofText1
	db "@"

CeladonMartRoofText2: ; 4856c (12:456c)
	TX_ASM
	call CeladonMartRoofScript_483d8
	ld a, [wcd37]
	and a
	jr z, .asm_4858f
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, CeladonMartRoofText4
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_48595
	call CeladonMartRoofScript_4840c
	jr .asm_48595
.asm_4858f
	ld hl, CeladonMartRoofText3
	call PrintText
.asm_48595
	jp TextScriptEnd

CeladonMartRoofText3: ; 48598 (12:4598)
	TX_FAR _CeladonMartRoofText_48598
	db "@"

CeladonMartRoofText4: ; 4859d (12:459d)
	TX_FAR _CeladonMartRoofText4
	db "@"

CeladonMartRoofText5: ; 485a2 (12:45a2)
	db $f5

CeladonMartRoofText6: ; 485a3 (12:45a3)
	TX_FAR _CeladonMartRoofText6
	db "@"
