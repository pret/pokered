NidoranFBaseStats: ; 386ee (e:46ee)
db DEX_NIDORAN_F ; pokedex id
db 55 ; base hp
db 47 ; base attack
db 52 ; base defense
db 41 ; base speed
db 40 ; base special
db POISON ; species type 1
db POISON ; species type 2
db 235 ; catch rate
db 59 ; base exp yield
INCBIN "pic/bmon/nidoranf.pic",0,1 ; 55, sprite dimensions
dw NidoranFPicFront
dw NidoranFPicBack
; attacks known at lvl 0
db GROWL
db TACKLE
db 0
db 0
db 3 ; growth rate
; learnset
db %10100000
db %00100011
db %10001000
db %11000001
db %10000011
db %00001000
db %00000010
db 0 ; padding
