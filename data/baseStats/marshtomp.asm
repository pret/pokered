MarshtompBaseStats::
	dw DEX_MARSHTOMP ; pokedex id
	db 70 ; base hp
	db 85 ; base attack
	db 70 ; base defense
	db 50 ; base speed
	db 65 ; base special
	db WATER ; species type 1
	db GROUND ; species type 2
	db 45 ; catch rate
	db 143 ; base exp yield
	INCBIN "pic/bmon/marshtomp.pic",0,1 ; 55, sprite dimensions
	dw MarshtompPicFront
	dw MarshtompPicBack
	; attacks known at lvl 0
	db TACKLE
	db GROWL
	db WATER_GUN
	db 0 ; MUD_SLAP
	db 3 ; growth rate
	; learnset
	tmlearn 6,7,8
	tmlearn 9,10,11,12,13,14,15,16
	tmlearn 20
	tmlearn 26,28,31,32
	tmlearn 34
	tmlearn 44
	tmlearn 53,54
	db Bank(MarshtompPicFront) ; padding
