RemoveGuardDrink:
	ld hl, GuardDrinksList
.drinkLoop
	ld a, [hli]
	ld [$ffdb], a
	and a
	ret z
	push hl
	ld b, a
	call IsItemInBag
	pop hl
	jr z, .drinkLoop
	jpba RemoveItemByID

INCLUDE "data/guard_drink_items.asm"
