LarvitarBaseStats::
	dw DEX_LARVITAR ; pokedex id
	db 50 ; base hp
	db 64 ; base attack
	db 50 ; base defense
	db 41 ; base speed
	db 47 ; base special
	db ROCK ; species type 1
	db GROUND ; species type 2
	db 45 ; catch rate
	db 67 ; base exp yield
	INCBIN "pic/bmon/larvitar.pic",0,1 ; 55, sprite dimensions
	dw LarvitarPicFront
	dw LarvitarPicBack
	; attacks known at lvl 0
	db BITE
	db LEER
	db 0
	db 0
	db 5 ; growth rate
	; learnset
	tmlearn 6,8
	tmlearn 10,15
	tmlearn 20
	tmlearn 26,28,31,32
	tmlearn 34
	tmlearn 44,48
	tmlearn 50
	db Bank(LarvitarPicFront) ; padding
