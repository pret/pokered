NidorinoBaseStats: ; 3875e (e:475e)
db DEX_NIDORINO ; pokedex id
db 61 ; base hp
db 72 ; base attack
db 57 ; base defense
db 65 ; base speed
db 55 ; base special
db POISON ; species type 1
db POISON ; species type 2
db 120 ; catch rate
db 118 ; base exp yield
INCBIN "pic/bmon/nidorino.pic",0,1 ; 66, sprite dimensions
dw NidorinoPicFront
dw NidorinoPicBack
; attacks known at lvl 0
db LEER
db TACKLE
db HORN_ATTACK
db 0
db 3 ; growth rate
; learnset
db %11100000
db %00111111
db %10001000
db %11000001
db %10000011
db %00001000
db %00000010
db 0 ; padding
