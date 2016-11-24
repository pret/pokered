BeautiflyBaseStats::
	dw DEX_BEAUTIFLY ; pokedex id
	db 60 ; base hp
	db 70 ; base attack
	db 50 ; base defense
	db 65 ; base speed
	db 80 ; base special
	db BUG ; species type 1
	db FLYING ; species type 2
	db 45 ; catch rate
	db 161 ; base exp yield
	INCBIN "pic/bmon/beautifly.pic",0,1 ; 55, sprite dimensions
	dw BeautiflyPicFront
	dw BeautiflyPicBack
	; attacks known at lvl 0
	db ABSORB
	db 0
	db 0
	db 0
	db 0 ; growth rate
	; learnset
	tmlearn 2,4,6
	tmlearn 9,10,15
	tmlearn 20,21,22
	tmlearn 29,30,31,32
	tmlearn 33,34,39
	tmlearn 44,46
	tmlearn 50,55
	db Bank(BeautiflyPicFront) ; padding
