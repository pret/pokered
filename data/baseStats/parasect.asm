ParasectBaseStats: ; 388e6 (e:48e6)
db DEX_PARASECT ; pokedex id
db 60 ; base hp
db 95 ; base attack
db 80 ; base defense
db 30 ; base speed
db 80 ; base special
db BUG ; species type 1
db GRASS ; species type 2
db 75 ; catch rate
db 128 ; base exp yield
INCBIN "pic/bmon/parasect.pic",0,1 ; 77, sprite dimensions
dw ParasectPicFront
dw ParasectPicBack
; attacks known at lvl 0
db SCRATCH
db STUN_SPORE
db LEECH_LIFE
db 0
db 0 ; growth rate
; learnset
	tmlearn 3,6,8
	tmlearn 9,10,15
	tmlearn 20,21,22
	tmlearn 28,31,32
	tmlearn 33,34,40
	tmlearn 44
	tmlearn 50,51
db 0 ; padding
