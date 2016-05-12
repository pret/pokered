DunsparceBaseStats::
	dw DEX_DUNSPARCE ; pokedex id
	db 100 ; base hp
	db 70 ; base attack
	db 70 ; base defense
	db 45 ; base speed
	db 65 ; base special
	db NORMAL ; species type 1
	db NORMAL ; species type 2
	db 190 ; catch rate
	db 75 ; base exp yield
	INCBIN "pic/bmon/dunsparce.pic",0,1 ; 77, sprite dimensions
	dw DunsparcePicFront
	dw DunsparcePicBack
	; attacks known at lvl 0
	db RAGE
	db 0
	db 0
	db 0
	db 0 ; growth rate
	; learnset
	tmlearn 1,5,6,8
	tmlearn 9,10,11,12,13,14,15,16
	tmlearn 17,18,19,20,22,24
	tmlearn 25,26,27,29,31,32
	tmlearn 33,34,35,36,38,40
	tmlearn 44,46,48
	tmlearn 50,53,54
	db Bank(DunsparcePicFront) ; padding
