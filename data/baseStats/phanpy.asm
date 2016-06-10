PhanpyBaseStats::
	dw DEX_PHANPY ; pokedex id
	db 90 ; base hp
	db 60 ; base attack
	db 60 ; base defense
	db 40 ; base speed
	db 40 ; base special
	db GROUND ; species type 1
	db GROUND ; species type 2
	db 120 ; catch rate
	db 124 ; base exp yield
	INCBIN "pic/bmon/phanpy.pic",0,1 ; 55, sprite dimensions
	dw PhanpyPicFront
	dw PhanpyPicBack
	; attacks known at lvl 0
	db TACKLE
	db GROWL
	db 0
	db 0
	db 0 ; growth rate
	; learnset
	tmlearn 6,8
	tmlearn 9,10,12
	tmlearn 18,20
	tmlearn 26,27,31,32
	tmlearn 34,40
	tmlearn 44,48
	tmlearn 50,54
	db Bank(PhanpyPicFront) ; padding
