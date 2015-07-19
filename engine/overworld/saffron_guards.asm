RemoveGuardDrink: ; 5a59f (16:659f)
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

GuardDrinksList: ; 5a5b7 (16:65b7)
	db FRESH_WATER, SODA_POP, LEMONADE, $00
