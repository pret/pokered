BikeShop_Script:
	jp EnableAutoTextBoxDrawing

BikeShop_TextPointers:
	def_text_pointers
	dw_const BikeShopClerkText,             TEXT_BIKESHOP_CLERK
	dw_const BikeShopMiddleAgedWomanText,   TEXT_BIKESHOP_MIDDLE_AGED_WOMAN
	dw_const BikeShopYoungsterText,         TEXT_BIKESHOP_YOUNGSTER

BikeShopClerkText:
	text_asm
	CheckEvent EVENT_GOT_BICYCLE
	jr z, .dontHaveBike
	ld hl, BikeShopClerkHowDoYouLikeYourBicycleText
	call PrintText
	jp .Done
.dontHaveBike
	ld b, BIKE_VOUCHER
	call IsItemInBag
	jr z, .dontHaveVoucher
	ld hl, BikeShopClerkOhThatsAVoucherText
	call PrintText
	lb bc, BICYCLE, 1
	call GiveItem
	jr nc, .BagFull
	ld a, BIKE_VOUCHER
	ldh [hItemToRemoveID], a
	farcall RemoveItemByID
	SetEvent EVENT_GOT_BICYCLE
	ld hl, BikeShopExchangedVoucherText
	call PrintText
	jr .Done
.BagFull
	ld hl, BikeShopBagFullText
	call PrintText
	jr .Done
.dontHaveVoucher
	ld hl, BikeShopClerkWelcomeText
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
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
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
	ld hl, BikeShopClerkDoYouLikeItText
	call PrintText
	call HandleMenuInput
	bit BIT_B_BUTTON, a
	jr nz, .cancel
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
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

BikeShopClerkWelcomeText:
	text_far _BikeShopClerkWelcomeText
	text_end

BikeShopClerkDoYouLikeItText:
	text_far _BikeShopClerkDoYouLikeItText
	text_end

BikeShopCantAffordText:
	text_far _BikeShopCantAffordText
	text_end

BikeShopClerkOhThatsAVoucherText:
	text_far _BikeShopClerkOhThatsAVoucherText
	text_end

BikeShopExchangedVoucherText:
	text_far _BikeShopExchangedVoucherText
	sound_get_key_item
	text_end

BikeShopComeAgainText:
	text_far _BikeShopComeAgainText
	text_end

BikeShopClerkHowDoYouLikeYourBicycleText:
	text_far _BikeShopClerkHowDoYouLikeYourBicycleText
	text_end

BikeShopBagFullText:
	text_far _BikeShopBagFullText
	text_end

BikeShopMiddleAgedWomanText:
	text_asm
	ld hl, .Text
	call PrintText
	jp TextScriptEnd

.Text:
	text_far _BikeShopMiddleAgedWomanText
	text_end

BikeShopYoungsterText:
	text_asm
	CheckEvent EVENT_GOT_BICYCLE
	ld hl, .CoolBikeText
	jr nz, .gotBike
	ld hl, .TheseBikesAreExpensiveText
.gotBike
	call PrintText
	jp TextScriptEnd

.TheseBikesAreExpensiveText:
	text_far _BikeShopYoungsterTheseBikesAreExpensiveText
	text_end

.CoolBikeText:
	text_far _BikeShopYoungsterCoolBikeText
	text_end
