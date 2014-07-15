VaporeonBaseStats: ; 3926a (e:526a)
db DEX_VAPOREON ; pokedex id
db 130 ; base hp
db 65 ; base attack
db 60 ; base defense
db 65 ; base speed
db 110 ; base special
db WATER ; species type 1
db WATER ; species type 2
db 45 ; catch rate
db 196 ; base exp yield
INCBIN "pic/bmon/vaporeon.pic",0,1 ; 66, sprite dimensions
dw VaporeonPicFront
dw VaporeonPicBack
; attacks known at lvl 0
db TACKLE
IF !_YELLOW
	db SAND_ATTACK
ENDC
IF _YELLOW
	db TAIL_WHIP
ENDC
db QUICK_ATTACK
db WATER_GUN
db 0 ; growth rate
; learnset
db %10100000
db %01111111
db %00001000
db %11000000
db %11000011
db %00001000
db %00010010
db 0 ; padding
