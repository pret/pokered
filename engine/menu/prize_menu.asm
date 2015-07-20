CeladonPrizeMenu: ; 5271b (14:671b)
	ld b,COIN_CASE
	call IsItemInBag
	jr nz,.havingCoinCase
	ld hl,RequireCoinCaseTextPtr
	jp PrintText
.havingCoinCase
	ld hl,wd730
	set 6,[hl] ; disable letter-printing delay
	ld hl,ExchangeCoinsForPrizesTextPtr
	call PrintText
; the following are the menu settings
	xor a
	ld [wCurrentMenuItem],a
	ld [wLastMenuItem],a
	ld a,$03
	ld [wMenuWatchedKeys],a
	ld a,$03
	ld [wMaxMenuItem],a
	ld a,$04
	ld [wTopMenuItemY],a
	ld a,$01
	ld [wTopMenuItemX],a
	call PrintPrizePrice
	coord hl, 0, 2
	ld b,$08
	ld c,$10
	call TextBoxBorder
	call GetPrizeMenuId
	call UpdateSprites
	ld hl,WhichPrizeTextPtr
	call PrintText
	call HandleMenuInput ; menu choice handler
	bit 1,a ; keypress = B (Cancel)
	jr nz,.NoChoice
	ld a,[wCurrentMenuItem]
	cp a,$03 ; "NO,THANKS" choice
	jr z,.NoChoice
	call HandlePrizeChoice
.NoChoice
	ld hl,wd730
	res 6,[hl]
	ret

RequireCoinCaseTextPtr: ; 5277e (14:677e)
	TX_FAR _RequireCoinCaseText
	db $0D
	db "@"

ExchangeCoinsForPrizesTextPtr: ; 52784 (14:6784)
	TX_FAR _ExchangeCoinsForPrizesText
	db "@"

WhichPrizeTextPtr: ; 52789 (14:6789)
	TX_FAR _WhichPrizeText
	db "@"

GetPrizeMenuId: ; 5278e (14:678e)
; determine which one among the three
; prize-texts has been selected
; using the text ID (stored in [hSpriteIndexOrTextID])
; load the three prizes at wd13d-wd13f
; load the three prices at wd141-wd146
; display the three prizes' names
; (distinguishing between Pokemon names
; and Items (specifically TMs) names)
	ld a,[hSpriteIndexOrTextID]
	sub a,$03       ; prize-texts' id are 3, 4 and 5
	ld [wd12f],a    ; prize-texts' id (relative, i.e. 0, 1 or 2)
	add a
	add a
	ld d,$00
	ld e,a
	ld hl,PrizeDifferentMenuPtrs
	add hl,de
	ld a,[hli]
	ld d,[hl]
	ld e,a
	inc hl
	push hl
	ld hl,W_PRIZE1
	call CopyString
	pop hl
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld de,wd141
	ld bc,$0006
	call CopyData
	ld a,[wd12f]
	cp a,$02        ;is TM_menu?
	jr nz,.putMonName
	ld a,[W_PRIZE1]
	ld [wd11e],a
	call GetItemName
	coord hl, 2, 4
	call PlaceString
	ld a,[W_PRIZE2]
	ld [wd11e],a
	call GetItemName
	coord hl, 2, 6
	call PlaceString
	ld a,[W_PRIZE3]
	ld [wd11e],a
	call GetItemName
	coord hl, 2, 8
	call PlaceString
	jr .putNoThanksText
.putMonName
	ld a,[W_PRIZE1]
	ld [wd11e],a
	call GetMonName
	coord hl, 2, 4
	call PlaceString
	ld a,[W_PRIZE2]
	ld [wd11e],a
	call GetMonName
	coord hl, 2, 6
	call PlaceString
	ld a,[W_PRIZE3]
	ld [wd11e],a
	call GetMonName
	coord hl, 2, 8
	call PlaceString
.putNoThanksText
	coord hl, 2, 10
	ld de,NoThanksText
	call PlaceString
; put prices on the right side of the textbox
	ld de,wd141
	coord hl, 13, 5
; reg. c:
; [low nybble] number of bytes
; [bit 765 = %100] space-padding (not zero-padding)
	ld c,(1 << 7 | 2)
; Function $15CD displays BCD value (same routine
; used by text-command $02)
	call PrintBCDNumber
	ld de,wd143
	coord hl, 13, 7
	ld c,(%1 << 7 | 2)
	call PrintBCDNumber
	ld de,wd145
	coord hl, 13, 9
	ld c,(1 << 7 | 2)
	jp PrintBCDNumber

