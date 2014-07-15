IvysaurBaseStats: ; 383fa (e:43fa)
db DEX_IVYSAUR ; pokedex id
db 60 ; base hp
db 62 ; base attack
db 63 ; base defense
db 60 ; base speed
db 80 ; base special
db GRASS ; species type 1
db POISON ; species type 2
db 45 ; catch rate
db 141 ; base exp yield
INCBIN "pic/bmon/ivysaur.pic",0,1 ; 66, sprite dimensions
dw IvysaurPicFront
dw IvysaurPicBack
; attacks known at lvl 0
db TACKLE
db GROWL
db LEECH_SEED
db 0
db 3 ; growth rate
; learnset
db %10100100
db %00000011
db %00111000
db %11000000
db %00000011
db %00001000
db %00000110
db 0 ; padding
