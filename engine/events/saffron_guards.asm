RemoveGuardDrink::
	ld hl, GuardDrinksList
.drinkLoop
	ld a, [hli]
	ldh [hItemToRemoveID], a
	and a
	ret z
	push hl
	ld b, a
	call IsItemInBag
	pop hl
	jr z, .drinkLoop
	farjp RemoveItemByID

INCLUDE "data/items/guard_drink_items.asm"
