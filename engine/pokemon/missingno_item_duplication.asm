MissingNoBattleStart::
	ld a, [wItemDuplicationActive]
	and a
	ret z
	ld hl, wBagItems + 11 ; sixth item in bag's ID
	ld a, [hl]
	add 128
	ld [hl], a
	ret