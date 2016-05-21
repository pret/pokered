PinecoBaseStats::
	dw DEX_PINECO ; pokedex id
	db 50 ; base hp
	db 65 ; base attack
	db 90 ; base defense
	db 15 ; base speed
	db 35 ; base special
	db BUG  ; species type 1
	db BUG  ; species type 2
	db 190 ; catch rate
	db 60 ; base exp yield
	INCBIN "pic/bmon/pineco.pic",0,1 ; 55, sprite dimensions
	dw PinecoPicFront
	dw PinecoPicBack
	; attacks known at lvl 0
	db TACKLE
	db 0 ; PROTECT
	db 0
	db 0
	db 0 ; growth rate
	; learnset
	tmlearn 6,8
	tmlearn 9,10
	tmlearn 18,20,21
	tmlearn 26,28,32
	tmlearn 33,34,36,39
	tmlearn 44
	tmlearn 50,54
	db Bank(PinecoPicFront) ; padding
