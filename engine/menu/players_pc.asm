PlayerPC: ; 78e6 (1:78e6)
	ld hl, $d730
	set 6, [hl]
	ld a, ITEM_NAME
	ld [W_LISTTYPE], a
	call SaveScreenTilesToBuffer1
	xor a
	ld [$cc2c], a
	ld [$ccd3], a
	ld a, [wFlags_0xcd60]
	bit 3, a
	jr nz, Func_790c
	ld a, (SFX_02_45 - SFX_Headers_02) / 3
	call PlaySound
	ld hl, TurnedOnPC2Text
	call PrintText

Func_790c: ; 790c (1:790c)
	ld a, [$ccd3]
	ld [wCurrentMenuItem], a ; $cc26
	ld hl, wFlags_0xcd60
	set 5, [hl]
	call LoadScreenTilesFromBuffer2
	ld hl, wTileMap
	ld b, $8
	ld c, $e
	call TextBoxBorder
	call UpdateSprites
	FuncCoord 2, 2 ; $c3ca
	ld hl, Coord
	ld de, PlayersPCMenuEntries ; $7af5
	call PlaceString
	ld hl, wTopMenuItemY ; $cc24
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
	ld hl, wListScrollOffset ; $cc36
	ld [hli], a
	ld [hl], a
	ld [wPlayerMonNumber], a ; $cc2f
	ld hl, WhatDoYouWantText
	call PrintText
	call HandleMenuInput
	bit 1, a
	jp nz, Func_796d
	call PlaceUnfilledArrowMenuCursor
	ld a, [wCurrentMenuItem] ; $cc26
	ld [$ccd3], a
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
	ld [wListScrollOffset], a ; $cc36
	ld [$cc2c], a
	ld hl, $d730
	res 6, [hl]
	xor a
	ld [$cc3c], a
	ret

Func_7995: ; 7995 (1:7995)
	xor a
	ld [wCurrentMenuItem], a ; $cc26
	ld [wListScrollOffset], a ; $cc36
	ld a, [wNumBagItems] ; $d31d
	and a
	jr nz, Func_79ab
	ld hl, NothingToDepositText
	call PrintText
	jp Func_790c

Func_79ab: ; 79ab (1:79ab)
	ld hl, WhatToDepositText
	call PrintText
	ld hl, wNumBagItems ; $d31d
	ld a, l
	ld [$cf8b], a
	ld a, h
	ld [$cf8c], a
	xor a
	ld [$cf93], a
	ld a, $3
	ld [wListMenuID], a ; $cf94
	call DisplayListMenuID
	jp c, Func_790c
	call IsKeyItem
	ld a, $1
	ld [$cf96], a
	ld a, [$d124]
	and a
	jr nz, .asm_79e7
	ld hl, DepositHowManyText
	call PrintText
	call DisplayChooseQuantityMenu
	cp $ff
	jp z, Func_79ab
.asm_79e7
	ld hl, wNumBoxItems ; $d53a
	call AddItemToInventory
	jr c, .asm_79f8
	ld hl, NoRoomToStoreText
	call PrintText
	jp Func_79ab
.asm_79f8
	ld hl, wNumBagItems ; $d31d
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
	ld [wCurrentMenuItem], a ; $cc26
	ld [wListScrollOffset], a ; $cc36
	ld a, [wNumBoxItems] ; $d53a
	and a
	jr nz, Func_7a28
	ld hl, NothingStoredText
	call PrintText
	jp Func_790c

Func_7a28: ; 7a28 (1:7a28)
	ld hl, WhatToWithdrawText
	call PrintText
	ld hl, wNumBoxItems ; $d53a
	ld a, l
	ld [$cf8b], a
	ld a, h
	ld [$cf8c], a
	xor a
	ld [$cf93], a
	ld a, $3
	ld [wListMenuID], a ; $cf94
	call DisplayListMenuID
	jp c, Func_790c
	call IsKeyItem
	ld a, $1
	ld [$cf96], a
	ld a, [$d124]
	and a
	jr nz, .asm_7a64
	ld hl, WithdrawHowManyText
	call PrintText
	call DisplayChooseQuantityMenu
	cp $ff
	jp z, Func_7a28
.asm_7a64
	ld hl, wNumBagItems ; $d31d
	call AddItemToInventory
	jr c, .asm_7a75
	ld hl, CantCarryMoreText
	call PrintText
	jp Func_7a28
.asm_7a75
	ld hl, wNumBoxItems ; $d53a
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
	ld [wCurrentMenuItem], a ; $cc26
	ld [wListScrollOffset], a ; $cc36
	ld a, [wNumBoxItems] ; $d53a
	and a
	jr nz, Func_7aa5
	ld hl, NothingStoredText
	call PrintText
	jp Func_790c

Func_7aa5: ; 7aa5 (1:7aa5)
	ld hl, WhatToTossText
	call PrintText
	ld hl, wNumBoxItems ; $d53a
	ld a, l
	ld [$cf8b], a
	ld a, h
	ld [$cf8c], a
	xor a
	ld [$cf93], a
	ld a, $3
	ld [wListMenuID], a ; $cf94
	push hl
	call DisplayListMenuID
	pop hl
	jp c, Func_790c
	push hl
	call IsKeyItem
	pop hl
	ld a, $1
	ld [$cf96], a
	ld a, [$d124]
	and a
	jr nz, .asm_7aef
	ld a, [$cf91]
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
