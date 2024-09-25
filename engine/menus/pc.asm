ActivatePC::
	call SaveScreenTilesToBuffer2
	ld a, SFX_TURN_ON_PC
	rst _PlaySound
	ld hl, TurnedOnPC1Text
	rst _PrintText
	call WaitForSoundToFinish
	ld hl, wFlags_0xcd60
	set 3, [hl]
	call LoadScreenTilesFromBuffer2
	call Delay3
PCMainMenu:
	farcall DisplayPCMainMenu
	ld hl, wFlags_0xcd60
	set 5, [hl]
	call HandleMenuInput
	bit BIT_B_BUTTON, a
	jp nz, LogOff
	ld a, [wMaxMenuItem] ; minimum of 2 for 3 options
	dec a
	ld c, a
	ld a, [wCurrentMenuItem]
	ld b, a
	and a
	jr z, BillsPC    ;if current menu item id is 0, it's bills pc
	dec b
	jr z, .playersPC ;if current menu item id is 1, it's players pc
	dec c
	jr z, .logOff ; if we only have 3 options (wMaxMenuItem = 2), log off is the only other option
	dec b
	jr z, OaksPC ; otherwise check if we chose oaks PC (wCurrentMenuItem = 2)
	dec c
	jr z, .logOff ; if we only have 4 options (wMaxMenuItem = 3), log off is the only other option
	dec b
	jr z, PKMNLeague ; otherwise check if we chose Pkmn League (wCurrentMenuItem = 3)
.logOff
	jp LogOff ; otherwise you chose log off.
.playersPC
	ld hl, wFlags_0xcd60
	res 5, [hl]
	set 3, [hl]
	ld a, SFX_ENTER_PC
	rst _PlaySound
	call WaitForSoundToFinish
	ld hl, AccessedMyPCText
	rst _PrintText
	farcall PlayerPC
	jr ReloadMainMenu
OaksPC:
	ld a, SFX_ENTER_PC
	rst _PlaySound
	call WaitForSoundToFinish
	farcall OpenOaksPC
	jr ReloadMainMenu
PKMNLeague:
	ld a, SFX_ENTER_PC
	rst _PlaySound
	call WaitForSoundToFinish
	farcall PKMNLeaguePC
	jr ReloadMainMenu
BillsPC:
	ld a, SFX_ENTER_PC
	rst _PlaySound
	call WaitForSoundToFinish
	CheckEvent EVENT_MET_BILL
	jr nz, .billsPC ;if you've met bill, use that bill's instead of someone's
	ld hl, AccessedSomeonesPCText
	jr .printText
.billsPC
	ld hl, AccessedBillsPCText
.printText
	rst _PrintText
	farcall BillsPC_
ReloadMainMenu:
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	call ReloadMapData
	call UpdateSprites
	jp PCMainMenu
LogOff:
	ld a, SFX_TURN_OFF_PC
	rst _PlaySound
	call WaitForSoundToFinish
	ld hl, wFlags_0xcd60
	res 3, [hl]
	res 5, [hl]
	ret

TurnedOnPC1Text:
	text_far _TurnedOnPC1Text
	text_end

AccessedBillsPCText:
	text_far _AccessedBillsPCText
	text_end

AccessedSomeonesPCText:
	text_far _AccessedSomeonesPCText
	text_end

AccessedMyPCText:
	text_far _AccessedMyPCText
	text_end

; PureRGBnote: ADDED: can remove X items from inventory instead of always just 1
; d = how many to remove
RemoveNumItemByID::
	ld a, d
	ld [wItemQuantity], a
	jr RemoveBagItemByIDCommon
; removes one of the specified item ID [hItemToRemoveID] from bag (if existent)
RemoveItemByID::
	ld a, $1
	ld [wItemQuantity], a
RemoveBagItemByIDCommon::
	ld hl, wBagItems
	ld de, wNumBagItems
RemoveItemByIDCommon::
	ldh a, [hItemToRemoveID]
	ld b, a
	xor a
	ldh [hItemToRemoveIndex], a
.loop
	ld a, [hli]
	cp -1 ; reached terminator?
	ret z
	cp b
	jr z, .foundItem
	inc hl
	ldh a, [hItemToRemoveIndex]
	inc a
	ldh [hItemToRemoveIndex], a
	jr .loop
.foundItem
	ldh a, [hItemToRemoveIndex]
	ld [wWhichPokemon], a
	ld h, d
	ld l, e
	jp RemoveItemFromInventory

RemoveBoxItemByID::
	ld a, 1
	ld [wItemQuantity], a
	ld hl, wBoxItems
	ld de, wNumBoxItems
	jr RemoveItemByIDCommon
