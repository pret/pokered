TogeticBaseStats::
	dw DEX_TOGETIC ; pokedex id
	db 55 ; base hp
	db 40 ; base attack
	db 85 ; base defense
	db 40 ; base speed
	db 93 ; base special
	db NORMAL ; species type 1
	db FLYING ; species type 2
	db 75 ; catch rate
	db 114 ; base exp yield
	INCBIN "pic/bmon/togetic.pic",0,1
	dw TogeticPicFront
	dw TogeticPicBack
	; attacks known at lvl 0
	db GROWL
	db 0
	db 0
	db 0
	db 4 ; growth rate
	; learnset
	tmlearn 1,6,8
	tmlearn 10,15
	tmlearn 18,22
	tmlearn 29,31,32
	tmlearn 35,38,39
	tmlearn 42,43,44,45
	tmlearn 49,52,55
	db Bank(TogeticPicFront) ; padding
