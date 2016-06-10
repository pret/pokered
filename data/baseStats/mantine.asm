MantineBaseStats::
	dw DEX_MANTINE ; pokedex id
	db 65 ; base hp
	db 40 ; base attack
	db 70 ; base defense
	db 70 ; base speed
	db 110 ; base special
	db WATER ; species type 1
	db FLYING ; species type 2
	db 25 ; catch rate
	db 168 ; base exp yield
	INCBIN "pic/bmon/mantine.pic",0,1 ; sprite dimensions
	dw MantinePicFront
	dw MantinePicBack
	; attacks known at lvl 0
	db TACKLE
	db BUBBLE
	db 0
	db 0
	db 5 ; growth rate
	; learnset
	tmlearn 6,8
	tmlearn 9,10,11,12,13,14,15
	tmlearn 20,23,24
	tmlearn 25,31,32
	tmlearn 33,34,38,40
	tmlearn 44
	tmlearn 50,53,54
	db Bank(MantinePicFront) ; padding
