GeodudeBaseStats: ; 38bda (e:4bda)
db DEX_GEODUDE ; pokedex id
db 40 ; base hp
db 80 ; base attack
db 100 ; base defense
db 20 ; base speed
db 30 ; base special
db ROCK ; species type 1
db GROUND ; species type 2
db 255 ; catch rate
db 86 ; base exp yield
INCBIN "pic/bmon/geodude.pic",0,1 ; 55, sprite dimensions
dw GeodudePicFront
dw GeodudePicBack
; attacks known at lvl 0
db TACKLE
db 0
db 0
db 0
db 3 ; growth rate
; learnset
db %10100001
db %00000011
db %00001111
db %11001110
db %00101110
db %11001000
db %00100010
db 0 ; padding
