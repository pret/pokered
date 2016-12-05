ShiftryBaseStats::
	dw DEX_SHIFTRY ; pokedex id
	db 90 ; base hp
	db 100 ; base attack
	db 60 ; base defense
	db 80 ; base speed
	db 75 ; base special
	db GRASS ; species type 1
	db DARK ; species type 2
	db 45 ; catch rate
	db 181 ; base exp yield
	INCBIN "pic/bmon/shiftry.pic",0,1
	dw ShiftryPicFront
	dw ShiftryPicBack
	; attacks known at lvl 0
	db POUND
	db HARDEN
	db WHIRLWIND
	db RAZOR_LEAF
	db 3 ; growth rate
	; learnset
	tmlearn 2,3,6,8
	tmlearn 9,10
	tmlearn 21,22
	tmlearn 28,31,32
	tmlearn 34
	tmlearn 44,47
	tmlearn 50,51,54,55
	db Bank(ShiftryPicFront) ; padding
