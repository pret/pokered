RattataBaseStats: ; 385d6 (e:45d6)
db DEX_RATTATA ; pokedex id
db 30 ; base hp
db 56 ; base attack
db 35 ; base defense
db 72 ; base speed
db 25 ; base special
db NORMAL ; species type 1
db NORMAL ; species type 2
db 255 ; catch rate
db 57 ; base exp yield
INCBIN "pic/bmon/rattata.pic",0,1 ; 55, sprite dimensions
dw RattataPicFront
dw RattataPicBack
; attacks known at lvl 0
db TACKLE
db TAIL_WHIP
db 0
db 0
db 0 ; growth rate
; learnset
db %10100000
db %00101111
db %10001000
db %11001001
db %11000010
db %00001000
db %00000010
db 0 ; padding
