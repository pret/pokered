BikeShopScript: ; 1d73c (7:573c)
	jp EnableAutoTextBoxDrawing

BikeShopTextPointers: ; 1d73f (7:573f)
	dw BikeShopText1
	dw BikeShopText2
	dw BikeShopText3

BikeShopText1: ; 1d745 (7:5745)
	TX_ASM
	CheckEvent EVENT_GOT_BICYCLE
	jr z, .asm_260d4
	ld hl, BikeShopText_1d82f
	call PrintText
	jp .Done
.asm_260d4
	ld b, BIKE_VOUCHER
	call IsItemInBag
	jr z, .asm_41190
	ld hl, BikeShopText_1d81f
	call PrintText
	lb bc, BICYCLE, 1
	call GiveItem
	jr nc, .BagFull
	ld a, BIKE_VOUCHER
	ld [$ffdb], a
	callba RemoveItemByID
	SetEvent EVENT_GOT_BICYCLE
	ld hl, BikeShopText_1d824
	call PrintText
	jr .Done
.BagFull
	ld hl, BikeShopText_1d834
	call PrintText
	jr .Done
.asm_41190
	ld hl, BikeShopText_1d810
	call PrintText
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld a, A_BUTTON | B_BUTTON
	ld [wMenuWatchedKeys], a
	ld a, $1
	ld [wMaxMenuItem], a
	ld a, $2
	ld [wTopMenuItemY], a
	ld a, $1
	ld [wTopMenuItemX], a
	ld hl, wd730
	set 6, [hl]
	coord hl, 0, 0
	ld b, $4
	ld c, $f
	call TextBoxBorder
	call UpdateSprites
	coord hl, 2, 2
	ld de, BikeShopMenuText
	call PlaceString
	coord hl, 8, 3
	ld de, BikeShopMenuPrice
	call PlaceString
	ld hl, BikeShopText_1d815
	call PrintText
	call HandleMenuInput
	bit 1, a
	jr nz, .cancel
	ld hl, wd730
	res 6, [hl]
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .cancel
	ld hl, BikeShopCantAffordText
	call PrintText
.cancel
	ld hl, BikeShopComeAgainText
	call PrintText
.Done
	jp TextScriptEnd

BikeShopMenuText: ; 1d7f8 (7:57f8)
	db   "BICYCLE"
	next "CANCEL@"

BikeShopMenuPrice: ; 1d807 (7:5807)
	db "¥1000000@"

BikeShopText_1d810: ; 1d810 (7:5810)
	TX_FAR _BikeShopText_1d810
	db "@"

BikeShopText_1d815: ; 1d815 (7:5815)
	TX_FAR _BikeShopText_1d815
	db "@"

BikeShopCantAffordText: ; 1d81a (7:581a)
	TX_FAR _BikeShopCantAffordText
	db "@"

BikeShopText_1d81f: ; 1d81f (7:581f)
	TX_FAR _BikeShopText_1d81f
	db "@"

BikeShopText_1d824: ; 1d824 (7:5824)
	TX_FAR _BikeShopText_1d824
	db $11, "@"

BikeShopComeAgainText: ; 1d82a (7:582a)
	TX_FAR _BikeShopComeAgainText
	db "@"

BikeShopText_1d82f: ; 1d82f (7:582f)
	TX_FAR _BikeShopText_1d82f
	db "@"

BikeShopText_1d834: ; 1d834 (7:5834)
	TX_FAR _BikeShopText_1d834
	db "@"

BikeShopText2: ; 1d839 (7:5839)
	TX_ASM
	ld hl, BikeShopText_1d843
	call PrintText
	jp TextScriptEnd

BikeShopText_1d843: ; 1d843 (7:5843)
	TX_FAR _BikeShopText_1d843
	db "@"

BikeShopText3: ; 1d848 (7:5848)
	TX_ASM
	CheckEvent EVENT_GOT_BICYCLE
	ld hl, BikeShopText_1d861
	jr nz, .asm_34d2d
	ld hl, BikeShopText_1d85c
.asm_34d2d
	call PrintText
	jp TextScriptEnd

BikeShopText_1d85c: ; 1d85c (7:585c)
	TX_FAR _BikeShopText_1d85c
	db "@"

BikeShopText_1d861: ; 1d861 (7:5861)
	TX_FAR _BikeShopText_1d861
	db "@"
