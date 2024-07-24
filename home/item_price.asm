GetItemPrice::
; Stores item's price as BCD at hItemPrice (3 bytes)
; Input: [wCurItem] = item id
	ldh a, [hLoadedROMBank]
	push af
	ld a, [wListMenuID]
	cp MOVESLISTMENU
	ld a, BANK(ItemPrices)
	jr nz, .ok
	ld a, $f ; hardcoded Bank
.ok
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ld hl, wItemPrices
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wCurItem]
	cp HM01
	jr nc, .getTMPrice
	ld bc, $3
.loop
	add hl, bc
	dec a
	jr nz, .loop
	dec hl
	ld a, [hld]
	ldh [hItemPrice + 2], a
	ld a, [hld]
	ldh [hItemPrice + 1], a
	ld a, [hl]
	ldh [hItemPrice], a
	jr .done
.getTMPrice
	ld a, BANK(GetMachinePrice)
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	call GetMachinePrice
.done
	ld de, hItemPrice
	pop af
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ret
