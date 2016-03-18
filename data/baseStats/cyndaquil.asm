CyndaquilBaseStats::
	dw DEX_CYNDAQUIL ; pokedex id
	db 39 ; base hp
	db 52 ; base attack
	db 43 ; base defense
	db 65 ; base speed
	db 55 ; base special
	db FIRE ; species type 1
	db FIRE ; species type 2
	db 45 ; catch rate
	db 65 ; base exp yield
	INCBIN "pic/bmon/cyndaquil.pic",0,1 ; sprite dimensions
	dw CyndaquilPicFront
	dw CyndaquilPicBack
	; attacks known at lvl 0
	db TACKLE
	db LEER
	db 0
	db 0
	db 3 ; growth rate
	; learnset
	tmlearn 6,8
	tmlearn 10
	tmlearn 0
	tmlearn 28,31,32
	tmlearn 34,38,39
	tmlearn 44
	tmlearn 50,51
	db Bank(CyndaquilPicFront) ; padding
