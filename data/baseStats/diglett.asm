DiglettBaseStats: ; 3893a (e:493a)
db DEX_DIGLETT ; pokedex id
db 10 ; base hp
db 55 ; base attack
db 25 ; base defense
db 95 ; base speed
db 45 ; base special
db GROUND ; species type 1
db GROUND ; species type 2
db 255 ; catch rate
db 81 ; base exp yield
INCBIN "pic/bmon/diglett.pic",0,1 ; 55, sprite dimensions
dw DiglettPicFront
dw DiglettPicBack
; attacks known at lvl 0
db SCRATCH
db 0
db 0
db 0
db 0 ; growth rate
; learnset
db %10100000
db %00000011
db %00001000
db %11001110
db %00000010
db %10001000
IF !_YELLOW
	db %00000010
ENDC
IF _YELLOW
	db %00000110
ENDC
db 0 ; padding
