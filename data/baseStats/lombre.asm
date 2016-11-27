LombreBaseStats::
	dw DEX_LOMBRE ; pokedex id
	db 60 ; base hp
	db 50 ; base attack
	db 50 ; base defense
	db 50 ; base speed
	db 65 ; base special
	db WATER ; species type 1
	db GRASS ; species type 2
	db 120 ; catch rate
	db 141 ; base exp yield
	INCBIN "pic/bmon/lombre.pic",0,1
	dw LombrePicFront
	dw LombrePicBack
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
	db Bank(LombrePicFront) ; padding
