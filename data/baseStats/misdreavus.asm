MisdreavusBaseStats::
	dw DEX_MISDREAVUS ; pokedex id
	db 60 ; base hp
	db 60 ; base attack
	db 60 ; base defense
	db 85 ; base speed
	db 85 ; base special
	db GHOST ; species type 1
	db GHOST ; species type 2
	db 45 ; catch rate
	db 147 ; base exp yield
	INCBIN "pic/bmon/misdreavus.pic",0,1 ; 66, sprite dimensions
	dw MisdreavusPicFront
	dw MisdreavusPicBack
	; attacks known at lvl 0
	db GROWL
	db PSYWAVE
	db 0
	db 0
	db 4 ; growth rate
	; learnset
	tmlearn 6
	tmlearn 0
	tmlearn 20,21,24
	tmlearn 25,29,31,32
	tmlearn 34,36
	tmlearn 42,44,46,47
	tmlearn 50
	db Bank(MisdreavusPicFront) ; padding
