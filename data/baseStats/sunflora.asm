SunfloraBaseStats::
	dw DEX_SUNFLORA ; pokedex id
	db 75 ; base hp
	db 75 ; base attack
	db 55 ; base defense
	db 30 ; base speed
	db 95 ; base special
	db GRASS ; species type 1
	db GRASS ; species type 2
	db 120 ; catch rate
	db 146 ; base exp yield
	INCBIN "pic/bmon/sunflora.pic",0,1 ; 55, sprite dimensions
	dw SunfloraPicFront
	dw SunfloraPicBack
	; attacks known at lvl 0
	db POUND
	db ABSORB
	db 0
	db 0
	db 3 ; growth rate
	; learnset
	tmlearn 3,6
	tmlearn 9,10
	tmlearn 20,21,22
	tmlearn 31,32
	tmlearn 33,34
	tmlearn 44
	tmlearn 50,51,55
	db Bank(SunfloraPicFront) ; padding
