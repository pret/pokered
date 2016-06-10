EnteiBaseStats::
	dw DEX_ENTEI ; pokedex id
	db 115 ; base hp
	db 115 ; base attack
	db 85 ; base defense
	db 100 ; base speed
	db 82 ; base special
	db FIRE ; species type 1
	db FIRE ; species type 2
	db 3 ; catch rate
	db 217 ; base exp yield
	INCBIN "pic/bmon/entei.pic",0,1 ; 55, sprite dimensions
	dw EnteiPicFront
	dw EnteiPicBack
	; attacks known at lvl 0
	db BITE
	db LEER
	db 0
	db 0
	db 5 ; growth rate
	; learnset
	tmlearn 6,8
	tmlearn 10,15
	tmlearn 20
	tmlearn 28,31,32
	tmlearn 33,34,38,39
	tmlearn 44
	tmlearn 50,51,54,55
	db Bank(EnteiPicFront) ; padding
