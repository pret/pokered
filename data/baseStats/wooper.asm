WooperBaseStats::
	dw DEX_WOOPER ; pokedex id
	db 55 ; base hp
	db 45 ; base attack
	db 45 ; base defense
	db 15 ; base speed
	db 25 ; base special
	db WATER ; species type 1
	db GROUND ; species type 2
	db 255 ; catch rate
	db 52 ; base exp yield
	INCBIN "pic/bmon/wooper.pic",0,1 ; 55, sprite dimensions
	dw WooperPicFront
	dw WooperPicBack
	; attacks known at lvl 0
	db WATER_GUN
	db TAIL_WHIP
	db 0
	db 0
	db 0 ; growth rate
	; learnset
	tmlearn 6,8
	tmlearn 10,11,12,13,14
	tmlearn 18,20
	tmlearn 26,28,31,32
	tmlearn 34
	tmlearn 44
	tmlearn 50,53,55
	db Bank(WooperPicFront) ; padding
