MewBaseStats: ; 425b (1:425b)
db DEX_MEW ; pokedex id
db 100 ; base hp
db 100 ; base attack
db 100 ; base defense
db 100 ; base speed
db 100 ; base special
db PSYCHIC ; species type 1
db PSYCHIC ; species type 2
db 45 ; catch rate
db 64 ; base exp yield
INCBIN "pic/bmon/mew.pic",0,1 ; 55, sprite dimensions
dw MewPicFront
dw MewPicBack
; attacks known at lvl 0
db POUND
db 0
db 0
db 0
db 3 ; growth rate
; include learnset directly
db %11111111
db %11111111
db %11111111
db %11111111
db %11111111
db %11111111
db %11111111
db %11111111 ; usually spacing
