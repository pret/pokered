XatuBaseStats::
	dw DEX_XATU ; pokedex id
	db 65 ; base hp
	db 75 ; base attack
	db 70 ; base defense
	db 95 ; base speed
	db 85 ; base special
	db PSYCHIC ; species type 1
	db FLYING ; species type 2
	db 75 ; catch rate
	db 171 ; base exp yield
	INCBIN "pic/bmon/xatu.pic",0,1 ; 66, sprite dimensions
	dw XatuPicFront
	dw XatuPicBack
	; attacks known at lvl 0
	db PECK
	db LEER
	db 0
	db 0
	db 0 ; growth rate
	; learnset
	tmlearn 1,5,6,8
	tmlearn 9,10,15
	tmlearn 17,18,19,20
	tmlearn 28,29,30,31,32
	tmlearn 33,34,35,40
	tmlearn 44,45,46
	tmlearn 49,50,52,55
	db Bank(XatuPicFront) ; padding
