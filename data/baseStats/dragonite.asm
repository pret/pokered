db DEX_DRAGONITE ; pokedex id
db 91 ; base hp
db 134 ; base attack
db 95 ; base defense
db 80 ; base speed
db 100 ; base special
db DRAGON ; species type 1
db FLYING ; species type 2
db 45 ; catch rate
db 218 ; base exp yield
INCBIN "pic/bmon/dragonite.pic",0,1 ; 77, sprite dimensions
dw DragonitePicFront
dw DragonitePicBack
; attacks known at lvl 0
db WRAP
db LEER
db THUNDER_WAVE
db AGILITY
db 5 ; growth rate
; learnset
	tmlearn 2,6,7,8
	tmlearn 9,10,11,12,13,14,15
	tmlearn 20,23,24
	tmlearn 25,31,32
	tmlearn 33,34,38,39,40
	tmlearn 44,45
	tmlearn 50,53,54
db 0 ; padding
