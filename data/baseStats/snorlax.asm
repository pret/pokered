SnorlaxBaseStats: ; 39366 (e:5366)
db DEX_SNORLAX ; pokedex id
db 160 ; base hp
db 110 ; base attack
db 65 ; base defense
db 30 ; base speed
db 65 ; base special
db NORMAL ; species type 1
db NORMAL ; species type 2
db 25 ; catch rate
db 154 ; base exp yield
INCBIN "pic/bmon/snorlax.pic",0,1 ; 77, sprite dimensions
dw SnorlaxPicFront
dw SnorlaxPicBack
; attacks known at lvl 0
db HEADBUTT
db AMNESIA
db REST
db 0
db 5 ; growth rate
; learnset
	tmlearn 1,5,6,8
	tmlearn 9,10,11,12,13,14,15,16
	tmlearn 17,18,19,20,22,24
	tmlearn 25,26,27,29,31,32
	tmlearn 33,34,35,36,38,40
	tmlearn 44,46,48
	tmlearn 50,53,54
db 0 ; padding
