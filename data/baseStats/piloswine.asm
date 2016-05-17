PiloswineBaseStats::
	dw DEX_PILOSWINE ; pokedex id
	db 100 ; base hp
	db 100 ; base attack
	db 80 ; base defense
	db 50 ; base speed
	db 60 ; base special
	db ICE ; species type 1
	db GROUND ; species type 2
	db 75 ; catch rate
	db 160 ; base exp yield
	INCBIN "pic/bmon/piloswine.pic",0,1 ; 66, sprite dimensions
	dw PiloswinePicFront
	dw PiloswinePicBack
	; attacks known at lvl 0
	db HORN_ATTACK
	db 0 ; POWDER_SNOW
	db 0 ; ENDURE
	db 0
	db 5 ; growth rate
	; learnset
	tmlearn 6,8
	tmlearn 9,10,15
	tmlearn 20
	tmlearn 26,27,28,31,32
	tmlearn 34
	tmlearn 44,48
	tmlearn 50
	db Bank(PiloswinePicFront) ; padding
