db DEX_GEODUDE ; pokedex id
db 40 ; base hp
db 80 ; base attack
db 100 ; base defense
db 20 ; base speed
db 30 ; base special
db ROCK ; species type 1
db GROUND ; species type 2
db 255 ; catch rate
db 86 ; base exp yield
INCBIN "pic/bmon/geodude.pic",0,1 ; 55, sprite dimensions
dw GeodudePicFront
dw GeodudePicBack
; attacks known at lvl 0
db TACKLE
db 0
db 0
db 0
db 3 ; growth rate
; learnset
	tmlearn 1,6,8
	tmlearn 9,10
	tmlearn 17,18,19,20
	tmlearn 26,27,28,31,32
	tmlearn 34,35,36,38
	tmlearn 44,47,48
	tmlearn 50,54
db 0 ; padding
