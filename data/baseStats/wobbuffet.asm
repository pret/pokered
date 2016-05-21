WobbuffetBaseStats::
	dw DEX_WOBBUFFET ; pokedex id
	db 190 ; base hp
	db 33 ; base attack
	db 58 ; base defense
	db 33 ; base speed
	db 45 ; base special
	db PSYCHIC ; species type 1
	db PSYCHIC ; species type 2
	db 45 ; catch rate
	db 177 ; base exp yield
	INCBIN "pic/bmon/wobbuffet.pic",0,1 ; 55, sprite dimensions
	dw WobbuffetPicFront
	dw WobbuffetPicBack
	; attacks known at lvl 0
	db COUNTER
	db 0 ; MIRROR_COAT
	db 0 ; SAFEGUARD
	db 0 ; DESTINY_BOND
	db 0 ; growth rate
	; learnset
	tmlearn 0
	tmlearn 0
	tmlearn 0
	tmlearn 0
	tmlearn 0
	tmlearn 0
	tmlearn 0
	db Bank(WobbuffetPicFront) ; padding
