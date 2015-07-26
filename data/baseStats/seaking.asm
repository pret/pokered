SeakingBaseStats: ; 390c6 (e:50c6)
db DEX_SEAKING ; pokedex id
db 80 ; base hp
db 92 ; base attack
db 65 ; base defense
db 68 ; base speed
db 80 ; base special
db WATER ; species type 1
db WATER ; species type 2
db 60 ; catch rate
db 170 ; base exp yield
INCBIN "pic/bmon/seaking.pic",0,1 ; 77, sprite dimensions
dw SeakingPicFront
dw SeakingPicBack
; attacks known at lvl 0
db PECK
db TAIL_WHIP
db SUPERSONIC
db 0
db 0 ; growth rate
; learnset
	tmlearn 6,7
	tmlearn 9,10,11,12,13,14,15
	tmlearn 20
	tmlearn 31,32
	tmlearn 34,39,40
	tmlearn 44
	tmlearn 50,53
db 0 ; padding
