; also used alongside [wPseudoItemID]
UseItem::
	farjp UseItem_

TossItem::
	ldh a, [hLoadedROMBank]
	push af
	ld a, BANK(TossItem_)
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	call TossItem_
	pop de
	ld a, d
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ret

IsKeyItem::
	push hl
	push de
	push bc
	farcall IsKeyItem_
	pop bc
	pop de
	pop hl
	ret
