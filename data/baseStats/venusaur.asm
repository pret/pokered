VenusaurBaseStats: ; 38416 (e:4416)
db DEX_VENUSAUR ; pokedex id
db 80 ; base hp
db 82 ; base attack
db 83 ; base defense
db 80 ; base speed
db 100 ; base special
db GRASS ; species type 1
db POISON ; species type 2
db 45 ; catch rate
db 208 ; base exp yield
INCBIN "pic/bmon/venusaur.pic",0,1 ; 77, sprite dimensions
dw VenusaurPicFront
dw VenusaurPicBack
; attacks known at lvl 0
db TACKLE
db GROWL
db LEECH_SEED
db VINE_WHIP
db 3 ; growth rate
; learnset
db %10100100
db %01000011
db %00111000
db %11000000
db %00000011
db %00001000
db %00000110
db 0 ; padding
