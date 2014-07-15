StaryuBaseStats: ; 390e2 (e:50e2)
db DEX_STARYU ; pokedex id
db 30 ; base hp
db 45 ; base attack
db 55 ; base defense
db 85 ; base speed
db 70 ; base special
db WATER ; species type 1
db WATER ; species type 2
db 225 ; catch rate
db 106 ; base exp yield
INCBIN "pic/bmon/staryu.pic",0,1 ; 66, sprite dimensions
dw StaryuPicFront
dw StaryuPicBack
; attacks known at lvl 0
db TACKLE
db 0
db 0
db 0
db 5 ; growth rate
; learnset
db %00100000
db %00111111
db %10001000
db %11110001
db %11000011
db %00111000
db %01010011
db 0 ; padding
