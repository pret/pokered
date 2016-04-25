MurkrowBaseStats::
	dw DEX_MURKROW ; pokedex id
	db 60 ; base hp
	db 85 ; base attack
	db 42 ; base defense
	db 91 ; base speed
	db 64 ; base special
	db DARK ; species type 1
	db FLYING ; species type 2
	db 30 ; catch rate
	db 107 ; base exp yield
	INCBIN "pic/bmon/murkrow.pic",0,1 ; 66, sprite dimensions
	dw MurkrowPicFront
	dw MurkrowPicBack
	; attacks known at lvl 0
	db PECK
	db 0
	db 0
	db 0
	db 3 ; growth rate
	; learnset
	tmlearn 2,4,6
	tmlearn 9,10,15
	tmlearn 20
	tmlearn 31,32
	tmlearn 34,39
	tmlearn 43,44
	tmlearn 50,52
	db Bank(MurkrowPicFront) ; padding
