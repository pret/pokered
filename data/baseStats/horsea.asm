HorseaBaseStats: ; 39072 (e:5072)
db DEX_HORSEA ; pokedex id
db 30 ; base hp
db 40 ; base attack
db 70 ; base defense
db 60 ; base speed
db 70 ; base special
db WATER ; species type 1
db WATER ; species type 2
db 225 ; catch rate
db 83 ; base exp yield
INCBIN "pic/bmon/horsea.pic",0,1 ; 55, sprite dimensions
dw HorseaPicFront
dw HorseaPicBack
; attacks known at lvl 0
db BUBBLE
db 0
db 0
db 0
db 0 ; growth rate
; learnset
db %00100000
db %00111111
db %00001000
db %11000000
db %11000010
db %00001000
db %00010010
db 0 ; padding
