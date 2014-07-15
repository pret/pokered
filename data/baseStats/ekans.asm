EkansBaseStats: ; 38646 (e:4646)
db DEX_EKANS ; pokedex id
db 35 ; base hp
db 60 ; base attack
db 44 ; base defense
db 55 ; base speed
db 40 ; base special
db POISON ; species type 1
db POISON ; species type 2
db 255 ; catch rate
db 62 ; base exp yield
INCBIN "pic/bmon/ekans.pic",0,1 ; 55, sprite dimensions
dw EkansPicFront
dw EkansPicBack
; attacks known at lvl 0
db WRAP
db LEER
db 0
db 0
db 0 ; growth rate
; learnset
db %10100000
db %00000011
db %00011000
db %11001110
db %10000010
db %10001000
db %00100010
db 0 ; padding
