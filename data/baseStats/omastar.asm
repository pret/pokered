OmastarBaseStats: ; 392f6 (e:52f6)
db DEX_OMASTAR ; pokedex id
db 70 ; base hp
db 60 ; base attack
db 125 ; base defense
db 55 ; base speed
db 115 ; base special
db ROCK ; species type 1
db WATER ; species type 2
db 45 ; catch rate
db 199 ; base exp yield
INCBIN "pic/bmon/omastar.pic",0,1 ; 66, sprite dimensions
dw OmastarPicFront
dw OmastarPicBack
; attacks known at lvl 0
db WATER_GUN
db WITHDRAW
db HORN_ATTACK
db 0
db 0 ; growth rate
; learnset
db %11100000
db %01111111
db %00001101
db %11000000
db %10000011
db %00001000
db %00010010
db 0 ; padding
