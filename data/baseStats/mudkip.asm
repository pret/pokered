MudkipBaseStats::
	dw DEX_MUDKIP ; pokedex id
	db 50 ; base hp
	db 70 ; base attack
	db 50 ; base defense
	db 40 ; base speed
	db 50 ; base special
	db WATER ; species type 1
	db WATER ; species type 2
	db 45 ; catch rate
	db 65 ; base exp yield
	INCBIN "pic/bmon/mudkip.pic",0,1 ; 55, sprite dimensions
	dw MudkipPicFront
	dw MudkipPicBack
	; attacks known at lvl 0
	db TACKLE
	db GROWL
	db 0
	db 0
	db 3 ; growth rate
	; learnset
	tmlearn 6,7,8
	tmlearn 9,10,11,12,13,14,15,16
	tmlearn 20
	tmlearn 31,32
	tmlearn 34
	tmlearn 44
	tmlearn 53,54
	db Bank(MudkipPicFront) ; padding
