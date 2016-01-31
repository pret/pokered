db DEX_DRATINI ; pokedex id
db 41 ; base hp
db 64 ; base attack
db 45 ; base defense
db 50 ; base speed
db 50 ; base special
db DRAGON ; species type 1
db DRAGON ; species type 2
db 45 ; catch rate
db 67 ; base exp yield
INCBIN "pic/bmon/dratini.pic",0,1 ; 55, sprite dimensions
dw DratiniPicFront
dw DratiniPicBack
; attacks known at lvl 0
db WRAP
db LEER
db 0
db 0
db 5 ; growth rate
; learnset
	tmlearn 6,8
	tmlearn 9,10,11,12,13,14
	tmlearn 20,23,24
	tmlearn 25,31,32
	tmlearn 33,34,38,39,40
	tmlearn 44,45
	tmlearn 50,53
db 0 ; padding
