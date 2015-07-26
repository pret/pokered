PorygonBaseStats: ; 392be (e:52be)
db DEX_PORYGON ; pokedex id
db 65 ; base hp
db 60 ; base attack
db 70 ; base defense
db 40 ; base speed
db 75 ; base special
db NORMAL ; species type 1
db NORMAL ; species type 2
db 45 ; catch rate
db 130 ; base exp yield
INCBIN "pic/bmon/porygon.pic",0,1 ; 66, sprite dimensions
dw PorygonPicFront
dw PorygonPicBack
; attacks known at lvl 0
db TACKLE
db SHARPEN
db CONVERSION
db 0
db 0 ; growth rate
; learnset
	tmlearn 6
	tmlearn 9,10,13,14,15
	tmlearn 20,24
	tmlearn 25,29,30,31,32
	tmlearn 33,34,39,40
	tmlearn 44,45,46
	tmlearn 49,50,55
db 0 ; padding
