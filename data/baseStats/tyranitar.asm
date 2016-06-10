TyranitarBaseStats::
	dw DEX_TYRANITAR ; pokedex id
	db 100 ; base hp
	db 134 ; base attack
	db 110 ; base defense
	db 61 ; base speed
	db 97 ; base special
	db ROCK ; species type 1
	db DARK ; species type 2
	db 45 ; catch rate
	db 218 ; base exp yield
	INCBIN "pic/bmon/tyranitar.pic",0,1 ; 55, sprite dimensions
	dw TyranitarPicFront
	dw TyranitarPicBack
	; attacks known at lvl 0
	db BITE
	db LEER
	db 0
	db 0
	db 5 ; growth rate
	; learnset
	tmlearn 1,6,8
	tmlearn 10,13,15
	tmlearn 18,19,20,24
	tmlearn 25,26,28,31,32
	tmlearn 34,38
	tmlearn 44,45,48
	tmlearn 50,51,53,54
	db Bank(TyranitarPicFront) ; padding
