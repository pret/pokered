QuilavaBaseStats::
	dw DEX_QUILAVA ; pokedex id
	db 58 ; base hp
	db 64 ; base attack
	db 58 ; base defense
	db 80 ; base speed
	db 73 ; base special
	db FIRE ; species type 1
	db FIRE ; species type 2
	db 45 ; catch rate
	db 142 ; base exp yield
	INCBIN "pic/bmon/quilava.pic",0,1 ; sprite dimensions
	dw QuilavaPicFront
	dw QuilavaPicBack
	; attacks known at lvl 0
	db TACKLE
	db LEER
	db SAND_ATTACK
	db 0
	db 3 ; growth rate
	; learnset
	tmlearn 6,8
	tmlearn 10
	tmlearn 0
	tmlearn 28,31,32
	tmlearn 34,38,39
	tmlearn 44
	tmlearn 50,51
	db Bank(QuilavaPicFront) ; padding
