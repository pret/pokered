ScytherBaseStats: ; 39136 (e:5136)
db DEX_SCYTHER ; pokedex id
db 70 ; base hp
db 110 ; base attack
db 80 ; base defense
db 105 ; base speed
db 55 ; base special
db BUG ; species type 1
db FLYING ; species type 2
db 45 ; catch rate
db 187 ; base exp yield
INCBIN "pic/bmon/scyther.pic",0,1 ; 77, sprite dimensions
dw ScytherPicFront
dw ScytherPicBack
; attacks known at lvl 0
db QUICK_ATTACK
db 0
db 0
db 0
db 0 ; growth rate
; learnset
db %00100100
db %01000011
db %00001000
db %11000000
db %11000010
db %00001000
db %00000110
db 0 ; padding
