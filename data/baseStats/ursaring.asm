UrsaringBaseStats::
	dw DEX_URSARING ; pokedex id
	db 90 ; base hp
	db 130 ; base attack
	db 75 ; base defense
	db 55 ; base speed
	db 75 ; base special
	db NORMAL ; species type 1
	db NORMAL ; species type 2
	db 60 ; catch rate
	db 189 ; base exp yield
	INCBIN "pic/bmon/ursaring.pic",0,1 ; 77, sprite dimensions
	dw UrsaringPicFront
	dw UrsaringPicBack
	; attacks known at lvl 0
	db SCRATCH
	db LEER
	db LICK
	db FURY_SWIPES
	db 0 ; growth rate
	; learnset
	tmlearn 1,5,6,8
	tmlearn 9,10,11,12,13,14,15,16
	tmlearn 17,18,19,20,22,24
	tmlearn 25,26,27,29,31,32
	tmlearn 33,34,35,36,38,40
	tmlearn 44,46,48
	tmlearn 50,53,54
	db Bank(UrsaringPicFront) ; padding
