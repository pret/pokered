SkarmoryBaseStats::
	dw DEX_SKARMORY ; pokedex id
	db 65 ; base hp
	db 80 ; base attack
	db 140 ; base defense
	db 75 ; base speed
	db 55 ; base special
	db STEEL ; species type 1
	db FLYING ; species type 2
	db 25 ; catch rate
	db 168 ; base exp yield
	INCBIN "pic/bmon/skarmory.pic",0,1 ; sprite dimensions
	dw SkarmoryPicFront
	dw SkarmoryPicBack
	; attacks known at lvl 0
	db LEER
	db PECK
	db 0
	db 0
	db 5 ; growth rate
	; learnset
	tmlearn 2,4,6
	tmlearn 9,10,15
	tmlearn 20
	tmlearn 31,32
	tmlearn 34,39
	tmlearn 43,44
	tmlearn 50,52
	db Bank(SkarmoryPicFront) ; padding
