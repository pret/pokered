MarillBaseStats::
	dw DEX_MARILL ; pokedex id
	db 70 ; base hp
	db 20 ; base attack
	db 50 ; base defense
	db 40 ; base speed
	db 35 ; base special
	db WATER ; species type 1
	db WATER ; species type 2
	db 190 ; catch rate
	db 58 ; base exp yield
	INCBIN "pic/bmon/marill.pic",0,1 ; 55, sprite dimensions
	dw MarillPicFront
	dw MarillPicBack
	; attacks known at lvl 0
	db TACKLE
	db 0
	db 0
	db 0
	db 4 ; growth rate
	; learnset
	tmlearn 6,7
	tmlearn 9,10,11,12,13,14
	tmlearn 20
	tmlearn 31,32
	tmlearn 34,39,40
	tmlearn 44
	tmlearn 50,53
	db Bank(MarillPicFront) ; padding
