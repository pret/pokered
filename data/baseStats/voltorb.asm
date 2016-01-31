db DEX_VOLTORB ; pokedex id
db 40 ; base hp
db 30 ; base attack
db 50 ; base defense
db 100 ; base speed
db 55 ; base special
db ELECTRIC ; species type 1
db ELECTRIC ; species type 2
db 190 ; catch rate
db 103 ; base exp yield
INCBIN "pic/bmon/voltorb.pic",0,1 ; 55, sprite dimensions
dw VoltorbPicFront
dw VoltorbPicBack
; attacks known at lvl 0
db TACKLE
db SCREECH
db 0
db 0
db 0 ; growth rate
; learnset
	tmlearn 6
	tmlearn 9
	tmlearn 20,24
	tmlearn 25,30,31,32
	tmlearn 33,34,36,39
	tmlearn 44,45,47
	tmlearn 50,55
db 0 ; padding
