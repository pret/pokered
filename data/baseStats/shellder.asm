db DEX_SHELLDER ; pokedex id
db 30 ; base hp
db 65 ; base attack
db 100 ; base defense
db 40 ; base speed
db 45 ; base special
db WATER ; species type 1
db WATER ; species type 2
db 190 ; catch rate
db 97 ; base exp yield
INCBIN "pic/bmon/shellder.pic",0,1 ; 55, sprite dimensions
dw ShellderPicFront
dw ShellderPicBack
; attacks known at lvl 0
db TACKLE
db WITHDRAW
db 0
db 0
db 5 ; growth rate
; learnset
	tmlearn 6
	tmlearn 9,10,11,12,13,14
	tmlearn 20
	tmlearn 30,31,32
	tmlearn 33,34,36,39
	tmlearn 44,47
	tmlearn 49,50,53
db 0 ; padding
