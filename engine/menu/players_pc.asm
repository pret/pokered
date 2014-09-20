PlayerPC: ; 78e6 (1:78e6)
	ld hl, wd730
	set 6, [hl]
	ld a, ITEM_NAME
	ld [W_LISTTYPE], a
	call SaveScreenTilesToBuffer1
	xor a
	ld [wcc2c], a
	ld [wccd3], a
	ld a, [wFlags_0xcd60]
	bit 3, a
	jr nz, Func_790c
	ld a, (SFX_02_45 - SFX_Headers_02) / 3
	call PlaySound
	ld hl, TurnedOnPC2Text
	call PrintText

Func_790c: ; 790c (1:790c)
	ld a, [wccd3]
	ld [wCurrentMenuItem], a ; wCurrentMenuItem
	ld hl, wFlags_0xcd60
	set 5, [hl]
	call LoadScreenTilesFromBuffer2
	ld hl, wTileMap
	ld b, $8
	ld c, $e
	call TextBoxBorder
	call UpdateSprites
	hlCoord 2, 2
	ld de, PlayersPCMenuEntries ; $7af5
	call PlaceString
	ld hl, wTopMenuItemY ; wTopMenuItemY
	ld a, $2
	ld [hli], a
	dec a
	ld [hli], a
	inc hl
	inc hl
	ld a, $3
	ld [hli], a
	ld a, $3
	ld [hli], a
	xor a
	ld [hl], a
	ld hl, wListScrollOffset ; wcc36
	ld [hli], a
	ld [hl], a
	ld [wPlayerMonNumber], a ; wPlayerMonNumber
	ld hl, WhatDoYouWantText
	call PrintText
	call HandleMenuInput
	bit 1, a
	jp nz, Func_796d
	call PlaceUnfilledArrowMenuCursor
	ld a, [wCurrentMenuItem] ; wCurrentMenuItem
	ld [wccd3], a
	and a
	jp z, Func_7a12
	dec a
	jp z, Func_7995
	dec a
	jp z, Func_7a8f

Func_796d: ; 796d (1:796d)
	ld a, [wFlags_0xcd60]
	bit 3, a
	jr nz, .asm_797c
	ld a, (SFX_02_46 - SFX_Headers_02) / 3
	call PlaySound
	call WaitForSoundToFinish
.asm_797c
	ld hl, wFlags_0xcd60
	res 5, [hl]
	call LoadScreenTilesFromBuffer2
	xor a
	ld [wListScrollOffset], a ; wcc36
	ld [wcc2c], a
	ld hl, wd730
	res 6, [hl]
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ret

Func_7995: ; 7995 (1:7995)
	xor a
	ld [wCurrentMenuItem], a ; wCurrentMenuItem
	ld [wListScrollOffset], a ; wcc36
	ld a, [wNumBagItems] ; wNumBagItems
	and a
	jr nz, Func_79ab
	ld hl, NothingToDepositText
	call PrintText
	jp Func_790c

Func_79ab: ; 79ab (1:79ab)
	ld hl, WhatToDepositText
	call PrintText
	ld hl, wNumBagItems ; wNumBagItems
	ld a, l
	ld [wcf8b], a
	ld a, h
	ld [wcf8c], a
	xor a
	ld [wcf93], a
	ld a, $3
	ld [wListMenuID], a ; wListMenuID
	call DisplayListMenuID
	jp c, Func_790c
	call IsKeyItem
	ld a, $1
	ld [wcf96], a
	ld a, [wd124]
	and a
	jr nz, .asm_79e7
	ld hl, DepositHowManyText
	call PrintText
	call DisplayChooseQuantityMenu
	cp $ff
	jp z, Func_79ab
.asm_79e7
	ld hl, wNumBoxItems ; wNumBoxItems
	call AddItemToInventory
	jr c, .asm_79f8
	ld hl, NoRoomToStoreText
	call PrintText
	jp Func_79ab
.asm_79f8
	ld hl, wNumBagItems ; wNumBagItems
	call RemoveItemFromInventory
	call WaitForSoundToFinish
	ld a, (SFX_02_55 - SFX_Headers_02) / 3
	call PlaySound
	call WaitForSoundToFinish
	ld hl, ItemWasStoredText
	call PrintText
	jp Func_79ab

Func_7a12: ; 7a12 (1:7a12)
	xor a
	ld [wCurrentMenuItem], a ; wCurrentMenuItem
	ld [wListScrollOffset], a ; wcc36
	ld a, [wNumBoxItems] ; wNumBoxItems
	and a
	jr nz, Func_7a28
	ld hl, NothingStoredText
	call PrintText
	jp Func_790c

