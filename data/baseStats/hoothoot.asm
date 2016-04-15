HoothootBaseStats::
	dw DEX_HOOTHOOT ; pokedex id
	db 60 ; base hp
	db 30 ; base attack
	db 30 ; base defense
	db 50 ; base speed
	db 46 ; base special
	db NORMAL ; species type 1
	db FLYING ; species type 2
	db 255 ; catch rate
	db 58 ; base exp yield
	INCBIN "pic/bmon/hoothoot.pic",0,1 ; 55, sprite dimensions
	dw HoothootPicFront
	dw HoothootPicBack
	; attacks known at lvl 0
	db TACKLE
	db GROWL
	db 0
	db 0
	db 0 ; growth rate
	; learnset
	tmlearn 2,4,6
	tmlearn 9,10
	tmlearn 20
	tmlearn 31,32
	tmlearn 33,34,39
	tmlearn 43,44
	tmlearn 50,52
	db Bank(HoothootPicFront) ; padding
