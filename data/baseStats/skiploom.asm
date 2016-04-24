SkiploomBaseStats::
	dw DEX_SKIPLOOM ; pokedex id
	db 55 ; base hp
	db 45 ; base attack
	db 50 ; base defense
	db 80 ; base speed
	db 55 ; base special
	db GRASS ; species type 1
	db FLYING ; species type 2
	db 120 ; catch rate
	db 136 ; base exp yield
	INCBIN "pic/bmon/skiploom.pic",0,1 ; 66, sprite dimensions
	dw SkiploomPicFront
	dw SkiploomPicBack
	; attacks known at lvl 0
	db SPLASH
	db 0
	db 0
	db 0
	db 3 ; growth rate
	; learnset
	tmlearn 3,6
	tmlearn 9,10
	tmlearn 20,21,22
	tmlearn 31,32
	tmlearn 33,34
	tmlearn 44
	tmlearn 50,51
	db Bank(SkiploomPicFront) ; padding
