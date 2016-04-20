CrobatBaseStats::
	dw DEX_CROBAT ; pokedex id
	db 85 ; base hp
	db 90 ; base attack
	db 80 ; base defense
	db 130 ; base speed
	db 75 ; base special
	db POISON ; species type 1
	db FLYING ; species type 2
	db 90 ; catch rate
	db 204 ; base exp yield
	INCBIN "pic/bmon/crobat.pic",0,1 ; 77, sprite dimensions
	dw CrobatPicFront
	dw CrobatPicBack
	; attacks known at lvl 0
	db LEECH_LIFE
	db SCREECH
	db BITE
	db 0
	db 0 ; growth rate
	; learnset
	tmlearn 2,4,6
	tmlearn 9,10,15
	tmlearn 20,21
	tmlearn 31,32
	tmlearn 34,39
	tmlearn 44
	tmlearn 50, 52
	db Bank(CrobatPicFront) ; padding
