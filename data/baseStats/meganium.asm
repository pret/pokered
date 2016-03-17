MeganiumBaseStats::
	dw DEX_MEGANIUM ; pokedex id
	db 80 ; base hp
	db 82 ; base attack
	db 100 ; base defense
	db 80 ; base speed
	db 90 ; base special
	db GRASS ; species type 1
	db GRASS ; species type 2
	db 45 ; catch rate
	db 208 ; base exp yield
	INCBIN "pic/bmon/meganium.pic",0,1 ; sprite dimensions
	dw MeganiumPicFront
	dw MeganiumPicBack
	; attacks known at lvl 0
	db TACKLE
	db GROWL
	db RAZOR_LEAF
	db REFLECT
	db 3 ; growth rate
	; learnset
	tmlearn 3,6,8
	tmlearn 10
	tmlearn 18,21,22
	tmlearn 31,32
	tmlearn 33
	tmlearn 0
	tmlearn 50,51,55
	db Bank(MeganiumPicFront) ; padding