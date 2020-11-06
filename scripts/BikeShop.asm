BikeShop_Script:
	jp EnableAutoTextBoxDrawing

BikeShop_TextPointers:
	dw BikeShopText1
	dw BikeShopText2
	dw BikeShopText3

BikeShopText1:
	text_asm
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
	ldh [hItemToRemoveID], a
	farcall RemoveItemByID
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
	hlcoord 0, 0
	ld b, 4
	ld c, 15
	call TextBoxBorder
	call UpdateSprites
	hlcoord 2, 2
	ld de, BikeShopMenuText
	call PlaceString
	hlcoord 8, 3
	ld de, BikeShopMenuPrice
	call PlaceString
	ld hl, BikeShopText_1d815
	call PrintText
	call HandleMenuInput
	bit BIT_B_BUTTON, a
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

BikeShopMenuText:
	db   "BICYCLE"
	next "CANCEL@"

BikeShopMenuPrice:
	db "¥1000000@"

BikeShopText_1d810:
	text_far _BikeShopText_1d810
	text_end

BikeShopText_1d815:
	text_far _BikeShopText_1d815
	text_end

BikeShopCantAffordText:
	text_far _BikeShopCantAffordText
	text_end

BikeShopText_1d81f:
	text_far _BikeShopText_1d81f
	text_end

BikeShopText_1d824:
	text_far _BikeShopText_1d824
	sound_get_key_item
	text_end

BikeShopComeAgainText:
	text_far _BikeShopComeAgainText
	text_end

BikeShopText_1d82f:
	text_far _BikeShopText_1d82f
	text_end

BikeShopText_1d834:
	text_far _BikeShopText_1d834
	text_end

BikeShopText2:
	text_asm
	ld hl, BikeShopText_1d843
	call PrintText
	jp TextScriptEnd

BikeShopText_1d843:
	text_far _BikeShopText_1d843
	text_end

BikeShopText3:
	text_asm
	CheckEvent EVENT_GOT_BICYCLE
	ld hl, BikeShopText_1d861
	jr nz, .asm_34d2d
	ld hl, BikeShopText_1d85c
.asm_34d2d
	call PrintText
	jp TextScriptEnd

BikeShopText_1d85c:
	text_far _BikeShopText_1d85c
	text_end

BikeShopText_1d861:
	text_far _BikeShopText_1d861
	text_end
