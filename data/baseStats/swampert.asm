SwampertBaseStats::
	dw DEX_SWAMPERT ; pokedex id
	db 100 ; base hp
	db 110 ; base attack
	db 90 ; base defense
	db 60 ; base speed
	db 87 ; base special
	db WATER ; species type 1
	db GROUND ; species type 2
	db 45 ; catch rate
	db 210 ; base exp yield
	INCBIN "pic/bmon/tyrogue.pic",0,1 ; 55, sprite dimensions
	dw TyroguePicFront
	dw TyroguePicBack
	; attacks known at lvl 0
	db GROWL
	db TACKLE
	db WATER_GUN
	db 0
	db 3 ; growth rate
	; learnset
	tmlearn 1,5,6,8
	tmlearn 9,10
	tmlearn 17,18,19,20
	tmlearn 29,30,31,32
	tmlearn 33,34,35,40
	tmlearn 44,45,46
	tmlearn 49,50,55
	db Bank(TyroguePicFront) ; padding
