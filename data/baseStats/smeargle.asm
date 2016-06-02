SmeargleBaseStats::
	dw DEX_SMEARGLE ; pokedex id
	db 55 ; base hp
	db 20 ; base attack
	db 35 ; base defense
	db 75 ; base speed
	db 33 ; base special
	db NORMAL ; species type 1
	db NORMAL ; species type 2
	db 45 ; catch rate
	db 106 ; base exp yield
	INCBIN "pic/bmon/smeargle.pic",0,1 ; 55, sprite dimensions
	dw SmearglePicFront
	dw SmearglePicBack
	; attacks known at lvl 0
	db TACKLE
	db 0
	db 0
	db 0
	db 4 ; growth rate
	; learnset
	tmlearn 0
	tmlearn 0
	tmlearn 0
	tmlearn 0
	tmlearn 0
	tmlearn 0
	tmlearn 0
	db Bank(SmearglePicFront) ; padding
