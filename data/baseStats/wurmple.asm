WurmpleBaseStats::
	dw DEX_WURMPLE ; pokedex id
	db 45 ; base hp
	db 45 ; base attack
	db 35 ; base defense
	db 20 ; base speed
	db 25 ; base special
	db BUG ; species type 1
	db BUG ; species type 2
	db 255 ; catch rate
	db 54 ; base exp yield
	INCBIN "pic/bmon/wurmple.pic",0,1 ; 55, sprite dimensions
	dw WurmplePicFront
	dw WurmplePicBack
	; attacks known at lvl 0
	db TACKLE
	db STRING_SHOT
	db 0
	db 0
	db 0 ; growth rate
	; learnset
	tmlearn 0
	tmlearn 0
	tmlearn 0
	tmlearn 0
	tmlearn 0
	tmlearn 0
	tmlearn 0
	db Bank(WurmplePicFront) ; padding
