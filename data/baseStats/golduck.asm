db DEX_GOLDUCK ; pokedex id
db 80 ; base hp
db 82 ; base attack
db 78 ; base defense
db 85 ; base speed
db 80 ; base special
db WATER ; species type 1
db WATER ; species type 2
db 75 ; catch rate
db 174 ; base exp yield
INCBIN "pic/bmon/golduck.pic",0,1 ; 77, sprite dimensions
dw GolduckPicFront
dw GolduckPicBack
; attacks known at lvl 0
db SCRATCH
db TAIL_WHIP
db DISABLE
db 0
db 0 ; growth rate
; learnset
	tmlearn 1,5,6,8
	tmlearn 9,10,11,12,13,14,15,16
	tmlearn 17,18,19,20
	tmlearn 28,31,32
	tmlearn 34,39,40
	tmlearn 44
	tmlearn 50,53,54
db 0 ; padding
