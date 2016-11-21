PoochyenaBaseStats::
	dw DEX_POOCHYENA ; pokedex id
	db 35 ; base hp
	db 55 ; base attack
	db 35 ; base defense
	db 35 ; base speed
	db 30 ; base special
	db DARK ; species type 1
	db DARK ; species type 2
	db 255 ; catch rate
	db 55 ; base exp yield
	INCBIN "pic/bmon/poochyena.pic",0,1 ; 55, sprite dimensions
	dw PoochyenaPicFront
	dw PoochyenaPicBack
	; attacks known at lvl 0
	db TACKLE
	db 0
	db 0
	db 0
	db 0 ; growth rate
	; learnset
	tmlearn 1,5,6,8
	tmlearn 9,10,11,12,13,14
	tmlearn 17,18,19,20,22,24
	tmlearn 25,29,30,31,32
	tmlearn 33,34,35,38,40
	tmlearn 44,45,46
	tmlearn 49,50,54,55
	db Bank(PoochyenaPicFront) ; padding
