db DEX_TENTACOOL ; pokedex id
db 40 ; base hp
db 40 ; base attack
db 35 ; base defense
db 70 ; base speed
db 100 ; base special
db WATER ; species type 1
db POISON ; species type 2
db 190 ; catch rate
db 105 ; base exp yield
INCBIN "pic/bmon/tentacool.pic",0,1 ; 55, sprite dimensions
dw TentacoolPicFront
dw TentacoolPicBack
; attacks known at lvl 0
db ACID
db 0
db 0
db 0
db 5 ; growth rate
; learnset
	tmlearn 3,6
	tmlearn 9,10,11,12,13,14
	tmlearn 20,21
	tmlearn 31,32
	tmlearn 33,34,40
	tmlearn 44
	tmlearn 50,51,53
db 0 ; padding
