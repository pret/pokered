SnubbullBaseStats::
	dw DEX_SNUBBULL ; pokedex id
	db 60 ; base hp
	db 80 ; base attack
	db 50 ; base defense
	db 30 ; base speed
	db 40 ; base special
	db NORMAL ; species type 1
	db NORMAL ; species type 2
	db 190 ; catch rate
	db 63 ; base exp yield
	INCBIN "pic/bmon/snubbull.pic",0,1 ; 55, sprite dimensions
	dw SnubbullPicFront
	dw SnubbullPicBack
	; attacks known at lvl 0
	db TACKLE
	db 0 ; SCARY_FACE
	db 0
	db 0
	db 5 ; growth rate
	; learnset
	tmlearn 1,5,6,8
	tmlearn 9,10,11,12,13,14
	tmlearn 17,18,19,20,22,24
	tmlearn 25,29,30,31,32
	tmlearn 33,34,35,38,40
	tmlearn 44,45,46
	tmlearn 49,50,54,55
	db Bank(SnubbullPicFront) ; padding
