ChinchouBaseStats::
	dw DEX_CHINCHOU ; pokedex id
	db 75 ; base hp
	db 38 ; base attack
	db 38 ; base defense
	db 67 ; base speed
	db 56 ; base special
	db WATER ; species type 1
	db ELECTRIC ; species type 2
	db 190 ; catch rate
	db 90 ; base exp yield
	INCBIN "pic/bmon/chinchou.pic",0,1 ; sprite dimensions
	dw ChinchouPicFront
	dw ChinchouPicBack
	; attacks known at lvl 0
	db BUBBLE
	db THUNDER_WAVE
	db 0
	db 0
	db 5 ; growth rate
	; learnset
	tmlearn 6
	tmlearn 9,10,11,12,13,14
	tmlearn 24
	tmlearn 25,31,32
	tmlearn 0
	tmlearn 44,45
	tmlearn 50,53,55
	db Bank(ChinchouPicFront) ; padding