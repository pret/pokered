PinsirBaseStats: ; 391a6 (e:51a6)
db DEX_PINSIR ; pokedex id
db 65 ; base hp
db 125 ; base attack
db 100 ; base defense
db 85 ; base speed
db 55 ; base special
db BUG ; species type 1
db BUG ; species type 2
db 45 ; catch rate
db 200 ; base exp yield
INCBIN "pic/bmon/pinsir.pic",0,1 ; 77, sprite dimensions
dw PinsirPicFront
dw PinsirPicBack
; attacks known at lvl 0
db VICEGRIP
db 0
db 0
db 0
db 5 ; growth rate
; learnset
db %10100100
db %01000011
db %00001101
db %11000000
db %00000010
db %00001000
db %00100110
db 0 ; padding
