LugiaBaseStats::
	dw DEX_LUGIA ; pokedex id
	db 106 ; base hp
	db 90 ; base attack
	db 130 ; base defense
	db 110 ; base speed
	db 120 ; base special
	db PSYCHIC ; species type 1
	db FLYING ; species type 2
	db 3 ; catch rate
	db 220 ; base exp yield
	INCBIN "pic/bmon/lugia.pic",0,1 ; 55, sprite dimensions
	dw LugiaPicFront
	dw LugiaPicBack
	; attacks known at lvl 0
	db SKY_ATTACK
	db 0
	db 0
	db 0
	db 5 ; growth rate
	; learnset
	tmlearn 2,4,6,8
	tmlearn 10,13,14,15
	tmlearn 20,24
	tmlearn 25,26,29,31,32
	tmlearn 33,34,39
	tmlearn 42,43,44,45
	tmlearn 50,52,53,54
	db Bank(LugiaPicFront) ; padding