Func_7a28: ; 7a28 (1:7a28)
	ld hl, WhatToWithdrawText
	call PrintText
	ld hl, wNumBoxItems ; wNumBoxItems
	ld a, l
	ld [wcf8b], a
	ld a, h
	ld [wcf8c], a
	xor a
	ld [wcf93], a
	ld a, $3
	ld [wListMenuID], a ; wListMenuID
	call DisplayListMenuID
	jp c, Func_790c
	call IsKeyItem
	ld a, $1
	ld [wcf96], a
	ld a, [wd124]
	and a
	jr nz, .asm_7a64
	ld hl, WithdrawHowManyText
	call PrintText
	call DisplayChooseQuantityMenu
	cp $ff
	jp z, Func_7a28
.asm_7a64
	ld hl, wNumBagItems ; wNumBagItems
	call AddItemToInventory
	jr c, .asm_7a75
	ld hl, CantCarryMoreText
	call PrintText
	jp Func_7a28
.asm_7a75
	ld hl, wNumBoxItems ; wNumBoxItems
	call RemoveItemFromInventory
	call WaitForSoundToFinish
	ld a, (SFX_02_55 - SFX_Headers_02) / 3
	call PlaySound
	call WaitForSoundToFinish
	ld hl, WithdrewItemText
	call PrintText
	jp Func_7a28

Func_7a8f: ; 7a8f (1:7a8f)
	xor a
	ld [wCurrentMenuItem], a ; wCurrentMenuItem
	ld [wListScrollOffset], a ; wcc36
	ld a, [wNumBoxItems] ; wNumBoxItems
	and a
	jr nz, Func_7aa5
	ld hl, NothingStoredText
	call PrintText
	jp Func_790c

Func_7aa5: ; 7aa5 (1:7aa5)
	ld hl, WhatToTossText
	call PrintText
	ld hl, wNumBoxItems ; wNumBoxItems
	ld a, l
	ld [wcf8b], a
	ld a, h
	ld [wcf8c], a
	xor a
	ld [wcf93], a
	ld a, $3
	ld [wListMenuID], a ; wListMenuID
	push hl
	call DisplayListMenuID
	pop hl
	jp c, Func_790c
	push hl
	call IsKeyItem
	pop hl
	ld a, $1
	ld [wcf96], a
	ld a, [wd124]
	and a
	jr nz, .asm_7aef
	ld a, [wcf91]
	call IsItemHM
	jr c, .asm_7aef
	push hl
	ld hl, TossHowManyText
	call PrintText
	call DisplayChooseQuantityMenu
	pop hl
	cp $ff
	jp z, Func_7aa5
.asm_7aef
	call TossItem
	jp Func_7aa5

PlayersPCMenuEntries: ; 7af5 (1:7af5)
	db   "WITHDRAW ITEM"
	next "DEPOSIT ITEM"
	next "TOSS ITEM"
	next "LOG OFF@"

TurnedOnPC2Text: ; 7b22 (1:7b22)
	TX_FAR _TurnedOnPC2Text
	db "@"

WhatDoYouWantText: ; 7b27 (1:7b27)
	TX_FAR _WhatDoYouWantText
	db "@"

WhatToDepositText: ; 7b2c (1:7b2c)
	TX_FAR _WhatToDepositText
	db "@"

DepositHowManyText: ; 7b31 (1:7b31)
	TX_FAR _DepositHowManyText
	db "@"

ItemWasStoredText: ; 7b36 (1:7b36)
	TX_FAR _ItemWasStoredText
	db "@"

NothingToDepositText: ; 7b3b (1:7b3b)
	TX_FAR _NothingToDepositText
	db "@"

NoRoomToStoreText: ; 7b40 (1:7b40)
	TX_FAR _NoRoomToStoreText
	db "@"

WhatToWithdrawText: ; 7b45 (1:7b45)
	TX_FAR _WhatToWithdrawText
	db "@"

WithdrawHowManyText: ; 7b4a (1:7b4a)
	TX_FAR _WithdrawHowManyText
	db "@"

WithdrewItemText: ; 7b4f (1:7b4f)
	TX_FAR _WithdrewItemText
	db "@"

NothingStoredText: ; 7b54 (1:7b54)
	TX_FAR _NothingStoredText
	db "@"

CantCarryMoreText: ; 7b59 (1:7b59)
	TX_FAR _CantCarryMoreText
	db "@"

WhatToTossText: ; 7b5e (1:7b5e)
	TX_FAR _WhatToTossText
	db "@"

TossHowManyText: ; 7b63 (1:7b63)
	TX_FAR _TossHowManyText
	db "@"
