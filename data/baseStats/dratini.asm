DratiniBaseStats: ; 393d6 (e:53d6)
db DEX_DRATINI ; pokedex id
db 41 ; base hp
db 64 ; base attack
db 45 ; base defense
db 50 ; base speed
db 50 ; base special
db DRAGON ; species type 1
db DRAGON ; species type 2
db 45 ; catch rate
db 67 ; base exp yield
INCBIN "pic/bmon/dratini.pic",0,1 ; 55, sprite dimensions
dw DratiniPicFront
dw DratiniPicBack
; attacks known at lvl 0
db WRAP
db LEER
db 0
db 0
db 5 ; growth rate
; learnset
db %10100000
db %00111111
db %11001000
db %11000001
db %11100011
db %00011000
db %00010010
db 0 ; padding
