RhyhornBaseStats: ; 38fe6 (e:4fe6)
db DEX_RHYHORN ; pokedex id
db 80 ; base hp
db 85 ; base attack
db 95 ; base defense
db 25 ; base speed
db 30 ; base special
db GROUND ; species type 1
db ROCK ; species type 2
db 120 ; catch rate
db 135 ; base exp yield
INCBIN "pic/bmon/rhyhorn.pic",0,1 ; 77, sprite dimensions
dw RhyhornPicFront
dw RhyhornPicBack
; attacks known at lvl 0
db HORN_ATTACK
db 0
db 0
db 0
db 5 ; growth rate
; learnset
db %11100000
db %00000011
db %10001000
db %11001111
db %10100010
db %10001000
db %00100010
db 0 ; padding
