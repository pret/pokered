db DEX_POLIWHIRL ; pokedex id
db 65 ; base hp
db 65 ; base attack
db 65 ; base defense
db 90 ; base speed
db 50 ; base special
db WATER ; species type 1
db WATER ; species type 2
db 120 ; catch rate
db 131 ; base exp yield
INCBIN "pic/bmon/poliwhirl.pic",0,1 ; 66, sprite dimensions
dw PoliwhirlPicFront
dw PoliwhirlPicBack
; attacks known at lvl 0
db BUBBLE
db HYPNOSIS
db WATER_GUN
db 0
db 3 ; growth rate
; learnset
	tmlearn 1,5,6,8
	tmlearn 9,10,11,12,13,14
	tmlearn 17,18,19,20
	tmlearn 26,27,29,31,32
	tmlearn 34,35,40
	tmlearn 44,46
	tmlearn 50,53,54
db 0 ; padding
