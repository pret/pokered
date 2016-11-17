SceptileBaseStats::
	dw DEX_SCEPTILE ; pokedex id
	db 70 ; base hp
	db 85 ; base attack
	db 65 ; base defense
	db 120 ; base speed
	db 95 ; base special
	db GRASS ; species type 1
	db GRASS ; species type 2
	db 45 ; catch rate
	db 208 ; base exp yield
	INCBIN "pic/bmon/sceptile.pic",0,1 ; sprite dimensions
	dw SceptilePicFront
	dw SceptilePicBack
	; attacks known at lvl 0
	db POUND
	db LEER
	db ABSORB
	db QUICK_ATTACK
	db 3 ; growth rate
	; learnset
	tmlearn 3,6,8
	tmlearn 9,10
	tmlearn 20,21,22
	tmlearn 31,32
	tmlearn 33,34
	tmlearn 44
	tmlearn 50,51,54,55
	db Bank(SceptilePicFront) ; padding
