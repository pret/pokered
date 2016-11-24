DustoxBaseStats::
	dw DEX_DUSTOX ; pokedex id
	db 60 ; base hp
	db 50 ; base attack
	db 70 ; base defense
	db 65 ; base speed
	db 70 ; base special
	db BUG ; species type 1
	db POISON ; species type 2
	db 45 ; catch rate
	db 160 ; base exp yield
	INCBIN "pic/bmon/dustox.pic",0,1 ; 55, sprite dimensions
	dw DustoxPicFront
	dw DustoxPicBack
	; attacks known at lvl 0
	db CONFUSION
	db 0
	db 0
	db 0
	db 0 ; growth rate
	; learnset
	tmlearn 2,4,6
	tmlearn 9,10,15
	tmlearn 20,21,22
	tmlearn 29,30,31,32
	tmlearn 33,34,39
	tmlearn 44,46
	tmlearn 50,55
	db Bank(DustoxPicFront) ; padding
