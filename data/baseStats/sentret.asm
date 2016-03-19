SentretBaseStats::
	dw DEX_SENTRET ; pokedex id
	db 35 ; base hp
	db 46 ; base attack
	db 34 ; base defense
	db 20 ; base speed
	db 40 ; base special
	db NORMAL ; species type 1
	db NORMAL ; species type 2
	db 255 ; catch rate
	db 57 ; base exp yield
	INCBIN "pic/bmon/sentret.pic",0,1 ; sprite dimensions
	dw SentretPicFront
	dw SentretPicBack
	; attacks known at lvl 0
	db TACKLE
	db 0
	db 0
	db 0
	db 3 ; growth rate
	; learnset
	tmlearn 6,8
	tmlearn 10,13
	tmlearn 22
	tmlearn 28,31,32
	tmlearn 34,39
	tmlearn 44
	tmlearn 50,51,53
	db Bank(SentretPicFront) ; padding
