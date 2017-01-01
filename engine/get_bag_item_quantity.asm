GetQuantityOfItemInBag:
; In: b = item ID
; Out: b = how many of that item are in the bag
	call GetPredefRegisters
	ld hl, wNumBagItems
.loop
	inc hl
	ld a, [hli]
	cp $ff
	jr z, .notInBag
	cp b
	jr nz, .loop
	ld a, [hl]
	ld b, a
	ret
.notInBag
	ld b, 0
	ret
