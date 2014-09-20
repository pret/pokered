AlakazamBaseStats: ; 38ade (e:4ade)
db DEX_ALAKAZAM ; pokedex id
db 55 ; base hp
db 50 ; base attack
db 45 ; base defense
db 120 ; base speed
db 135 ; base special
db PSYCHIC ; species type 1
db PSYCHIC ; species type 2
db 50 ; catch rate
db 186 ; base exp yield
INCBIN "pic/bmon/alakazam.pic",0,1 ; 77, sprite dimensions
dw AlakazamPicFront
dw AlakazamPicBack
; attacks known at lvl 0
db TELEPORT
IF !_YELLOW
	db CONFUSION
	db DISABLE
ENDC
IF _YELLOW
	db KINESIS
	db 0
ENDC
db 0
db 3 ; growth rate
; learnset
db %10110001
db %01000011
db %00001111
db %11111000
db %10000111
db %00111000
db %01000011
db 0 ; padding
