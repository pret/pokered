MagcargoBaseStats::
	dw DEX_MAGCARGO ; pokedex id
	db 50 ; base hp
	db 50 ; base attack
	db 120 ; base defense
	db 30 ; base speed
	db 80 ; base special
	db FIRE ; species type 1
	db ROCK ; species type 2
	db 75 ; catch rate
	db 154 ; base exp yield
	INCBIN "pic/bmon/magcargo.pic",0,1 ; 66, sprite dimensions
	dw MagcargoPicFront
	dw MagcargoPicBack
	; attacks known at lvl 0
	db SMOG
	db EMBER
	db ROCK_THROW
	db 0
	db 0 ; growth rate
	; learnset
	tmlearn 1,5,6,8
	tmlearn 9,10,15
	tmlearn 17,18,19,20
	tmlearn 29,30,31,32
	tmlearn 34,35,38,40
	tmlearn 44,46
	tmlearn 50,54
	db Bank(MagcargoPicFront) ; padding
