CeladonPrizeMenu::
	ld b, COIN_CASE
	call IsItemInBag
	jr nz, .havingCoinCase
	ld hl, RequireCoinCaseTextPtr
	jp PrintText
.havingCoinCase
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	ld hl, ExchangeCoinsForPrizesTextPtr
	call PrintText
; the following are the menu settings
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld a, A_BUTTON | B_BUTTON
	ld [wMenuWatchedKeys], a
	ld a, $03
	ld [wMaxMenuItem], a
	ld a, $04
	ld [wTopMenuItemY], a
	ld a, $01
	ld [wTopMenuItemX], a
	call PrintPrizePrice
	hlcoord 0, 2
	ld b, 8
	ld c, 16
	call TextBoxBorder
	call GetPrizeMenuId
	call UpdateSprites
	ld hl, WhichPrizeTextPtr
	call PrintText
	call HandleMenuInput ; menu choice handler
	bit BIT_B_BUTTON, a
	jr nz, .noChoice
	ld a, [wCurrentMenuItem]
	cp 3 ; "NO,THANKS" choice
	jr z, .noChoice
	call HandlePrizeChoice
.noChoice
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	ret

RequireCoinCaseTextPtr:
	text_far _RequireCoinCaseText
	text_waitbutton
	text_end

ExchangeCoinsForPrizesTextPtr:
	text_far _ExchangeCoinsForPrizesText
	text_end

WhichPrizeTextPtr:
	text_far _WhichPrizeText
	text_end

GetPrizeMenuId:
; determine which one among the three prize texts has been selected using the text ID (stored in [hTextID])
; prize texts' IDs are TEXT_GAMECORNERPRIZEROOM_PRIZE_VENDOR_1-TEXT_GAMECORNERPRIZEROOM_PRIZE_VENDOR_3
; load the three prizes at wPrize1-wPrice3
; load the three prices at wPrize1Price-wPrize3Price
; display the three prizes' names, distinguishing between Pokemon names and item names (specifically TMs)
	ldh a, [hTextID]
	sub TEXT_GAMECORNERPRIZEROOM_PRIZE_VENDOR_1
	ld [wWhichPrizeWindow], a ; prize texts' relative ID (i.e. 0-2)
	add a
	add a
	ld d, 0
	ld e, a
	ld hl, PrizeDifferentMenuPtrs
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	inc hl
	push hl
	ld hl, wPrize1
	call CopyString
	pop hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wPrize1Price
	ld bc, 6
	call CopyData
	ld a, [wWhichPrizeWindow]
	cp 2 ; is TM_menu?
	jr nz, .putMonName
	ld a, [wPrize1]
	ld [wNamedObjectIndex], a
	call GetItemName
	hlcoord 2, 4
	call PlaceString
	ld a, [wPrize2]
	ld [wNamedObjectIndex], a
	call GetItemName
	hlcoord 2, 6
	call PlaceString
	ld a, [wPrize3]
	ld [wNamedObjectIndex], a
	call GetItemName
	hlcoord 2, 8
	call PlaceString
	jr .putNoThanksText
.putMonName
	ld a, [wPrize1]
	ld [wNamedObjectIndex], a
	call GetMonName
	hlcoord 2, 4
	call PlaceString
	ld a, [wPrize2]
	ld [wNamedObjectIndex], a
	call GetMonName
	hlcoord 2, 6
	call PlaceString
	ld a, [wPrize3]
	ld [wNamedObjectIndex], a
	call GetMonName
	hlcoord 2, 8
	call PlaceString
.putNoThanksText
	hlcoord 2, 10
	ld de, NoThanksText
	call PlaceString
; put prices on the right side of the textbox
	ld de, wPrize1Price
	hlcoord 13, 5
	ld c, 2 | LEADING_ZEROES
	call PrintBCDNumber
	ld de, wPrize2Price
	hlcoord 13, 7
	ld c, 2 | LEADING_ZEROES
	call PrintBCDNumber
	ld de, wPrize3Price
	hlcoord 13, 9
	ld c, 2 | LEADING_ZEROES
	jp PrintBCDNumber

