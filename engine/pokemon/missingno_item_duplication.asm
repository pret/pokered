; PureRGBnote: ADDED: code for performing item duplication "glitch" when encountering missingno.
; except now it's intended functionality
; it only triggers if we have watched the old man catch a pokemon since the last time we turned the game on before encountering missingno.
MissingNoBattleStart::
	ld a, [wItemDuplicationActive]
	and a
	ret z
	ld hl, wBagItems + 11 ; sixth item in bag's quantity
	set 7, [hl] ; adds 128 to the quantity, if you don't already have 128.
	ret