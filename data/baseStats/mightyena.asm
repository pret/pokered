MightyenaBaseStats::
	dw DEX_MIGHTYENA ; pokedex id
	db 70 ; base hp
	db 90 ; base attack
	db 70 ; base defense
	db 70 ; base speed
	db 60 ; base special
	db DARK ; species type 1
	db DARK ; species type 2
	db 127 ; catch rate
	db 128 ; base exp yield
	INCBIN "pic/bmon/mightyena.pic",0,1 ; 55, sprite dimensions
	dw MightyenaPicFront
	dw MightyenaPicBack
	; attacks known at lvl 0
	db TACKLE
	db SAND_ATTACK
	db BITE
	db 0;HOWL
	db 0 ; growth rate
	; learnset
	tmlearn 1,5,6,8
	tmlearn 9,10,11,12,13,14
	tmlearn 17,18,19,20,22,24
	tmlearn 25,29,30,31,32
	tmlearn 33,34,35,38,40
	tmlearn 44,45,46
	tmlearn 49,50,54,55
	db Bank(MightyenaPicFront) ; padding
