SunkernBaseStats::
	dw DEX_SUNKERN ; pokedex id
	db 30 ; base hp
	db 30 ; base attack
	db 30 ; base defense
	db 30 ; base speed
	db 30 ; base special
	db GRASS ; species type 1
	db GRASS ; species type 2
	db 235 ; catch rate
	db 52 ; base exp yield
	INCBIN "pic/bmon/sunkern.pic",0,1 ; 55, sprite dimensions
	dw SunkernPicFront
	dw SunkernPicBack
	; attacks known at lvl 0
	db ABSORB
	db 0
	db 0
	db 0
	db 3 ; growth rate
	; learnset
	tmlearn 3,6
	tmlearn 9,10
	tmlearn 20,21,22
	tmlearn 31,32
	tmlearn 33,34
	tmlearn 44
	tmlearn 50,51,55
	db Bank(SunkernPicFront) ; padding
