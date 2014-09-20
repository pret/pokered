EeveeBaseStats: ; 3924e (e:524e)
db DEX_EEVEE ; pokedex id
db 55 ; base hp
db 55 ; base attack
db 50 ; base defense
db 55 ; base speed
db 65 ; base special
db NORMAL ; species type 1
db NORMAL ; species type 2
db 45 ; catch rate
db 92 ; base exp yield
INCBIN "pic/bmon/eevee.pic",0,1 ; 55, sprite dimensions
dw EeveePicFront
dw EeveePicBack
; attacks known at lvl 0
db TACKLE
IF !_YELLOW
	db SAND_ATTACK
ENDC
IF _YELLOW
	db TAIL_WHIP
ENDC
db 0
db 0
db 0 ; growth rate
; learnset
db %10100000
db %00000011
db %00001000
db %11000000
db %11000011
db %00001000
db %00000010
db 0 ; padding
