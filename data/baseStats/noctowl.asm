NoctowlBaseStats::
	dw DEX_NOCTOWL ; pokedex id
	db 100 ; base hp
	db 50 ; base attack
	db 50 ; base defense
	db 70 ; base speed
	db 86 ; base special
	db NORMAL ; species type 1
	db FLYING ; species type 2
	db 90 ; catch rate
	db 162 ; base exp yield
	INCBIN "pic/bmon/noctowl.pic",0,1 ; 77, sprite dimensions
	dw NoctowlPicFront
	dw NoctowlPicBack
	; attacks known at lvl 0
	db TACKLE
	db GROWL
	db PECK
	db 0
	db 0 ; growth rate
	; learnset
	tmlearn 2,4,6
	tmlearn 9,10,15
	tmlearn 20
	tmlearn 31,32
	tmlearn 33,34,39
	tmlearn 43,44
	tmlearn 50,52
	db Bank(NoctowlPicFront) ; padding
