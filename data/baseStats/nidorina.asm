NidorinaBaseStats: ; 3870a (e:470a)
db DEX_NIDORINA ; pokedex id
db 70 ; base hp
db 62 ; base attack
db 67 ; base defense
db 56 ; base speed
db 55 ; base special
db POISON ; species type 1
db POISON ; species type 2
db 120 ; catch rate
db 117 ; base exp yield
INCBIN "pic/bmon/nidorina.pic",0,1 ; 66, sprite dimensions
dw NidorinaPicFront
dw NidorinaPicBack
; attacks known at lvl 0
db GROWL
db TACKLE
db SCRATCH
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
