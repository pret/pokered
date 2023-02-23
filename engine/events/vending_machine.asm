; PureRGBnote: ADDED: vending machine code was updated to have rare candy available in one specific secret vending machine

VendingMachineMenu::
	ld hl, VendingMachineText1
	rst PrintTextRST
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld [wTempFlag0], a
.vendingStart	
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld a, A_BUTTON | B_BUTTON
	ld [wMenuWatchedKeys], a
	ld a, 3
	ld [wMaxMenuItem], a
	ld a, 5
	ld [wTopMenuItemY], a
	ld a, 1
	ld [wTopMenuItemX], a
	ld hl, wd730
	set 6, [hl]
	hlcoord 0, 3
	ld b, 8
	ld c, 12
	call TextBoxBorder
	call UpdateSprites
	hlcoord 2, 5	
	ld a, [wCurMap]
	cp CERULEAN_ROCKET_HOUSE_B1F
	jr z, .rareCandyText
.defaultText
	ld de, DrinkText
	call PlaceString
	hlcoord 9, 6
	ld de, DrinkPriceText
	call PlaceString
	jr .menu
.rareCandyText
	ld de, DrinkText2
	call PlaceString
	hlcoord 8, 6
	ld de, DrinkPriceText2
	call PlaceString
.menu
	ld hl, wd730
	res 6, [hl]
	call HandleMenuInput
	bit BIT_B_BUTTON, a
	jp nz, .notThirsty
	ld a, [wCurrentMenuItem]
	cp 3 ; chose Cancel?
	jp z, .notThirsty
	ld a, [wCurMap]
	cp CERULEAN_ROCKET_HOUSE_B1F
	jr z, .checkItemsRareCandy
.checkItemsDefault
	ld a, [wCurrentMenuItem]
;PureRGBnote: FIXED: need to account for soda and lemonade when checking if player has enough cash - originally it only checked for fresh water's amount.
	cp 2 ; chose lemonade?
	jr z, .picklemonade
	cp 1 ; chose soda?
	jr z, .picksoda
;else water is being picked
	jr .pickwater
.checkItemsRareCandy
	ld a, [wCurrentMenuItem]
	cp 2 ; chose rare candy?
	jr z, .pickrarecandy
	cp 1 ; chose lemonade?
	jr z, .picklemonade
;else soda is being picked
	jr .picksoda
.picklemonade
	xor a
	ld [hMoney], a
	ld a, $5
	ld [hMoney + 2], a
	ld a, $3
	ld [hMoney + 1], a
	jr .checkMoney
.picksoda
	xor a
	ld [hMoney], a
	ld [hMoney + 2], a
	ld a, $3
	ld [hMoney + 1], a
	jr .checkMoney
.pickwater
	xor a
	ld [hMoney], a
	ld [hMoney + 2], a
	ld a, $2
	ld [hMoney + 1], a
	jr .checkMoney
.pickrarecandy
	xor a
	ld [hMoney], a
	ld [hMoney + 2], a
	ld a, $20
	ld [hMoney + 1], a
.checkMoney
	call HasEnoughMoney
	jr nc, .enoughMoney
	ld hl, VendingMachineText4
	jp PrintText
.enoughMoney
	call LoadVendingMachineItem
	ldh a, [hVendingMachineItem]
	ld b, a
	ld c, 1
	call GiveItem
	jr nc, .BagFull
	ld a, [wCurMap]
	ld b, 60 ; number of times to play the "brrrrr" sound
	cp CERULEAN_ROCKET_HOUSE_B1F
	jr nz, .playDeliverySound
	ld b, 5 ; shorter for the rarecandy machine
.playDeliverySound
	ld c, 2
	rst DelayFramesRST
	push bc
	ld a, SFX_PUSH_BOULDER
	rst PlaySoundRST
	pop bc
	dec b
	jr nz, .playDeliverySound

	ld hl, VendingMachineText5
	rst PrintTextRST
	ld hl, hVendingMachinePrice + 2
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
	ld a, 1
	ld [wTempFlag0], a ; marks what text to display in the end
	jp .vendingStart ; PureRGBnote: FIXED: don't make the player repeatedly open the vending machine dialogue after buying something
.BagFull
	ld hl, VendingMachineText6
	jr .done
.notThirsty
	ld a, [wTempFlag0]
	and a
	jr nz, .thatsEnough
	ld hl, VendingMachineText7
	jr .done
.thatsEnough
	ld hl, VendingMachineText8
.done
	rst PrintTextRST
	xor a
	ld [wTempFlag0], a
	ret

VendingMachineText1:
	text_far _VendingMachineText1
	text_end

DrinkText:
	db   "FRESH WATER"
	next "SODA POP"
	next "LEMONADE"
	next "CANCEL@"

DrinkPriceText:
	db   "¥200"
	next "¥300"
	next "¥350"
	next "@"

DrinkText2:
	db   "SODA POP"
	next "LEMONADE"
	next "RARE CANDY"
	next "CANCEL@"

DrinkPriceText2:
	db " ¥300"
	next " ¥350"
	next "¥2000"
	next "@"

VendingMachineText4:
	text_far _VendingMachineText4
	text_end

VendingMachineText5:
	text_far _VendingMachineText5
	text_end

VendingMachineText6:
	text_far _VendingMachineText6
	text_end

VendingMachineText7:
	text_far _VendingMachineText7
	text_end

VendingMachineText8:
	text_far _VendingMachineText8
	text_end

LoadVendingMachineItem:
	ld hl, VendingPrices
	ld a, [wCurMap]
	and a
	cp CERULEAN_ROCKET_HOUSE_B1F
	jr nz, .noInc
	ld a, [wCurrentMenuItem]
	inc a ; go 1 down the list of prices so we can get rare candies at index 3
	jr .finish
.noInc
	ld a, [wCurrentMenuItem]
.finish
	add a
	add a
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hli]
	ldh [hVendingMachineItem], a
	ld a, [hli]
	ldh [hVendingMachinePrice], a
	ld a, [hli]
	ldh [hVendingMachinePrice + 1], a
	ld a, [hl]
	ldh [hVendingMachinePrice + 2], a
	ret

INCLUDE "data/items/vending_prices.asm"
