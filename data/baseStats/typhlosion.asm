TyphlosionBaseStats::
	dw DEX_TYPHLOSION ; pokedex id
	db 78 ; base hp
	db 84 ; base attack
	db 78 ; base defense
	db 109 ; base speed
	db 92 ; base special
	db FIRE ; species type 1
	db FIRE ; species type 2
	db 45 ; catch rate
	db 209 ; base exp yield
	INCBIN "pic/bmon/typhlosion.pic",0,1 ; sprite dimensions
	dw TyphlosionPicFront
	dw TyphlosionPicBack
	; attacks known at lvl 0
	db TACKLE
	db LEER
	db SAND_ATTACK
	db EMBER
	db 3 ; growth rate
	; learnset
	tmlearn 6,8
	tmlearn 10
	tmlearn 0
	tmlearn 28,31,32
	tmlearn 34,38,39
	tmlearn 44
	tmlearn 50,51
	db Bank(TyphlosionPicFront) ; padding
