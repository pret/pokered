StantlerBaseStats::
	dw DEX_STANTLER ; pokedex id
	db 73 ; base hp
	db 95 ; base attack
	db 62 ; base defense
	db 85 ; base speed
	db 75 ; base special
	db NORMAL ; species type 1
	db NORMAL ; species type 2
	db 45 ; catch rate
	db 165 ; base exp yield
	INCBIN "pic/bmon/stantler.pic",0,1 ; 55, sprite dimensions
	dw StantlerPicFront
	dw StantlerPicBack
	; attacks known at lvl 0
	db TACKLE
	db 0
	db 0
	db 0
	db 5 ; growth rate
	; learnset
	tmlearn 6,8
	tmlearn 9,10
	tmlearn 20,24
	tmlearn 25,26,29,31,32
	tmlearn 33,34,39
	tmlearn 42,44,45,46
	tmlearn 50,55
	db Bank(StantlerPicFront) ; padding
