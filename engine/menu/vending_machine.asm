VendingMachineMenu: ; 74ee0 (1d:4ee0)
	ld hl, VendingMachineText1
	call PrintText
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
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
	coord hl, 0, 3
	ld b, 8
	ld c, 12
	call TextBoxBorder
	call UpdateSprites
	coord hl, 2, 5
	ld de, DrinkText
	call PlaceString
	coord hl, 9, 6
	ld de, DrinkPriceText
	call PlaceString
	ld hl, wd730
	res 6, [hl]
	call HandleMenuInput
	bit 1, a ; pressed B?
	jr nz, .notThirsty
	ld a, [wCurrentMenuItem]
	cp 3 ; chose Cancel?
	jr z, .notThirsty
	xor a
	ld [hMoney], a
	ld [hMoney + 2], a
	ld a, $2
	ld [hMoney + 1], a
	call HasEnoughMoney
	jr nc, .enoughMoney
	ld hl, VendingMachineText4
	jp PrintText
.enoughMoney
	call LoadVendingMachineItem
	ld a, [hVendingMachineItem]
	ld b, a
	ld c, 1
	call GiveItem
	jr nc, .BagFull

	ld b, 60 ; number of times to play the "brrrrr" sound
.playDeliverySound
	ld c, 2
	call DelayFrames
	push bc
	ld a, SFX_PUSH_BOULDER
	call PlaySound
	pop bc
	dec b
	jr nz, .playDeliverySound

	ld hl, VendingMachineText5
	call PrintText
	ld hl, hVendingMachinePrice + 2
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	jp DisplayTextBoxID
.BagFull
	ld hl, VendingMachineText6
	jp PrintText
.notThirsty
	ld hl, VendingMachineText7
	jp PrintText

VendingMachineText1: ; 74f99 (1d:4f99)
	TX_FAR _VendingMachineText1
	db "@"

DrinkText: ; 74f9e (1d:4f9e)
	db   "FRESH WATER"
	next "SODA POP"
	next "LEMONADE"
	next "CANCEL@"

DrinkPriceText: ; 74fc3 (1d:4fc3)
	db   "¥200"
	next "¥300"
	next "¥350",$4E,"@"

VendingMachineText4: ; 74fd3 (1d:4fd3)
	TX_FAR _VendingMachineText4
	db "@"

VendingMachineText5: ; 74fd8 (1d:4fd8)
	TX_FAR _VendingMachineText5
	db "@"

VendingMachineText6: ; 74fdd (1d:4fdd)
	TX_FAR _VendingMachineText6
	db "@"

VendingMachineText7: ; 74fe2 (1d:4fe2)
	TX_FAR _VendingMachineText7
	db "@"

LoadVendingMachineItem: ; 74fe7 (1d:4fe7)
	ld hl, VendingPrices
	ld a, [wCurrentMenuItem]
	add a
	add a
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hli]
	ld [hVendingMachineItem], a
	ld a, [hli]
	ld [hVendingMachinePrice], a
	ld a, [hli]
	ld [hVendingMachinePrice + 1], a
	ld a, [hl]
	ld [hVendingMachinePrice + 2], a
	ret

VendingPrices: ; 75000 (1d:5000)
	db FRESH_WATER,$00,$02,$00
	db SODA_POP,   $00,$03,$00
	db LEMONADE,   $00,$03,$50
