; PureRGBnote: CHANGED: The Bike Shop was expanded a bit to use some of the trade center / collosseum tiles you wouldn't see ever in the entire
; game unless you played over link cable. Also a couple beta tiles are added to the tileset to make things look nice.
; Some text that wasn't fully translated from japanese is added in new signs here.
BikeShop_Script:
	jp EnableAutoTextBoxDrawing

BikeShop_TextPointers:
	def_text_pointers
	dw_const BikeShopClerkText,             TEXT_BIKESHOP_CLERK
	dw_const BikeShopMiddleAgedWomanText,   TEXT_BIKESHOP_MIDDLE_AGED_WOMAN
	dw_const BikeShopYoungsterText,         TEXT_BIKESHOP_YOUNGSTER
	dw_const BikeShopBasketBikeText,        TEXT_BIKESHOP_BASKET_BIKE
	dw_const BikeShopToolboxText,           TEXT_BIKESHOP_TOOLBOX
	dw_const NewBicycleText,                TEXT_BIKESHOP_NEW_BIKE
	dw_const BikeShopSignLeftText,          TEXT_BIKESHOP_ENTRANCE_SIGN1
	dw_const BikeShopSignRightText,         TEXT_BIKESHOP_ENTRANCE_SIGN2
	dw_const BikeShopArcade1Text,           TEXT_BIKESHOP_ARCADE1
	dw_const BikeShopArcade2Text,           TEXT_BIKESHOP_ARCADE2
	dw_const BikeShopArcade3Text,           TEXT_BIKESHOP_ARCADE3
	dw_const BikeShopStatsText,             TEXT_BIKESHOP_STATS

BikeShopClerkText:
	text_asm
	CheckEvent EVENT_GOT_BICYCLE
	jr z, .dontHaveBike
	ld hl, BikeShopClerkHowDoYouLikeYourBicycleText
	rst _PrintText
	jp .Done
.dontHaveBike
	ld b, BIKE_VOUCHER
	call IsItemInBag
	jr z, .dontHaveVoucher
	ld hl, BikeShopClerkOhThatsAVoucherText
	rst _PrintText
	lb bc, BICYCLE, 1
	call GiveItem
	jr nc, .BagFull
	ld a, BIKE_VOUCHER
	ldh [hItemToRemoveID], a
	farcall RemoveItemByID
	SetEvent EVENT_GOT_BICYCLE
	ld hl, BikeShopExchangedVoucherText
	rst _PrintText
	jr .Done
.BagFull
	ld hl, BikeShopBagFullText
	rst _PrintText
	jr .Done
.dontHaveVoucher
	ld hl, BikeShopClerkWelcomeText
	rst _PrintText
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
	lb bc, 4, 15
	call TextBoxBorder
	call UpdateSprites
	hlcoord 2, 2
	ld de, BikeShopMenuText
	call PlaceString
	hlcoord 8, 3
	ld de, BikeShopMenuPrice
	call PlaceString
	ld hl, BikeShopClerkDoYouLikeItText
	rst _PrintText
	call HandleMenuInput
	bit BIT_B_BUTTON, a
	jr nz, .cancel
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .cancel
	ld hl, BikeShopCantAffordText
	rst _PrintText
.cancel
	ld hl, BikeShopComeAgainText
	rst _PrintText
.Done
	rst TextScriptEnd

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
	text_far _BikeShopMiddleAgedWomanText
	text_end

BikeShopYoungsterText:
	text_asm
	CheckEvent EVENT_GOT_BICYCLE
	ld hl, .CoolBikeText
	jr nz, .gotBike
	ld hl, .TheseBikesAreExpensiveText
.gotBike
	rst _PrintText
	rst TextScriptEnd

.TheseBikesAreExpensiveText:
	text_far _BikeShopYoungsterTheseBikesAreExpensiveText
	text_end

.CoolBikeText:
	text_far _BikeShopYoungsterCoolBikeText
	text_end

; PureRGBnote: ADDED: some extra text for things that look like they should be interactable.

BikeShopBasketBikeText:
	text_far _BikeShopBasketBikeText
	text_end

BikeShopToolboxText:
	text_far _BikeShopToolboxText
	text_end

NewBicycleText::
	text_far _NewBicycleText
	text_end

BikeShopSignRightText::
	text_far _BikeShopSignRightText
	text_end

BikeShopSignLeftText::
	text_far _BikeShopSignLeftText
	text_end

BikeShopStatsText::
	text_far _BikeShopStatsText
	text_end

BikeShopArcade1Text::
	text_far _BikeShopArcade1Text
	text_end

BikeShopArcade2Text::
	text_far _BikeShopArcade2Text
	text_end

BikeShopArcade3Text::
	text_far _BikeShopArcade3Text
	text_end