LedybaBaseStats::
	dw DEX_LEDYBA ; pokedex id
	db 40 ; base hp
	db 20 ; base attack
	db 30 ; base defense
	db 55 ; base speed
	db 60 ; base special
	db BUG ; species type 1
	db FLYING ; species type 2
	db 255 ; catch rate
	db 54 ; base exp yield
	INCBIN "pic/bmon/ledyba.pic",0,1 ; 66, sprite dimensions
	dw LedybaPicFront
	dw LedybaPicBack
	; attacks known at lvl 0
	db TACKLE
	db 0
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
	db Bank(LedybaPicFront) ; padding
