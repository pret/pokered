DoduoBaseStats: ; 38cf2 (e:4cf2)
db DEX_DODUO ; pokedex id
db 35 ; base hp
db 85 ; base attack
db 45 ; base defense
db 75 ; base speed
db 35 ; base special
db NORMAL ; species type 1
db FLYING ; species type 2
db 190 ; catch rate
db 96 ; base exp yield
INCBIN "pic/bmon/doduo.pic",0,1 ; 55, sprite dimensions
dw DoduoPicFront
dw DoduoPicBack
; attacks known at lvl 0
db PECK
db 0
db 0
db 0
db 0 ; growth rate
; learnset
db %10101000
db %00000011
db %00001000
db %11000000
db %10000011
db %00001100
db %00001011
db 0 ; padding
