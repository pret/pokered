JumpluffBaseStats::
	dw DEX_JUMPLUFF ; pokedex id
	db 75 ; base hp
	db 55 ; base attack
	db 70 ; base defense
	db 110 ; base speed
	db 70 ; base special
	db GRASS ; species type 1
	db FLYING ; species type 2
	db 45 ; catch rate
	db 176 ; base exp yield
	INCBIN "pic/bmon/jumpluff.pic",0,1 ; 77, sprite dimensions
	dw JumpluffPicFront
	dw JumpluffPicBack
	; attacks known at lvl 0
	db SPLASH
	db TAIL_WHIP
	db TACKLE
	db 0
	db 3 ; growth rate
	; learnset
	tmlearn 3,6,8
	tmlearn 9,10,15
	tmlearn 20,21,22
	tmlearn 31,32
	tmlearn 33,34
	tmlearn 44
	tmlearn 50,51
	db Bank(JumpluffPicFront) ; padding
