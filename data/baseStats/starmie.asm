StarmieBaseStats: ; 390fe (e:50fe)
db DEX_STARMIE ; pokedex id
db 60 ; base hp
db 75 ; base attack
db 85 ; base defense
db 115 ; base speed
db 100 ; base special
db WATER ; species type 1
db PSYCHIC ; species type 2
db 60 ; catch rate
db 207 ; base exp yield
INCBIN "pic/bmon/starmie.pic",0,1 ; 66, sprite dimensions
dw StarmiePicFront
dw StarmiePicBack
; attacks known at lvl 0
db TACKLE
db WATER_GUN
db HARDEN
db 0
db 5 ; growth rate
; learnset
db %00100000
db %01111111
db %10001000
db %11110001
db %11000011
db %00111000
db %01010011
db 0 ; padding
