AbraBaseStats: ; 38aa6 (e:4aa6)
db DEX_ABRA ; pokedex id
db 25 ; base hp
db 20 ; base attack
db 15 ; base defense
db 90 ; base speed
db 105 ; base special
db PSYCHIC ; species type 1
db PSYCHIC ; species type 2
db 200 ; catch rate
db 73 ; base exp yield
INCBIN "pic/bmon/abra.pic",0,1 ; 55, sprite dimensions
dw AbraPicFront
dw AbraPicBack
; attacks known at lvl 0
db TELEPORT
db 0
db 0
db 0
db 3 ; growth rate
; learnset
db %10110001
db %00000011
db %00001111
db %11110000
db %10000111
db %00111000
db %01000011
db 0 ; padding
