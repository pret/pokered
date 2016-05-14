ShuckleBaseStats::
	dw DEX_SHUCKLE ; pokedex id
	db 20 ; base hp
	db 10 ; base attack
	db 230 ; base defense
	db 5 ; base speed
	db 120 ; base special
	db BUG ; species type 1
	db ROCK ; species type 2
	db 190 ; catch rate
	db 80 ; base exp yield
	INCBIN "pic/bmon/shuckle.pic",0,1 ; 55, sprite dimensions
	dw ShucklePicFront
	dw ShucklePicBack
	; attacks known at lvl 0
	db CONSTRICT
	db WITHDRAW
	db 0
	db 0
	db 3 ; growth rate
	; learnset
	tmlearn 0
	tmlearn 0
	tmlearn 0
	tmlearn 0
	tmlearn 0
	tmlearn 0
	tmlearn 0
	db Bank(ShucklePicFront) ; padding