INCLUDE "data/events/prizes.asm"

PrintPrizePrice:
	hlcoord 11, 0
	ld b, 1
	ld c, 7
	call TextBoxBorder
	call UpdateSprites
	hlcoord 12, 0
	ld de, .CoinString
	call PlaceString
	hlcoord 13, 1
	ld de, .SixSpacesString
	call PlaceString
	hlcoord 13, 1
	ld de, wPlayerCoins
	ld c, 2 | LEADING_ZEROES
	call PrintBCDNumber
	ret

.CoinString:
	db "COIN@"

.SixSpacesString:
	db "      @"

LoadCoinsToSubtract:
	ld a, [wWhichPrize]
	add a
	ld d, 0
	ld e, a
	ld hl, wPrize1Price
	add hl, de ; get selected prize's price
	xor a
	ldh [hUnusedCoinsByte], a
	ld a, [hli]
	ldh [hCoins], a
	ld a, [hl]
	ldh [hCoins + 1], a
	ret

HandlePrizeChoice:
	ld a, [wCurrentMenuItem]
	ld [wWhichPrize], a
	ld d, 0
	ld e, a
	ld hl, wPrize1
	add hl, de
	ld a, [hl]
	ld [wNamedObjectIndex], a
	ld a, [wWhichPrizeWindow]
	cp 2 ; is prize a TM?
	jr nz, .getMonName
	call GetItemName
	jr .givePrize
.getMonName
	call GetMonName
.givePrize
	ld hl, SoYouWantPrizeTextPtr
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem] ; yes/no answer (Y=0, N=1)
	and a
	jr nz, .printOhFineThen
	call LoadCoinsToSubtract
	call HasEnoughCoins
	jr c, .notEnoughCoins
	ld a, [wWhichPrizeWindow]
	cp 2 ; is prize a TM?
	jr nz, .giveMon
	ld a, [wNamedObjectIndex]
	ld b, a
	ld a, 1
	ld c, a
	call GiveItem
	jr nc, .bagFull
	jr .subtractCoins
.giveMon
	ld a, [wNamedObjectIndex]
	ld [wCurPartySpecies], a
	push af
	call GetPrizeMonLevel
	ld c, a
	pop af
	ld b, a
	call GivePokemon

; If either the party or box was full, wait after displaying message.
	push af
	ld a, [wAddedToParty]
	and a
	call z, WaitForTextScrollButtonPress
	pop af

; If the mon couldn't be given to the player (because both the party and box
; were full), return without subtracting coins.
	ret nc

.subtractCoins
	call LoadCoinsToSubtract
	ld hl, hCoins + 1
	ld de, wPlayerCoins + 1
	ld c, $02 ; how many bytes
	predef SubBCDPredef
	jp PrintPrizePrice
.bagFull
	ld hl, PrizeRoomBagIsFullTextPtr
	jp PrintText
.notEnoughCoins
	ld hl, SorryNeedMoreCoinsText
	jp PrintText
.printOhFineThen
	ld hl, OhFineThenTextPtr
	jp PrintText

UnknownPrizeData:
; XXX what's this?
	db $00,$01,$00,$01,$00,$01,$00,$00,$01

HereYouGoTextPtr:
	text_far _HereYouGoText
	text_waitbutton
	text_end

SoYouWantPrizeTextPtr:
	text_far _SoYouWantPrizeText
	text_end

SorryNeedMoreCoinsText:
	text_far _SorryNeedMoreCoinsText
	text_waitbutton
	text_end

PrizeRoomBagIsFullTextPtr:
	text_far _OopsYouDontHaveEnoughRoomText
	text_waitbutton
	text_end

OhFineThenTextPtr:
	text_far _OhFineThenText
	text_waitbutton
	text_end

GetPrizeMonLevel:
	ld a, [wCurPartySpecies]
	ld b, a
	ld hl, PrizeMonLevelDictionary
.loop
	ld a, [hli]
	cp b
	jr z, .matchFound
	inc hl
	jr .loop
.matchFound
	ld a, [hl]
	ld [wCurEnemyLevel], a
	ret

INCLUDE "data/events/prize_mon_levels.asm"
