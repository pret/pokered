BlazikenBaseStats::
	dw DEX_BLAZIKEN ; pokedex id
	db 80 ; base hp
	db 120 ; base attack
	db 70 ; base defense
	db 80 ; base speed
	db 90 ; base special
	db FIRE ; species type 1
	db FIGHTING ; species type 2
	db 45 ; catch rate
	db 209 ; base exp yield
	INCBIN "pic/bmon/blaziken.pic",0,1 ; 55, sprite dimensions
	dw BlazikenPicFront
	dw BlazikenPicBack
	; attacks known at lvl 0
	db SCRATCH
	db GROWL
	db FOCUS_ENERGY
	db FIRE_PUNCH
	db 3 ; growth rate
	; learnset
	tmlearn 1,3,5,6,8
	tmlearn 9,10
	tmlearn 17,18,19,20,23
	tmlearn 28,31,32
	tmlearn 33,34,38,39,40
	tmlearn 44
	tmlearn 50,51,54
	db Bank(BlazikenPicFront) ; padding
