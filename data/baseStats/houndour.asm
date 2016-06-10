HoundourBaseStats::
	dw DEX_HOUNDOUR ; pokedex id
	db 45 ; base hp
	db 60 ; base attack
	db 30 ; base defense
	db 65 ; base speed
	db 65 ; base special
	db DARK ; species type 1
	db FIRE ; species type 2
	db 120 ; catch rate
	db 114 ; base exp yield
	INCBIN "pic/bmon/houndour.pic",0,1 ; 55, sprite dimensions
	dw HoundourPicFront
	dw HoundourPicBack
	; attacks known at lvl 0
	db LEER
	db EMBER
	db 0
	db 0
	db 5 ; growth rate
	; learnset
	tmlearn 6,8
	tmlearn 10
	tmlearn 18,20
	tmlearn 31,32
	tmlearn 34,38,39
	tmlearn 44
	tmlearn 50
	db Bank(HoundourPicFront) ; padding
