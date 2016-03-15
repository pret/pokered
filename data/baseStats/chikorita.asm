ChikoritaBaseStats::
	dw DEX_CHIKORITA ; pokedex id
	db 45 ; base hp
	db 49 ; base attack
	db 65 ; base defense
	db 45 ; base speed
	db 50 ; base special
	db GRASS ; species type 1
	db GRASS ; species type 2
	db 45 ; catch rate
	db 64 ; base exp yield
	INCBIN "pic/bmon/chikorita.pic",0,1 ; sprite dimensions
	dw ChikoritaPicFront
	dw ChikoritaPicBack
	; attacks known at lvl 0
	db TACKLE
	db GROWL
	db 0
	db 0
	db 3 ; growth rate
	; learnset
	tmlearn 3,6,8
	tmlearn 10
	tmlearn 18,21,22
	tmlearn 31,32
	tmlearn 33
	tmlearn 0
	tmlearn 50,51,55
	db Bank(ChikoritaPicFront) ; padding
