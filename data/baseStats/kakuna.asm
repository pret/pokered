KakunaBaseStats: ; 3854a (e:454a)
db DEX_KAKUNA ; pokedex id
db 45 ; base hp
db 25 ; base attack
db 50 ; base defense
db 35 ; base speed
db 25 ; base special
db BUG ; species type 1
db POISON ; species type 2
db 120 ; catch rate
db 71 ; base exp yield
INCBIN "pic/bmon/kakuna.pic",0,1 ; 55, sprite dimensions
dw KakunaPicFront
dw KakunaPicBack
; attacks known at lvl 0
db HARDEN
db 0
db 0
db 0
db 0 ; growth rate
; learnset
	tmlearn 0
	tmlearn 0
	tmlearn 0
	tmlearn 0
	tmlearn 0
	tmlearn 0
	tmlearn 0
db 0 ; padding
