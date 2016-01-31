db DEX_SPEAROW ; pokedex id
db 40 ; base hp
db 60 ; base attack
db 30 ; base defense
db 70 ; base speed
db 31 ; base special
db NORMAL ; species type 1
db FLYING ; species type 2
db 255 ; catch rate
db 58 ; base exp yield
INCBIN "pic/bmon/spearow.pic",0,1 ; 55, sprite dimensions
dw SpearowPicFront
dw SpearowPicBack
; attacks known at lvl 0
db PECK
db GROWL
db 0
db 0
db 0 ; growth rate
; learnset
	tmlearn 2,4,6
	tmlearn 9,10
	tmlearn 20
	tmlearn 31,32
	tmlearn 34,39
	tmlearn 43,44
	tmlearn 50,52
db 0 ; padding
