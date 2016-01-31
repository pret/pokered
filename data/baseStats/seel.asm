db DEX_SEEL ; pokedex id
db 65 ; base hp
db 45 ; base attack
db 55 ; base defense
db 45 ; base speed
db 70 ; base special
db WATER ; species type 1
db WATER ; species type 2
db 190 ; catch rate
db 100 ; base exp yield
INCBIN "pic/bmon/seel.pic",0,1 ; 66, sprite dimensions
dw SeelPicFront
dw SeelPicBack
; attacks known at lvl 0
db HEADBUTT
db 0
db 0
db 0
db 0 ; growth rate
; learnset
	tmlearn 6,7,8
	tmlearn 9,10,11,12,13,14,16
	tmlearn 20
	tmlearn 31,32
	tmlearn 34,40
	tmlearn 44
	tmlearn 50,53,54
db 0 ; padding
