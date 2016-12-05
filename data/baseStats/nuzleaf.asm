NuzleafBaseStats::
	dw DEX_NUZLEAF ; pokedex id
	db 70 ; base hp
	db 70 ; base attack
	db 40 ; base defense
	db 60 ; base speed
	db 50 ; base special
	db GRASS ; species type 1
	db DARK ; species type 2
	db 120 ; catch rate
	db 141 ; base exp yield
	INCBIN "pic/bmon/nuzleaf.pic",0,1
	dw NuzleafPicFront
	dw NuzleafPicBack
	; attacks known at lvl 0
	db POUND
	db 0
	db 0
	db 0
	db 3 ; growth rate
	; learnset
	tmlearn 2,3,6,8
	tmlearn 9,10
	tmlearn 21,22
	tmlearn 28,31,32
	tmlearn 34
	tmlearn 44,47
	tmlearn 50,51,54,55
	db Bank(NuzleafPicFront) ; padding
