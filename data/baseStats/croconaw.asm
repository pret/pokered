CroconawBaseStats::
	dw DEX_CROCONAW ; pokedex id
	db 65 ; base hp
	db 80 ; base attack
	db 80 ; base defense
	db 58 ; base speed
	db 61 ; base special
	db WATER ; species type 1
	db WATER ; species type 2
	db 45 ; catch rate
	db 143 ; base exp yield
	INCBIN "pic/bmon/croconaw.pic",0,1 ; sprite dimensions
	dw CroconawPicFront
	dw CroconawPicBack
	; attacks known at lvl 0
	db SCRATCH
	db LEER
	db RAGE
	db 0
	db 3 ; growth rate
	; learnset
	tmlearn 2,6
	tmlearn 12,13,14
	tmlearn 17,20
	tmlearn 28,32
	tmlearn 34
	tmlearn 44,48
	tmlearn 50,51,53
	db Bank(CroconawPicFront) ; padding
