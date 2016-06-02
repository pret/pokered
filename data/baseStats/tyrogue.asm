TyrogueBaseStats::
	dw DEX_TYROGUE ; pokedex id
	db 35 ; base hp
	db 35 ; base attack
	db 35 ; base defense
	db 35 ; base speed
	db 35 ; base special
	db FIGHTING ; species type 1
	db FIGHTING ; species type 2
	db 75 ; catch rate
	db 91 ; base exp yield
	INCBIN "pic/bmon/tyrogue.pic",0,1 ; 55, sprite dimensions
	dw TyroguePicFront
	dw TyroguePicBack
	; attacks known at lvl 0
	db TACKLE
	db 0
	db 0
	db 0
	db 0 ; growth rate
	; learnset
	tmlearn 5,6,8
	tmlearn 10
	tmlearn 18,19,20
	tmlearn 26,31,32
	tmlearn 34,39
	tmlearn 44,48
	tmlearn 50,54
	db Bank(TyroguePicFront) ; padding
