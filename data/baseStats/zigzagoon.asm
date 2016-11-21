ZigzagoonBaseStats::
	dw DEX_ZIGZAGOON ; pokedex id
	db 40 ; base hp
	db 30 ; base attack
	db 40 ; base defense
	db 60 ; base speed
	db 35 ; base special
	db NORMAL ; species type 1
	db NORMAL ; species type 2
	db 255 ; catch rate
	db 60 ; base exp yield
	INCBIN "pic/bmon/zigzagoon.pic",0,1 ; 55, sprite dimensions
	dw ZigzagoonPicFront
	dw ZigzagoonPicBack
	; attacks known at lvl 0
	db TACKLE
	db GROWL
	db 0
	db 0
	db 0 ; growth rate
	; learnset
	tmlearn 6,8
	tmlearn 9,10,11,12,14
	tmlearn 20,24
	tmlearn 25,28,31,32
	tmlearn 34,39,40
	tmlearn 44
	tmlearn 50
	db Bank(ZigzagoonPicFront) ; padding
