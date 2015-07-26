SlowpokeBaseStats: ; 38c66 (e:4c66)
db DEX_SLOWPOKE ; pokedex id
db 90 ; base hp
db 65 ; base attack
db 65 ; base defense
db 15 ; base speed
db 40 ; base special
db WATER ; species type 1
db PSYCHIC ; species type 2
db 190 ; catch rate
db 99 ; base exp yield
INCBIN "pic/bmon/slowpoke.pic",0,1 ; 55, sprite dimensions
dw SlowpokePicFront
dw SlowpokePicBack
; attacks known at lvl 0
db CONFUSION
db 0
db 0
db 0
db 0 ; growth rate
; learnset
	tmlearn 6,8
	tmlearn 9,10,11,12,13,14,16
	tmlearn 20
	tmlearn 26,27,28,29,30,31,32
	tmlearn 33,34,38,39,40
	tmlearn 44,45,46
	tmlearn 49,50,53,54,55
db 0 ; padding
