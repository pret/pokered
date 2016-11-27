LudicoloBaseStats::
	dw DEX_LUDICOLO ; pokedex id
	db 80 ; base hp
	db 70 ; base attack
	db 70 ; base defense
	db 70 ; base speed
	db 95 ; base special
	db WATER ; species type 1
	db GRASS ; species type 2
	db 120 ; catch rate
	db 141 ; base exp yield
	INCBIN "pic/bmon/ludicolo.pic",0,1
	dw LudicoloPicFront
	dw LudicoloPicBack
	; attacks known at lvl 0
	db GROWL
	db MEGA_DRAIN
	db 0
	db 0
	db 3 ; growth rate
	; learnset
	tmlearn 3,6,8
	tmlearn 10,11,12,13,14,15
	tmlearn 18,21,22
	tmlearn 31,32
	tmlearn 34
	tmlearn 44
	tmlearn 50,53,55
	db Bank(LudicoloPicFront) ; padding
