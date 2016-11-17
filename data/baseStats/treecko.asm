TreeckoBaseStats::
	dw DEX_TREECKO ; pokedex id
	db 40 ; base hp
	db 45 ; base attack
	db 35 ; base defense
	db 70 ; base speed
	db 60 ; base special
	db GRASS ; species type 1
	db GRASS ; species type 2
	db 45 ; catch rate
	db 65 ; base exp yield
	INCBIN "pic/bmon/treecko.pic",0,1 ; sprite dimensions
	dw TreeckoPicFront
	dw TreeckoPicBack
	; attacks known at lvl 0
	db POUND
	db LEER
	db 0
	db 0
	db 3 ; growth rate
	; learnset
	tmlearn 3,6,8
	tmlearn 9,10
	tmlearn 20,21,22
	tmlearn 31,32
	tmlearn 33,34
	tmlearn 44
	tmlearn 50,51,54,55
	db Bank(TreeckoPicFront) ; padding
