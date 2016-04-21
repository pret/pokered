TogepiBaseStats::
	dw DEX_TOGEPI ; pokedex id
	db 35 ; base hp
	db 20 ; base attack
	db 65 ; base defense
	db 20 ; base speed
	db 52 ; base special
	db NORMAL ; species type 1
	db NORMAL ; species type 2
	db 190 ; catch rate
	db 74 ; base exp yield
	INCBIN "pic/bmon/togepi.pic",0,1
	dw TogepiPicFront
	dw TogepiPicBack
	; attacks known at lvl 0
	db GROWL
	db 0
	db 0
	db 0
	db 4 ; growth rate
	; learnset
	tmlearn 1,6,8
	tmlearn 10
	tmlearn 22
	tmlearn 29,31,32
	tmlearn 35,38,39
	tmlearn 42,44,45
	tmlearn 49,55
	db Bank(TogepiPicFront) ; padding
