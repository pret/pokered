HitmontopBaseStats::
	dw DEX_HITMONTOP ; pokedex id
	db 50 ; base hp
	db 95 ; base attack
	db 95 ; base defense
	db 70 ; base speed
	db 77 ; base special
	db FIGHTING ; species type 1
	db FIGHTING ; species type 2
	db 45 ; catch rate
	db 138 ; base exp yield
	INCBIN "pic/bmon/hitmontop.pic",0,1 ; 55, sprite dimensions
	dw HitmontopPicFront
	dw HitmontopPicBack
	; attacks known at lvl 0
	db ROLLING_KICK
	db 0
	db 0
	db 0
	db 0 ; growth rate
	; learnset
	tmlearn 5,6,8
	tmlearn 10
	tmlearn 18,19,20
	tmlearn 26,28,31,32
	tmlearn 34,39
	tmlearn 44,48
	tmlearn 50,54
	db Bank(HitmontopPicFront) ; padding
