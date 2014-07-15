GastlyBaseStats: ; 38dd2 (e:4dd2)
db DEX_GASTLY ; pokedex id
db 30 ; base hp
db 35 ; base attack
db 30 ; base defense
db 80 ; base speed
db 100 ; base special
db GHOST ; species type 1
db POISON ; species type 2
db 190 ; catch rate
db 95 ; base exp yield
INCBIN "pic/bmon/gastly.pic",0,1 ; 77, sprite dimensions
dw GastlyPicFront
dw GastlyPicBack
; attacks known at lvl 0
db LICK
db CONFUSE_RAY
db NIGHT_SHADE
db 0
db 3 ; growth rate
; learnset
db %00100000
db %00000000
db %10011000
db %11010001
db %00001010
db %01101010
db %00000010
db 0 ; padding
