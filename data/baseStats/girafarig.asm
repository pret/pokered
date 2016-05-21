GirafarigBaseStats::
	dw DEX_GIRAFARIG ; pokedex id
	db 70 ; base hp
	db 80 ; base attack
	db 65 ; base defense
	db 85 ; base speed
	db 72 ; base special
	db NORMAL  ; species type 1
	db PSYCHIC ; species type 2
	db 60 ; catch rate
	db 149 ; base exp yield
	INCBIN "pic/bmon/girafarig.pic",0,1 ; 55, sprite dimensions
	dw GirafarigPicFront
	dw GirafarigPicBack
	; attacks known at lvl 0
	db TACKLE
	db GROWL
	db 0
	db 0
	db 0 ; growth rate
	; learnset
	tmlearn 6
	tmlearn 9
	tmlearn 24
	tmlearn 25,26,29,31,32
	tmlearn 34,39
	tmlearn 42,44
	tmlearn 50,54
	db Bank(GirafarigPicFront) ; padding
