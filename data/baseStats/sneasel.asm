SneaselBaseStats::
	dw DEX_SNEASEL ; pokedex id
	db 55 ; base hp
	db 95 ; base attack
	db 55 ; base defense
	db 115 ; base speed
	db 55 ; base special
	db DARK ; species type 1
	db ICE ; species type 2
	db 60 ; catch rate
	db 132 ; base exp yield
	INCBIN "pic/bmon/sneasel.pic",0,1 ; 66, sprite dimensions
	dw SneaselPicFront
	dw SneaselPicBack
	; attacks known at lvl 0
	db SCRATCH
	db LEER
	db 0
	db 0
	db 3 ; growth rate
	; learnset
	tmlearn 6
	tmlearn 9,10,11,12,13,14,15
	tmlearn 20
	tmlearn 30,31,32
	tmlearn 33,34,36,39
	tmlearn 44,47
	tmlearn 49,50,53
	db Bank(SneaselPicFront) ; padding
