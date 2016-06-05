SuicuneBaseStats::
	dw DEX_SUICUNE ; pokedex id
	db 100 ; base hp
	db 75 ; base attack
	db 115 ; base defense
	db 85 ; base speed
	db 102 ; base special
	db WATER ; species type 1
	db WATER ; species type 2
	db 3 ; catch rate
	db 215 ; base exp yield
	INCBIN "pic/bmon/suicune.pic",0,1 ; 55, sprite dimensions
	dw SuicunePicFront
	dw SuicunePicBack
	; attacks known at lvl 0
	db BITE
	db LEER
	db 0
	db 0
	db 5 ; growth rate
	; learnset
	tmlearn 6,8
	tmlearn 10,11,12,13,14,15
	tmlearn 20
	tmlearn 28,31,32
	tmlearn 33,34,39
	tmlearn 44
	tmlearn 50,51,53
	db Bank(SuicunePicFront) ; padding
