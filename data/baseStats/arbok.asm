ArbokBaseStats: ; 38662 (e:4662)
db DEX_ARBOK ; pokedex id
db 60 ; base hp
db 85 ; base attack
db 69 ; base defense
db 80 ; base speed
db 65 ; base special
db POISON ; species type 1
db POISON ; species type 2
db 90 ; catch rate
db 147 ; base exp yield
INCBIN "pic/bmon/arbok.pic",0,1 ; 77, sprite dimensions
dw ArbokPicFront
dw ArbokPicBack
; attacks known at lvl 0
db WRAP
db LEER
db POISON_STING
db 0
db 0 ; growth rate
; learnset
db %10100000
db %01000011
db %00011000
db %11001110
db %10000010
db %10001000
db %00100010
db 0 ; padding
