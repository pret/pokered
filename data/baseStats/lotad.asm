LotadBaseStats::
	dw DEX_LOTAD ; pokedex id
	db 40 ; base hp
	db 30 ; base attack
	db 30 ; base defense
	db 30 ; base speed
	db 45 ; base special
	db WATER ; species type 1
	db GRASS ; species type 2
	db 255 ; catch rate
	db 74 ; base exp yield
	INCBIN "pic/bmon/lotad.pic",0,1
	dw LotadPicFront
	dw LotadPicBack
	; attacks known at lvl 0
	db GROWL
	db 0
	db 0
	db 0
	db 3 ; growth rate
	; learnset
	tmlearn 3,6,8
	tmlearn 10,11,12,13,14
	tmlearn 18,21,22
	tmlearn 31,32
	tmlearn 34
	tmlearn 44
	tmlearn 50,53,55
	db Bank(LotadPicFront) ; padding
