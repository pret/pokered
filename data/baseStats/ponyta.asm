PonytaBaseStats: ; 38c2e (e:4c2e)
db DEX_PONYTA ; pokedex id
db 50 ; base hp
db 85 ; base attack
db 55 ; base defense
db 90 ; base speed
db 65 ; base special
db FIRE ; species type 1
db FIRE ; species type 2
db 190 ; catch rate
db 152 ; base exp yield
INCBIN "pic/bmon/ponyta.pic",0,1 ; 66, sprite dimensions
dw PonytaPicFront
dw PonytaPicBack
; attacks known at lvl 0
db EMBER
db 0
db 0
db 0
db 0 ; growth rate
; learnset
	tmlearn 6,7,8
	tmlearn 9,10
	tmlearn 20
	tmlearn 31,32
	tmlearn 33,34,38,39,40
	tmlearn 44
	tmlearn 50
db 0 ; padding
