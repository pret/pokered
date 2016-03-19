FeraligatrBaseStats::
	dw DEX_FERALIGATR ; pokedex id
	db 85 ; base hp
	db 105 ; base attack
	db 100 ; base defense
	db 78 ; base speed
	db 81 ; base special
	db WATER ; species type 1
	db WATER ; species type 2
	db 45 ; catch rate
	db 210 ; base exp yield
	INCBIN "pic/bmon/feraligatr.pic",0,1 ; sprite dimensions
	dw FeraligatrPicFront
	dw FeraligatrPicBack
	; attacks known at lvl 0
	db SCRATCH
	db LEER
	db RAGE
	db WATER_GUN
	db 3 ; growth rate
	; learnset
	tmlearn 2,6
	tmlearn 12,13,14,15
	tmlearn 17,20
	tmlearn 28,32
	tmlearn 34
	tmlearn 44,48
	tmlearn 50,51,53,54
	db Bank(FeraligatrPicFront) ; padding
