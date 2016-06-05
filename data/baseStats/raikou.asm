RaikouBaseStats::
	dw DEX_RAIKOU ; pokedex id
	db 90 ; base hp
	db 85 ; base attack
	db 75 ; base defense
	db 115 ; base speed
	db 107 ; base special
	db ELECTRIC ; species type 1
	db ELECTRIC ; species type 2
	db 3 ; catch rate
	db 216 ; base exp yield
	INCBIN "pic/bmon/raikou.pic",0,1 ; 55, sprite dimensions
	dw RaikouPicFront
	dw RaikouPicBack
	; attacks known at lvl 0
	db BITE
	db LEER
	db 0
	db 0
	db 5 ; growth rate
	; learnset
	tmlearn 6,8
	tmlearn 10,15
	tmlearn 20,24
	tmlearn 25,28,31,32
	tmlearn 33,34,39
	tmlearn 44,45
	tmlearn 50,51,54,55
	db Bank(RaikouPicFront) ; padding
