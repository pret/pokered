NidokingBaseStats: ; 3877a (e:477a)
db DEX_NIDOKING ; pokedex id
db 81 ; base hp
db 92 ; base attack
db 77 ; base defense
db 85 ; base speed
db 75 ; base special
db POISON ; species type 1
db GROUND ; species type 2
db 45 ; catch rate
db 195 ; base exp yield
INCBIN "pic/bmon/nidoking.pic",0,1 ; 77, sprite dimensions
dw NidokingPicFront
dw NidokingPicBack
; attacks known at lvl 0
db TACKLE
db HORN_ATTACK
db POISON_STING
db THRASH
db 3 ; growth rate
; learnset
db %11110001
db %11111111
db %10001111
db %11000111
db %10100011
db %10001000
db %00110010
db 0 ; padding
