CharizardBaseStats: ; 3846a (e:446a)
db DEX_CHARIZARD ; pokedex id
db 78 ; base hp
db 84 ; base attack
db 78 ; base defense
db 100 ; base speed
db 85 ; base special
db FIRE ; species type 1
db FLYING ; species type 2
db 45 ; catch rate
db 209 ; base exp yield
INCBIN "pic/bmon/charizard.pic",0,1 ; 77, sprite dimensions
dw CharizardPicFront
dw CharizardPicBack
; attacks known at lvl 0
db SCRATCH
db GROWL
db EMBER
db LEER
db 3 ; growth rate
; learnset
db %10110101
db %01000011
db %01001111
db %11001110
db %11100011
db %00001000
IF !_YELLOW
	db %00100110
ENDC
IF _YELLOW
	db %00101110
ENDC
db 0 ; padding
