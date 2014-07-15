MarowakBaseStats: ; 38f3e (e:4f3e)
db DEX_MAROWAK ; pokedex id
db 60 ; base hp
db 80 ; base attack
db 110 ; base defense
db 45 ; base speed
db 50 ; base special
db GROUND ; species type 1
db GROUND ; species type 2
db 75 ; catch rate
db 124 ; base exp yield
INCBIN "pic/bmon/marowak.pic",0,1 ; 66, sprite dimensions
dw MarowakPicFront
dw MarowakPicBack
; attacks known at lvl 0
db BONE_CLUB
IF !_YELLOW
	db GROWL
	db LEER
	db FOCUS_ENERGY
ENDC
IF _YELLOW
	db TAIL_WHIP
	db 0
	db 0
ENDC
db 0 ; growth rate
; learnset
db %10110001
db %01111111
db %00001111
db %11001110
db %10100010
db %00001000
db %00100010
db 0 ; padding
