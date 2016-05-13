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
	tmlearn 6,7,8
	tmlearn 9,10,11,12,13,14
	tmlearn 20,24
	tmlearn 25,31,32
	tmlearn 33,34,40
	tmlearn 44
	tmlearn 50
db 0 ; padding
