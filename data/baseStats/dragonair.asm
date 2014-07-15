DragonairBaseStats: ; 393f2 (e:53f2)
db DEX_DRAGONAIR ; pokedex id
db 61 ; base hp
db 84 ; base attack
db 65 ; base defense
db 70 ; base speed
db 70 ; base special
db DRAGON ; species type 1
db DRAGON ; species type 2
db 45 ; catch rate
db 144 ; base exp yield
INCBIN "pic/bmon/dragonair.pic",0,1 ; 66, sprite dimensions
dw DragonairPicFront
dw DragonairPicBack
; attacks known at lvl 0
db WRAP
db LEER
db THUNDER_WAVE
db 0
db 5 ; growth rate
; learnset
db %11100000
db %00111111
db %11001000
db %11000001
db %11100011
db %00011000
db %00010010
db 0 ; padding
