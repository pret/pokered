db DEX_DIGLETT ; pokedex id
db 10 ; base hp
db 55 ; base attack
db 25 ; base defense
db 95 ; base speed
db 45 ; base special
db GROUND ; species type 1
db GROUND ; species type 2
db 255 ; catch rate
db 81 ; base exp yield
INCBIN "pic/bmon/diglett.pic",0,1 ; 55, sprite dimensions
dw DiglettPicFront
dw DiglettPicBack
; attacks known at lvl 0
db SCRATCH
db 0
db 0
db 0
db 0 ; growth rate
; learnset
	tmlearn 6,8
	tmlearn 9,10
	tmlearn 20
	tmlearn 26,27,28,31,32
	tmlearn 34
	tmlearn 44,48
	tmlearn 50
db 0 ; padding
