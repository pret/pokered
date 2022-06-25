MissingNoBattleStart::
	ld a, [wItemDuplicationActive]
	and a
	ret z
	ld hl, wBagItems + 11 ; sixth item in bag's quantity
	set 7, [hl] ; adds 128 to the quantity, if you don't already have 128.
	ret