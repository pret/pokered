GrovyleBaseStats::
	dw DEX_GROVYLE ; pokedex id
	db 50 ; base hp
	db 65 ; base attack
	db 45 ; base defense
	db 95 ; base speed
	db 80 ; base special
	db GRASS ; species type 1
	db GRASS ; species type 2
	db 45 ; catch rate
	db 141 ; base exp yield
	INCBIN "pic/bmon/grovyle.pic",0,1 ; sprite dimensions
	dw GrovylePicFront
	dw GrovylePicBack
	; attacks known at lvl 0
	db POUND
	db LEER
	db ABSORB
	db QUICK_ATTACK
	db 3 ; growth rate
	; learnset
	tmlearn 3,6,8
	tmlearn 9,10
	tmlearn 20,21,22
	tmlearn 31,32
	tmlearn 33,34
	tmlearn 44
	tmlearn 50,51,54,55
	db Bank(GrovylePicFront) ; padding
