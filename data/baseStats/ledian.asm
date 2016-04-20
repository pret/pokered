LedianBaseStats::
	dw DEX_LEDIAN ; pokedex id
	db 55 ; base hp
	db 35 ; base attack
	db 50 ; base defense
	db 85 ; base speed
	db 85 ; base special
	db BUG ; species type 1
	db FLYING ; species type 2
	db 90 ; catch rate
	db 134 ; base exp yield
	INCBIN "pic/bmon/ledian.pic",0,1 ; 66, sprite dimensions
	dw LedianPicFront
	dw LedianPicBack
	; attacks known at lvl 0
	db TACKLE
	db SUPERSONIC
	db 0
	db 0
	db 4 ; growth rate
	; learnset
	tmlearn 3,6
	tmlearn 9,10,15
	tmlearn 20,21
	tmlearn 31,32
	tmlearn 33,34,39,40
	tmlearn 44
	tmlearn 50,51
	db Bank(LedianPicFront) ; padding
