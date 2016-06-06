PupitarBaseStats::
	dw DEX_PUPITAR ; pokedex id
	db 70 ; base hp
	db 84 ; base attack
	db 70 ; base defense
	db 51 ; base speed
	db 67 ; base special
	db ROCK ; species type 1
	db GROUND ; species type 2
	db 45 ; catch rate
	db 144 ; base exp yield
	INCBIN "pic/bmon/pupitar.pic",0,1 ; 55, sprite dimensions
	dw PupitarPicFront
	dw PupitarPicBack
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
	db Bank(PupitarPicFront) ; padding
