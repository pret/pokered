GranbullBaseStats::
	dw DEX_GRANBULL ; pokedex id
	db 90 ; base hp
	db 120 ; base attack
	db 75 ; base defense
	db 45 ; base speed
	db 60 ; base special
	db NORMAL ; species type 1
	db NORMAL ; species type 2
	db 75 ; catch rate
	db 178 ; base exp yield
	INCBIN "pic/bmon/granbull.pic",0,1 ; 66, sprite dimensions
	dw GranbullPicFront
	dw GranbullPicBack
	; attacks known at lvl 0
	db TACKLE
	db 0 ; SCARY_FACE
	db 0
	db 0
	db 5 ; growth rate
	; learnset
	tmlearn 1,5,6,8
	tmlearn 9,10,11,12,13,14,15
	tmlearn 17,18,19,20,22,24
	tmlearn 25,29,30,31,32
	tmlearn 33,34,35,38,40
	tmlearn 44,45,46
	tmlearn 49,50,54,55
	db Bank(GranbullPicFront) ; padding
