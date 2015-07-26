VulpixBaseStats: ; 387ce (e:47ce)
db DEX_VULPIX ; pokedex id
db 38 ; base hp
db 41 ; base attack
db 40 ; base defense
db 65 ; base speed
db 65 ; base special
db FIRE ; species type 1
db FIRE ; species type 2
db 190 ; catch rate
db 63 ; base exp yield
INCBIN "pic/bmon/vulpix.pic",0,1 ; 66, sprite dimensions
dw VulpixPicFront
dw VulpixPicBack
; attacks known at lvl 0
db EMBER
db TAIL_WHIP
db 0
db 0
db 0 ; growth rate
; learnset
	tmlearn 6,8
	tmlearn 9,10
	tmlearn 20
	tmlearn 28,31,32
	tmlearn 33,34,38,39,40
	tmlearn 44
	tmlearn 50
db 0 ; padding
