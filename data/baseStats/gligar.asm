GligarBaseStats::
	dw DEX_GLIGAR ; pokedex id
	db 65 ; base hp
	db 75 ; base attack
	db 105 ; base defense
	db 85 ; base speed
	db 50 ; base special
	db GROUND ; species type 1
	db FLYING ; species type 2
	db 60 ; catch rate
	db 108 ; base exp yield
	INCBIN "pic/bmon/gligar.pic",0,1 ; 77, sprite dimensions
	dw GligarPicFront
	dw GligarPicBack
	; attacks known at lvl 0
	db POISON_STING
	db 0
	db 0
	db 0
	db 3 ; growth rate
	; learnset
	tmlearn 2,4,6
	tmlearn 9,10,15
	tmlearn 20,23
	tmlearn 31,32
	tmlearn 33,34,38,39
	tmlearn 43,44
	tmlearn 50,52
	db Bank(GligarPicFront) ; padding
