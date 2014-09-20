GyaradosBaseStats: ; 391fa (e:51fa)
db DEX_GYARADOS ; pokedex id
db 95 ; base hp
db 125 ; base attack
db 79 ; base defense
db 81 ; base speed
db 100 ; base special
db WATER ; species type 1
db FLYING ; species type 2
db 45 ; catch rate
db 214 ; base exp yield
INCBIN "pic/bmon/gyarados.pic",0,1 ; 77, sprite dimensions
dw GyaradosPicFront
dw GyaradosPicBack
; attacks known at lvl 0
IF !_YELLOW
db BITE
db DRAGON_RAGE
db LEER
db HYDRO_PUMP
ENDC
IF _YELLOW
db TACKLE
db 0
db 0
db 0
ENDC
db 5 ; growth rate
; learnset
db %10100000
db %01111111
db %11001000
db %11000001
db %10100011
db %00001000
db %00110010
db 0 ; padding
