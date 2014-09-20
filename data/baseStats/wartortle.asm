WartortleBaseStats: ; 384a2 (e:44a2)
db DEX_WARTORTLE ; pokedex id
db 59 ; base hp
db 63 ; base attack
db 80 ; base defense
db 58 ; base speed
db 65 ; base special
db WATER ; species type 1
db WATER ; species type 2
db 45 ; catch rate
db 143 ; base exp yield
INCBIN "pic/bmon/wartortle.pic",0,1 ; 66, sprite dimensions
dw WartortlePicFront
dw WartortlePicBack
; attacks known at lvl 0
db TACKLE
db TAIL_WHIP
db BUBBLE
db 0
db 3 ; growth rate
; learnset
db %10110001
db %00111111
db %00001111
db %11001000
db %10000011
db %00001000
db %00110010
db 0 ; padding
