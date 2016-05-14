QwilfishBaseStats::
	dw DEX_QWILFISH ; pokedex id
	db 65 ; base hp
	db 95 ; base attack
	db 75 ; base defense
	db 85 ; base speed
	db 55 ; base special
	db WATER ; species type 1
	db POISON ; species type 2
	db 45 ; catch rate
	db 100 ; base exp yield
	INCBIN "pic/bmon/qwilfish.pic",0,1 ; 55, sprite dimensions
	dw QwilfishPicFront
	dw QwilfishPicBack
	; attacks known at lvl 0
	db TACKLE
	db POISON_STING
	db 0
	db 0
	db 0 ; growth rate
	; learnset
	tmlearn 3,6
	tmlearn 9,10,11,12,13,14
	tmlearn 20,21
	tmlearn 31,32
	tmlearn 33,34,40
	tmlearn 44
	tmlearn 50,51,53
	db Bank(QwilfishPicFront) ; padding
