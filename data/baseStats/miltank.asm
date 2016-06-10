MiltankBaseStats::
	dw DEX_MILTANK ; pokedex id
	db 95 ; base hp
	db 80 ; base attack
	db 105 ; base defense
	db 100 ; base speed
	db 55 ; base special
	db NORMAL ; species type 1
	db NORMAL ; species type 2
	db 45 ; catch rate
	db 200 ; base exp yield
	INCBIN "pic/bmon/miltank.pic",0,1 ; 55, sprite dimensions
	dw MiltankPicFront
	dw MiltankPicBack
	; attacks known at lvl 0
	db TACKLE
	db 0
	db 0
	db 0
	db 5 ; growth rate
	; learnset
	tmlearn 6,7,8
	tmlearn 9,10,13,14,15
	tmlearn 20,24
	tmlearn 25,26,27,31,32
	tmlearn 34,38,40
	tmlearn 44
	tmlearn 50,54
	db Bank(MiltankPicFront) ; padding
