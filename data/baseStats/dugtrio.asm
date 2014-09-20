DugtrioBaseStats: ; 38956 (e:4956)
db DEX_DUGTRIO ; pokedex id
db 35 ; base hp
db 80 ; base attack
db 50 ; base defense
db 120 ; base speed
db 70 ; base special
db GROUND ; species type 1
db GROUND ; species type 2
db 50 ; catch rate
db 153 ; base exp yield
INCBIN "pic/bmon/dugtrio.pic",0,1 ; 66, sprite dimensions
dw DugtrioPicFront
dw DugtrioPicBack
; attacks known at lvl 0
db SCRATCH
db GROWL
db DIG
db 0
db 0 ; growth rate
; learnset
db %10100000
db %01000011
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
