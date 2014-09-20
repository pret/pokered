ArcanineBaseStats: ; 38a36 (e:4a36)
db DEX_ARCANINE ; pokedex id
db 90 ; base hp
db 110 ; base attack
db 80 ; base defense
db 95 ; base speed
db 80 ; base special
db FIRE ; species type 1
db FIRE ; species type 2
db 75 ; catch rate
db 213 ; base exp yield
INCBIN "pic/bmon/arcanine.pic",0,1 ; 77, sprite dimensions
dw ArcaninePicFront
dw ArcaninePicBack
; attacks known at lvl 0
db ROAR
db EMBER
db LEER
db TAKE_DOWN
db 5 ; growth rate
; learnset
db %10100000
db %01000011
db %01001000
db %11101000
db %11100011
db %00001000
db %00000010
db 0 ; padding