INCLUDE "data/prizes.asm"

PrintPrizePrice: ; 5287a (14:687a)
	coord hl, 11, 0
	ld b,$01
	ld c,$07
	call TextBoxBorder
	call UpdateSprites
	coord hl, 12, 0
	ld de,.CoinText
	call PlaceString
	coord hl, 13, 1
	ld de,.SixSpacesText
	call PlaceString
	coord hl, 13, 1
	ld de,wPlayerCoins
	ld c,%10000010
	call PrintBCDNumber
	ret

.CoinText
	db "COIN@"

.SixSpacesText
	db "      @"

LoadCoinsToSubtract: ; 528b1 (14:68b1)
	ld a,[wd139] ; backup of selected menu_entry
	add a
	ld d,$00
	ld e,a
	ld hl,wd141 ; first prize's price
	add hl,de ; get selected prize's price
	xor a
	ld [hUnusedCoinsByte],a
	ld a,[hli]
	ld [hCoins],a
	ld a,[hl]
	ld [hCoins + 1],a
	ret

HandlePrizeChoice: ; 528c6 (14:68c6)
	ld a,[wCurrentMenuItem] ; selected menu_entry
	ld [wd139],a
	ld d,$00
	ld e,a
	ld hl,W_PRIZE1
	add hl,de
	ld a,[hl]
	ld [wd11e],a
	ld a,[wd12f]
	cp a,$02 ; is prize a TM?
	jr nz,.GetMonName
	call GetItemName
	jr .GivePrize
.GetMonName
	call GetMonName
.GivePrize
	ld hl,SoYouWantPrizeTextPtr
	call PrintText
	call YesNoChoice ; yes/no textbox
	ld a,[wCurrentMenuItem] ; yes/no answer (Y=0, N=1)
	and a
	jr nz,.PrintOhFineThen
	call LoadCoinsToSubtract
	call HasEnoughCoins
	jr c,.NotEnoughCoins
	ld a,[wd12f]
	cp a,$02
	jr nz,.GiveMon
	ld a,[wd11e]
	ld b,a
	ld a,1
	ld c,a
	call GiveItem
	jr nc,.BagFull
	jr .SubtractCoins
.GiveMon
	ld a,[wd11e]
	ld [wcf91],a
	push af
	call GetPrizeMonLevel
	ld c,a
	pop af
	ld b,a
	call GivePokemon

; If either the party or box was full, wait after displaying message.
	push af
	ld a,[wAddedToParty]
	and a
	call z,WaitForTextScrollButtonPress
	pop af

; If the mon couldn't be given to the player (because both the party and box
; were full), return without subtracting coins.
	ret nc

.SubtractCoins
	call LoadCoinsToSubtract
	ld hl,hCoins + 1
	ld de,wPlayerCoins + 1
	ld c,$02 ; how many bytes
	predef SubBCDPredef
	jp PrintPrizePrice
.BagFull
	ld hl,PrizeRoomBagIsFullTextPtr
	jp PrintText
.NotEnoughCoins
	ld hl,SorryNeedMoreCoinsText
	jp PrintText
.PrintOhFineThen
	ld hl,OhFineThenTextPtr
	jp PrintText

UnknownData52951: ; 52951 (14:6951)
; XXX what's this?
	db $00,$01,$00,$01,$00,$01,$00,$00,$01

HereYouGoTextPtr: ; 5295a (14:695a)
	TX_FAR _HereYouGoText
	db $0D
	db "@"

SoYouWantPrizeTextPtr: ; 52960 (14:6960)
	TX_FAR _SoYouWantPrizeText
	db "@"

SorryNeedMoreCoinsText: ; 52965 (14:6965)
	TX_FAR _SorryNeedMoreCoinsText
	db $0D
	db "@"

PrizeRoomBagIsFullTextPtr: ; 5296b (14:696b)
	TX_FAR _OopsYouDontHaveEnoughRoomText
	db $0D
	db "@"

OhFineThenTextPtr: ; 52971 (14:6971)
	TX_FAR _OhFineThenText
	db $0D ; wait keypress (A/B) without blink
	db "@"

GetPrizeMonLevel: ; 52977 (14:6977)
	ld a,[wcf91]
	ld b,a
	ld hl,PrizeMonLevelDictionary
.loop
	ld a,[hli]
	cp b
	jr z,.matchFound
	inc hl
	jr .loop
.matchFound
	ld a,[hl]
	ld [W_CURENEMYLVL],a
	ret

INCLUDE "data/prize_mon_levels.asm"
