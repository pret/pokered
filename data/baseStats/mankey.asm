MankeyBaseStats: ; 389e2 (e:49e2)
db DEX_MANKEY ; pokedex id
db 40 ; base hp
db 80 ; base attack
db 35 ; base defense
db 70 ; base speed
db 35 ; base special
db FIGHTING ; species type 1
db FIGHTING ; species type 2
db 190 ; catch rate
db 74 ; base exp yield
INCBIN "pic/bmon/mankey.pic",0,1 ; 55, sprite dimensions
dw MankeyPicFront
dw MankeyPicBack
; attacks known at lvl 0
db SCRATCH
db LEER
db 0
db 0
db 0 ; growth rate
; learnset
db %10110001
db %10000011
db %10001111
db %11001001
db %11000110
db %10001000
db %00100010
db 0 ; padding
