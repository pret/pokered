QuagsireBaseStats::
	dw DEX_QUAGSIRE ; pokedex id
	db 95 ; base hp
	db 85 ; base attack
	db 85 ; base defense
	db 35 ; base speed
	db 65 ; base special
	db WATER ; species type 1
	db GROUND ; species type 2
	db 90 ; catch rate
	db 137 ; base exp yield
	INCBIN "pic/bmon/quagsire.pic",0,1 ; 55, sprite dimensions
	dw QuagsirePicFront
	dw QuagsirePicBack
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
	db Bank(QuagsirePicFront) ; padding
