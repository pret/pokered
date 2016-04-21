SudowoodoBaseStats::
	dw DEX_SUDOWOODO ; pokedex id
	db 70 ; base hp
	db 100 ; base attack
	db 115 ; base defense
	db 30 ; base speed
	db 50 ; base special
	db ROCK ; species type 1
	db ROCK ; species type 2
	db 65 ; catch rate
	db 135 ; base exp yield
	INCBIN "pic/bmon/sudowoodo.pic",0,1 ; 66, sprite dimensions
	dw SudowoodoPicFront
	dw SudowoodoPicBack
	; attacks known at lvl 0
	db ROCK_THROW
	db MIMIC
	db 0
	db 0
	db 0 ; growth rate
	; learnset
	tmlearn 6,8
	tmlearn 9,10
	tmlearn 20
	tmlearn 26,27,28,31,32
	tmlearn 34,36,40
	tmlearn 44,47,48
	tmlearn 50,54
	db Bank(SudowoodoPicFront) ; padding
