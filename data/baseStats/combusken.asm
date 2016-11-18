CombuskenBaseStats::
	dw DEX_COMBUSKEN ; pokedex id
	db 60 ; base hp
	db 85 ; base attack
	db 60 ; base defense
	db 55 ; base speed
	db 75 ; base special
	db FIRE ; species type 1
	db FIGHTING ; species type 2
	db 45 ; catch rate
	db 142 ; base exp yield
	INCBIN "pic/bmon/combusken.pic",0,1 ; 55, sprite dimensions
	dw CombuskenPicFront
	dw CombuskenPicBack
	; attacks known at lvl 0
	db SCRATCH
	db GROWL
	db FOCUS_ENERGY
	db EMBER
	db 3 ; growth rate
	; learnset
	tmlearn 1,3,5,6,8
	tmlearn 9,10
	tmlearn 17,18,19,20,23
	tmlearn 28,31,32
	tmlearn 33,34,38,39,40
	tmlearn 44
	tmlearn 50,51,54
	db Bank(CombuskenPicFront) ; padding
