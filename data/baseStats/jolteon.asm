JolteonBaseStats: ; 39286 (e:5286)
db DEX_JOLTEON ; pokedex id
db 65 ; base hp
db 65 ; base attack
db 60 ; base defense
db 130 ; base speed
db 110 ; base special
db ELECTRIC ; species type 1
db ELECTRIC ; species type 2
db 45 ; catch rate
db 197 ; base exp yield
INCBIN "pic/bmon/jolteon.pic",0,1 ; 66, sprite dimensions
dw JolteonPicFront
dw JolteonPicBack
; attacks known at lvl 0
db TACKLE
IF !_YELLOW
	db SAND_ATTACK
ENDC
IF _YELLOW
	db TAIL_WHIP
ENDC
db QUICK_ATTACK
db THUNDERSHOCK
db 0 ; growth rate
; learnset
db %10100000
db %01000011
db %10001000
db %11000001
db %11000011
db %00011000
db %01000010
db 0 ; padding
