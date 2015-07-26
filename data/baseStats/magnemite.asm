MagnemiteBaseStats: ; 38c9e (e:4c9e)
db DEX_MAGNEMITE ; pokedex id
db 25 ; base hp
db 35 ; base attack
db 70 ; base defense
db 45 ; base speed
db 95 ; base special
db ELECTRIC ; species type 1
db ELECTRIC ; species type 2
db 190 ; catch rate
db 89 ; base exp yield
INCBIN "pic/bmon/magnemite.pic",0,1 ; 55, sprite dimensions
dw MagnemitePicFront
dw MagnemitePicBack
; attacks known at lvl 0
db TACKLE
db 0
db 0
db 0
db 0 ; growth rate
; learnset
	tmlearn 6
	tmlearn 9,10
	tmlearn 20,24
	tmlearn 25,30,31,32
	tmlearn 33,34,39
	tmlearn 44,45
	tmlearn 50,55
db 0 ; padding
