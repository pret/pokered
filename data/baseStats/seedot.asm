SeedotBaseStats::
	dw DEX_SEEDOT ; pokedex id
	db 40 ; base hp
	db 40 ; base attack
	db 50 ; base defense
	db 30 ; base speed
	db 30 ; base special
	db GRASS ; species type 1
	db GRASS ; species type 2
	db 255 ; catch rate
	db 74 ; base exp yield
	INCBIN "pic/bmon/seedot.pic",0,1
	dw SeedotPicFront
	dw SeedotPicBack
	; attacks known at lvl 0
	db BIDE
	db 0
	db 0
	db 0
	db 3 ; growth rate
	; learnset
	tmlearn 2,3,6,8
	tmlearn 9,10
	tmlearn 21,22
	tmlearn 28,31,32
	tmlearn 34
	tmlearn 44,47
	tmlearn 50,55
	db Bank(SeedotPicFront) ; padding
