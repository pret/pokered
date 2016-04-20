SpinarakBaseStats::
	dw DEX_SPINARAK ; pokedex id
	db 40 ; base hp
	db 60 ; base attack
	db 40 ; base defense
	db 30 ; base speed
	db 40 ; base special
	db BUG ; species type 1
	db POISON ; species type 2
	db 255 ; catch rate
	db 54 ; base exp yield
	INCBIN "pic/bmon/spinarak.pic",0,1 ; 66, sprite dimensions
	dw SpinarakPicFront
	dw SpinarakPicBack
	; attacks known at lvl 0
	db POISON_STING
	db STRING_SHOT
	db 0
	db 0
	db 4 ; growth rate
	; learnset
	tmlearn 0
	tmlearn 0
	tmlearn 0
	tmlearn 0
	tmlearn 0
	tmlearn 0
	tmlearn 0
	db Bank(SpinarakPicFront) ; padding
